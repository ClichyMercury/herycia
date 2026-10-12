import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_exception.dart';
import '../../../core/api/api_providers.dart';
import '../../catalog/application/catalog_providers.dart';
import '../../catalog/domain/catalog_models.dart';
import '../../looks/application/looks_providers.dart';
import '../../looks/domain/look_models.dart';
import '../data/api_recommendation_repository.dart';
import '../domain/engine/catalog_index.dart';
import '../domain/engine/outfit_evaluator.dart';
import '../domain/engine/recommender.dart';
import '../domain/recommendation_models.dart';
import '../domain/recommendation_repository.dart';

class OfflineEngine {
  OfflineEngine({required this.index, required this.looks})
      : evaluator = OutfitEvaluator(index) {
    recommender = Recommender(evaluator);
    improver = Improver(evaluator);
  }

  final CatalogIndex index;
  final List<Look> looks;
  final OutfitEvaluator evaluator;
  late final Recommender recommender;
  late final Improver improver;
  int _sequence = 0;

  String nextRequestId() => 'offline_${++_sequence}';

  List<EnginePiece> piecesOf(List<RequestItem> items) => [
        for (final i in items)
          if (index.typesById[i.clothingTypeId] case final type?)
            if (index.colorsById[i.colorId] case final color?) EnginePiece(type: type, color: color, role: i.role),
      ];

  Occasion? occasion(String? slug) => slug == null ? null : index.occasionsBySlug[slug];

  OutfitStyle? style(String? slug) => slug == null ? null : index.stylesBySlug[slug];
}

final offlineEngineProvider = FutureProvider<OfflineEngine>((ref) async {
  final catalog = ref.watch(catalogRepositoryProvider);
  final looksRepo = ref.watch(looksRepositoryProvider);
  final (version, categories, types, colors, styles, occasions, pairs, rules) = await (
    catalog.version(),
    catalog.categories(),
    catalog.types(),
    catalog.colors(),
    catalog.styles(),
    catalog.occasions(),
    catalog.colorPairingRules(),
    catalog.recommendationRules(),
  ).wait;
  final looks = <Look>[];
  var page = 1;
  while (true) {
    final result = await looksRepo.list(LookQuery(page: page, perPage: 50));
    looks.addAll(result.data);
    if (!result.hasMore) break;
    page++;
  }
  return OfflineEngine(
    index: CatalogIndex(
      categories: categories,
      types: types,
      colors: colors,
      styles: styles,
      occasions: occasions,
      pairingRules: pairs,
      recommendationRules: rules,
      catalogVersion: version.catalogVersion,
      rulesVersion: version.rulesVersion,
    ),
    looks: looks,
  );
});

class OfflineAwareRecommendationRepository implements RecommendationRepository {
  OfflineAwareRecommendationRepository(this.remote, this.engine);

  final RecommendationRepository remote;
  final OfflineEngine? Function() engine;

  Future<T> _withFallback<T>(Future<T> Function() online, T Function(OfflineEngine engine) offline) async {
    try {
      return await online();
    } on NetworkUnavailableException {
      final local = engine();
      if (local == null) rethrow;
      return offline(local);
    }
  }

  @override
  Future<FromItemResponse> fromItem(FromItemRequest request) => _withFallback(
        () => remote.fromItem(request),
        (e) {
          final type = e.index.typesById[request.clothingTypeId];
          final color = e.index.colorsById[request.colorId];
          if (type == null || color == null) throw const NetworkUnavailableException();
          final outcome = e.recommender.fromItem(
            anchorType: type,
            anchorColor: color,
            looks: e.looks,
            occasion: e.occasion(request.occasionSlug),
            style: e.style(request.styleSlug),
            limit: request.limit,
          );
          return FromItemResponse(
            requestId: e.nextRequestId(),
            catalogVersion: e.index.catalogVersion,
            rulesVersion: e.index.rulesVersion,
            computedOffline: true,
            broadened: outcome.broadened,
            results: [for (final r in outcome.results) r.copyWith(image: null)],
          );
        },
      );

  @override
  Future<EvaluationResponse> evaluate(OutfitRequest request) => _withFallback(
        () => remote.evaluate(request),
        (e) {
          final pieces = e.piecesOf(request.items);
          final occasion = e.occasion(request.occasionSlug);
          final style = e.style(request.styleSlug);
          final result = e.evaluator.evaluate(pieces, occasion: occasion, style: style);
          return EvaluationResponse(
            requestId: e.nextRequestId(),
            rulesVersion: e.index.rulesVersion,
            computedOffline: true,
            score: result.score,
            breakdown: result.breakdown,
            explanation: result.explanation,
            strengths: result.strengths,
            warnings: result.warnings,
            suggestions: result.hasStructuralIssue
                ? const []
                : e.improver.improve(pieces, occasion: occasion, style: style, limit: 3),
          );
        },
      );

  @override
  Future<ImprovementResponse> improve(OutfitRequest request) => _withFallback(
        () => remote.improve(request),
        (e) {
          final pieces = e.piecesOf(request.items);
          final occasion = e.occasion(request.occasionSlug);
          final style = e.style(request.styleSlug);
          return ImprovementResponse(
            requestId: e.nextRequestId(),
            rulesVersion: e.index.rulesVersion,
            computedOffline: true,
            currentScore: e.evaluator.evaluate(pieces, occasion: occasion, style: style).score,
            improvements: e.improver.improve(pieces, occasion: occasion, style: style),
          );
        },
      );

  @override
  Future<FeedbackReceipt> sendFeedback(String requestId, FeedbackRequest feedback) =>
      remote.sendFeedback(requestId, feedback);
}

final remoteRecommendationRepositoryProvider = Provider<RecommendationRepository>(
  (ref) => ApiRecommendationRepository(ref.watch(apiClientProvider)),
);
