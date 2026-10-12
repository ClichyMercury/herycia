import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/json/id_converter.dart';
import '../../looks/domain/look_models.dart';

part 'recommendation_models.freezed.dart';
part 'recommendation_models.g.dart';

@freezed
abstract class RequestItem with _$RequestItem {
  const factory RequestItem({
    @IdConverter() required String clothingTypeId,
    @IdConverter() required String colorId,
    required PieceRole role,
  }) = _RequestItem;

  factory RequestItem.fromJson(Map<String, dynamic> json) => _$RequestItemFromJson(json);
}

@freezed
abstract class FromItemRequest with _$FromItemRequest {
  const factory FromItemRequest({
    @IdConverter() required String clothingTypeId,
    @IdConverter() required String colorId,
    String? occasionSlug,
    String? styleSlug,
    @Default(5) int limit,
  }) = _FromItemRequest;

  factory FromItemRequest.fromJson(Map<String, dynamic> json) => _$FromItemRequestFromJson(json);
}

@freezed
abstract class OutfitRequest with _$OutfitRequest {
  const factory OutfitRequest({
    required List<RequestItem> items,
    String? occasionSlug,
    String? styleSlug,
  }) = _OutfitRequest;

  factory OutfitRequest.fromJson(Map<String, dynamic> json) => _$OutfitRequestFromJson(json);
}

@freezed
abstract class ScoreBreakdown with _$ScoreBreakdown {
  const ScoreBreakdown._();

  const factory ScoreBreakdown({
    required int color,
    required int structure,
    required int occasion,
    required int style,
    required int completeness,
  }) = _ScoreBreakdown;

  factory ScoreBreakdown.fromJson(Map<String, dynamic> json) => _$ScoreBreakdownFromJson(json);

  static const maxColor = 40;
  static const maxStructure = 25;
  static const maxOccasion = 15;
  static const maxStyle = 10;
  static const maxCompleteness = 10;

  int get total => color + structure + occasion + style + completeness;
}

enum RemarkKind {
  @JsonValue('structural')
  structural,
  @JsonValue('style')
  style,
}

@freezed
abstract class Remark with _$Remark {
  const factory Remark({
    required RemarkKind kind,
    required String code,
    required String message,
    @Default([]) List<PieceRole> roles,
  }) = _Remark;

  factory Remark.fromJson(Map<String, dynamic> json) => _$RemarkFromJson(json);
}

@freezed
abstract class Improvement with _$Improvement {
  const factory Improvement({
    required PieceRole role,
    @IdConverter() required String clothingTypeId,
    @IdConverter() required String fromColorId,
    @IdConverter() required String toColorId,
    required int newScore,
    required int gain,
    required String explanation,
  }) = _Improvement;

  factory Improvement.fromJson(Map<String, dynamic> json) => _$ImprovementFromJson(json);
}

@freezed
abstract class RecommendedItem with _$RecommendedItem {
  const factory RecommendedItem({
    @IdConverter() required String clothingTypeId,
    @IdConverter() required String colorId,
    required PieceRole role,
    @Default(false) bool isAnchor,
  }) = _RecommendedItem;

  factory RecommendedItem.fromJson(Map<String, dynamic> json) => _$RecommendedItemFromJson(json);
}

@freezed
abstract class RecommendedLook with _$RecommendedLook {
  const factory RecommendedLook({
    @NullableIdConverter() String? outfitId,
    required String title,
    required int score,
    required ScoreBreakdown breakdown,
    required String explanation,
    required List<RecommendedItem> items,
    LookImage? image,
  }) = _RecommendedLook;

  factory RecommendedLook.fromJson(Map<String, dynamic> json) => _$RecommendedLookFromJson(json);
}

enum BroadeningCriterion {
  @JsonValue('style')
  style,
  @JsonValue('occasion')
  occasion,
  @JsonValue('neighbor_shades')
  neighborShades,
  @JsonValue('neutral_advice')
  neutralAdvice,
}

@freezed
abstract class BroadeningStep with _$BroadeningStep {
  const factory BroadeningStep({
    required BroadeningCriterion criterion,
    required String message,
  }) = _BroadeningStep;

  factory BroadeningStep.fromJson(Map<String, dynamic> json) => _$BroadeningStepFromJson(json);
}

@freezed
abstract class FromItemResponse with _$FromItemResponse {
  const factory FromItemResponse({
    required String requestId,
    required String catalogVersion,
    required String rulesVersion,
    @Default(false) bool computedOffline,
    @Default([]) List<BroadeningStep> broadened,
    required List<RecommendedLook> results,
  }) = _FromItemResponse;

  factory FromItemResponse.fromJson(Map<String, dynamic> json) => _$FromItemResponseFromJson(json);
}

@freezed
abstract class EvaluationResponse with _$EvaluationResponse {
  const factory EvaluationResponse({
    required String requestId,
    required String rulesVersion,
    @Default(false) bool computedOffline,
    required int score,
    required ScoreBreakdown breakdown,
    required String explanation,
    required List<String> strengths,
    required List<Remark> warnings,
    required List<Improvement> suggestions,
  }) = _EvaluationResponse;

  factory EvaluationResponse.fromJson(Map<String, dynamic> json) =>
      _$EvaluationResponseFromJson(json);
}

@freezed
abstract class ImprovementResponse with _$ImprovementResponse {
  const factory ImprovementResponse({
    required String requestId,
    required String rulesVersion,
    @Default(false) bool computedOffline,
    required int currentScore,
    required List<Improvement> improvements,
  }) = _ImprovementResponse;

  factory ImprovementResponse.fromJson(Map<String, dynamic> json) =>
      _$ImprovementResponseFromJson(json);
}

@freezed
abstract class FeedbackRequest with _$FeedbackRequest {
  const factory FeedbackRequest({
    required bool isHelpful,
    @NullableIdConverter() String? outfitId,
    String? comment,
  }) = _FeedbackRequest;

  factory FeedbackRequest.fromJson(Map<String, dynamic> json) => _$FeedbackRequestFromJson(json);

  static const maxCommentLength = 500;
}

@freezed
abstract class FeedbackReceipt with _$FeedbackReceipt {
  const factory FeedbackReceipt({
    @IdConverter() required String id,
    required String requestId,
    @UtcDateTimeConverter() required DateTime createdAt,
  }) = _FeedbackReceipt;

  factory FeedbackReceipt.fromJson(Map<String, dynamic> json) => _$FeedbackReceiptFromJson(json);
}
