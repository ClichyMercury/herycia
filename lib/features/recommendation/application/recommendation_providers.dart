import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/recommendation_models.dart';
import 'offline_engine.dart';
import '../domain/recommendation_repository.dart';

final recommendationRepositoryProvider = Provider<RecommendationRepository>(
  (ref) => OfflineAwareRecommendationRepository(
    ref.watch(remoteRecommendationRepositoryProvider),
    () => ref.read(offlineEngineProvider).value,
  ),
);

final evaluationProvider = FutureProvider.autoDispose.family<EvaluationResponse, OutfitRequest>(
  (ref, request) => ref.watch(recommendationRepositoryProvider).evaluate(request),
);

final fromItemProvider = FutureProvider.autoDispose.family<FromItemResponse, FromItemRequest>(
  (ref, request) => ref.watch(recommendationRepositoryProvider).fromItem(request),
);
