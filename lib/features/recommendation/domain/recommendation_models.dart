import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/json/id_converter.dart';
import '../../catalog/domain/catalog_models.dart';
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
abstract class ScorePart with _$ScorePart {
  const factory ScorePart({required int points, required int max}) = _ScorePart;

  factory ScorePart.fromJson(Map<String, dynamic> json) => _$ScorePartFromJson(json);
}

@freezed
abstract class ScoreBreakdown with _$ScoreBreakdown {
  const ScoreBreakdown._();

  const factory ScoreBreakdown({
    required ScorePart color,
    required ScorePart structure,
    required ScorePart occasion,
    required ScorePart style,
    required ScorePart completeness,
  }) = _ScoreBreakdown;

  factory ScoreBreakdown.fromJson(Map<String, dynamic> json) => _$ScoreBreakdownFromJson(json);

  int get total => color.points + structure.points + occasion.points + style.points + completeness.points;
}

@freezed
abstract class StartingItem with _$StartingItem {
  const factory StartingItem({
    required CatalogRef clothingType,
    required ColorRef color,
    required PieceRole role,
  }) = _StartingItem;

  factory StartingItem.fromJson(Map<String, dynamic> json) => _$StartingItemFromJson(json);
}

@freezed
abstract class AppliedFilters with _$AppliedFilters {
  const factory AppliedFilters({String? occasionSlug, String? styleSlug}) = _AppliedFilters;

  factory AppliedFilters.fromJson(Map<String, dynamic> json) => _$AppliedFiltersFromJson(json);
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
abstract class Broadening with _$Broadening {
  const factory Broadening({
    @Default(false) bool applied,
    @Default([]) List<BroadeningCriterion> steps,
  }) = _Broadening;

  factory Broadening.fromJson(Map<String, dynamic> json) => _$BroadeningFromJson(json);
}

@freezed
abstract class RecommendedItem with _$RecommendedItem {
  const factory RecommendedItem({
    required CatalogRef clothingType,
    required ColorRef color,
    required PieceRole role,
    @Default(true) bool isRequired,
    @Default(false) bool isStartingItem,
  }) = _RecommendedItem;

  factory RecommendedItem.fromJson(Map<String, dynamic> json) => _$RecommendedItemFromJson(json);
}

@freezed
abstract class RecommendedLook with _$RecommendedLook {
  const factory RecommendedLook({
    @IdConverter() required String outfitId,
    required String title,
    required int score,
    required ScoreBreakdown scoreBreakdown,
    required String explanation,
    required List<RecommendedItem> items,
    LookImage? image,
  }) = _RecommendedLook;

  factory RecommendedLook.fromJson(Map<String, dynamic> json) => _$RecommendedLookFromJson(json);
}

@freezed
abstract class ColorAdvice with _$ColorAdvice {
  const factory ColorAdvice({
    required String text,
    @IdListConverter() @Default([]) List<String> colorIds,
  }) = _ColorAdvice;

  factory ColorAdvice.fromJson(Map<String, dynamic> json) => _$ColorAdviceFromJson(json);
}

@freezed
abstract class FromItemResponse with _$FromItemResponse {
  const factory FromItemResponse({
    required String requestId,
    required int catalogVersion,
    required int rulesVersion,
    required StartingItem startingItem,
    @Default(AppliedFilters()) AppliedFilters filters,
    @Default(Broadening()) Broadening broadened,
    required List<RecommendedLook> results,
    @Default([]) List<ColorAdvice> advice,
    @JsonKey(includeFromJson: false, includeToJson: false) DateTime? cachedAt,
  }) = _FromItemResponse;

  factory FromItemResponse.fromJson(Map<String, dynamic> json) => _$FromItemResponseFromJson(json);
}

@freezed
abstract class TextNote with _$TextNote {
  const factory TextNote({required String text}) = _TextNote;

  factory TextNote.fromJson(Map<String, dynamic> json) => _$TextNoteFromJson(json);
}

enum WarningType {
  @JsonValue('structure')
  structure,
  @JsonValue('preference')
  preference,
}

@freezed
abstract class OutfitWarning with _$OutfitWarning {
  const factory OutfitWarning({
    required WarningType type,
    required String text,
    @Default([]) List<int> itemIndexes,
  }) = _OutfitWarning;

  factory OutfitWarning.fromJson(Map<String, dynamic> json) => _$OutfitWarningFromJson(json);
}

@freezed
abstract class EvaluationResponse with _$EvaluationResponse {
  const factory EvaluationResponse({
    required String requestId,
    required int catalogVersion,
    required int rulesVersion,
    required int score,
    required ScoreBreakdown scoreBreakdown,
    @Default(false) bool isComplete,
    @Default([]) List<TextNote> strengths,
    @Default([]) List<OutfitWarning> warnings,
    @Default([]) List<TextNote> suggestions,
    @JsonKey(includeFromJson: false, includeToJson: false) DateTime? cachedAt,
  }) = _EvaluationResponse;

  factory EvaluationResponse.fromJson(Map<String, dynamic> json) => _$EvaluationResponseFromJson(json);
}

enum ChangeAction {
  @JsonValue('add_item')
  addItem,
  @JsonValue('replace_item')
  replaceItem,
  @JsonValue('remove_item')
  removeItem,
}

@freezed
abstract class OutfitChange with _$OutfitChange {
  const factory OutfitChange({
    required ChangeAction action,
    int? itemIndex,
    RequestItem? item,
  }) = _OutfitChange;

  factory OutfitChange.fromJson(Map<String, dynamic> json) => _$OutfitChangeFromJson(json);
}

@freezed
abstract class Improvement with _$Improvement {
  const factory Improvement({
    required String text,
    required OutfitChange change,
    required int resultingScore,
  }) = _Improvement;

  factory Improvement.fromJson(Map<String, dynamic> json) => _$ImprovementFromJson(json);
}

@freezed
abstract class ImprovementResponse with _$ImprovementResponse {
  const factory ImprovementResponse({
    required String requestId,
    required int catalogVersion,
    required int rulesVersion,
    required int currentScore,
    @Default([]) List<Improvement> improvements,
    @JsonKey(includeFromJson: false, includeToJson: false) DateTime? cachedAt,
  }) = _ImprovementResponse;

  factory ImprovementResponse.fromJson(Map<String, dynamic> json) => _$ImprovementResponseFromJson(json);
}

@freezed
abstract class FeedbackRequest with _$FeedbackRequest {
  const factory FeedbackRequest({
    @NullableIdConverter() String? outfitId,
    int? rating,
    bool? isHelpful,
    String? comment,
  }) = _FeedbackRequest;

  factory FeedbackRequest.fromJson(Map<String, dynamic> json) => _$FeedbackRequestFromJson(json);

  static const maxCommentLength = 500;
}

@freezed
abstract class FeedbackReceipt with _$FeedbackReceipt {
  const factory FeedbackReceipt({
    required String requestId,
    @NullableIdConverter() String? outfitId,
    int? rating,
    bool? isHelpful,
    String? comment,
    @UtcDateTimeConverter() required DateTime createdAt,
  }) = _FeedbackReceipt;

  factory FeedbackReceipt.fromJson(Map<String, dynamic> json) => _$FeedbackReceiptFromJson(json);
}
