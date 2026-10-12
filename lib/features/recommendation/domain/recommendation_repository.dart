import 'recommendation_models.dart';

abstract interface class RecommendationRepository {
  Future<FromItemResponse> fromItem(FromItemRequest request);

  Future<EvaluationResponse> evaluate(OutfitRequest request);

  Future<ImprovementResponse> improve(OutfitRequest request);

  Future<FeedbackReceipt> sendFeedback(String requestId, FeedbackRequest feedback);
}
