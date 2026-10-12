import '../../../core/api/api_client.dart';
import '../domain/recommendation_models.dart';
import '../domain/recommendation_repository.dart';

class ApiRecommendationRepository implements RecommendationRepository {
  const ApiRecommendationRepository(this.client);

  final ApiClient client;

  @override
  Future<FromItemResponse> fromItem(FromItemRequest request) async => FromItemResponse.fromJson(
        (await client.post('/recommendations/from-item', body: request.toJson())).dataMap,
      );

  @override
  Future<EvaluationResponse> evaluate(OutfitRequest request) async => EvaluationResponse.fromJson(
        (await client.post('/recommendations/evaluate-outfit', body: request.toJson())).dataMap,
      );

  @override
  Future<ImprovementResponse> improve(OutfitRequest request) async => ImprovementResponse.fromJson(
        (await client.post('/recommendations/improve-outfit', body: request.toJson())).dataMap,
      );

  @override
  Future<FeedbackReceipt> sendFeedback(String requestId, FeedbackRequest feedback) async =>
      FeedbackReceipt.fromJson(
        (await client.post('/recommendations/$requestId/feedback', body: feedback.toJson())).dataMap,
      );
}
