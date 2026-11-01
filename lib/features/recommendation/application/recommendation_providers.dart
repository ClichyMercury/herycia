import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_providers.dart';
import '../../../core/storage/storage_providers.dart';
import '../../catalog/application/catalog_providers.dart';
import '../../catalog/domain/catalog_models.dart';
import '../data/api_recommendation_repository.dart';
import '../domain/recommendation_models.dart';
import '../domain/recommendation_repository.dart';

final recommendationRepositoryProvider = Provider<RecommendationRepository>(
  (ref) => ApiRecommendationRepository(ref.watch(apiClientProvider), ref.watch(responseCacheProvider)),
);

final evaluationProvider = FutureProvider.autoDispose.family<EvaluationResponse, OutfitRequest>(
  (ref, request) => ref.watch(recommendationRepositoryProvider).evaluate(request),
);

final improvementProvider = FutureProvider.autoDispose.family<ImprovementResponse, OutfitRequest>(
  (ref, request) => ref.watch(recommendationRepositoryProvider).improve(request),
);

final fromItemProvider = FutureProvider.autoDispose.family<FromItemResponse, FromItemRequest>(
  (ref, request) => ref.watch(recommendationRepositoryProvider).fromItem(request),
);

final colorHintsProvider = FutureProvider.autoDispose.family<List<(CatalogColor, ColorPartner)>, String>((ref, colorId) async {
  final (guide, colors) = await (ref.watch(colorGuideProvider.future), ref.watch(colorsProvider.future)).wait;
  final byId = {for (final c in colors) c.id: c};
  return [
    for (final partner in guide.partnersOf(colorId))
      if (byId[partner.colorId] case final color?) (color, partner),
  ].take(6).toList();
});
