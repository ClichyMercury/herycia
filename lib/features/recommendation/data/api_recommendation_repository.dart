import '../../../core/api/api_client.dart';
import '../../../core/storage/response_cache.dart';
import '../domain/recommendation_models.dart';
import '../domain/recommendation_repository.dart';

class ApiRecommendationRepository implements RecommendationRepository {
  const ApiRecommendationRepository(this.client, this.cache);

  final ApiClient client;
  final ResponseCache cache;

  Future<(Map<String, dynamic>, DateTime?)> _post(String path, Map<String, dynamic> body) async {
    final result = await cache.networkFirst('reco:$path:${canonicalKey(body)}', () => client.post(path, body: body));
    return (result.body.dataMap, result.cachedAt);
  }

  @override
  Future<FromItemResponse> fromItem(FromItemRequest request) async {
    final (json, cachedAt) = await _post('/recommendations/from-item', request.toJson());
    return FromItemResponse.fromJson(json).copyWith(cachedAt: cachedAt);
  }

  @override
  Future<EvaluationResponse> evaluate(OutfitRequest request) async {
    final (json, cachedAt) = await _post('/recommendations/evaluate-outfit', request.toJson());
    return EvaluationResponse.fromJson(json).copyWith(cachedAt: cachedAt);
  }

  @override
  Future<ImprovementResponse> improve(OutfitRequest request) async {
    final (json, cachedAt) = await _post('/recommendations/improve-outfit', request.toJson());
    return ImprovementResponse.fromJson(json).copyWith(cachedAt: cachedAt);
  }

  @override
  Future<FeedbackReceipt> sendFeedback(String requestId, FeedbackRequest feedback) async => FeedbackReceipt.fromJson(
        (await client.post('/recommendations/${Uri.encodeComponent(requestId)}/feedback', body: feedback.toJson()))
            .dataMap,
      );
}
