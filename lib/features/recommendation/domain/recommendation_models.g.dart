// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RequestItem _$RequestItemFromJson(Map<String, dynamic> json) => _RequestItem(
  clothingTypeId: const IdConverter().fromJson(
    json['clothing_type_id'] as Object,
  ),
  colorId: const IdConverter().fromJson(json['color_id'] as Object),
  role: $enumDecode(_$PieceRoleEnumMap, json['role']),
);

Map<String, dynamic> _$RequestItemToJson(_RequestItem instance) =>
    <String, dynamic>{
      'clothing_type_id': const IdConverter().toJson(instance.clothingTypeId),
      'color_id': const IdConverter().toJson(instance.colorId),
      'role': _$PieceRoleEnumMap[instance.role]!,
    };

const _$PieceRoleEnumMap = {
  PieceRole.top: 'top',
  PieceRole.bottom: 'bottom',
  PieceRole.onePiece: 'one_piece',
  PieceRole.footwear: 'footwear',
  PieceRole.accessory: 'accessory',
  PieceRole.outerwear: 'outerwear',
};

_FromItemRequest _$FromItemRequestFromJson(Map<String, dynamic> json) =>
    _FromItemRequest(
      clothingTypeId: const IdConverter().fromJson(
        json['clothing_type_id'] as Object,
      ),
      colorId: const IdConverter().fromJson(json['color_id'] as Object),
      occasionSlug: json['occasion_slug'] as String?,
      styleSlug: json['style_slug'] as String?,
      limit: (json['limit'] as num?)?.toInt() ?? 5,
    );

Map<String, dynamic> _$FromItemRequestToJson(_FromItemRequest instance) =>
    <String, dynamic>{
      'clothing_type_id': const IdConverter().toJson(instance.clothingTypeId),
      'color_id': const IdConverter().toJson(instance.colorId),
      'occasion_slug': instance.occasionSlug,
      'style_slug': instance.styleSlug,
      'limit': instance.limit,
    };

_OutfitRequest _$OutfitRequestFromJson(Map<String, dynamic> json) =>
    _OutfitRequest(
      items: (json['items'] as List<dynamic>)
          .map((e) => RequestItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      occasionSlug: json['occasion_slug'] as String?,
      styleSlug: json['style_slug'] as String?,
    );

Map<String, dynamic> _$OutfitRequestToJson(_OutfitRequest instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'occasion_slug': instance.occasionSlug,
      'style_slug': instance.styleSlug,
    };

_ScorePart _$ScorePartFromJson(Map<String, dynamic> json) => _ScorePart(
  points: (json['points'] as num).toInt(),
  max: (json['max'] as num).toInt(),
);

Map<String, dynamic> _$ScorePartToJson(_ScorePart instance) =>
    <String, dynamic>{'points': instance.points, 'max': instance.max};

_ScoreBreakdown _$ScoreBreakdownFromJson(Map<String, dynamic> json) =>
    _ScoreBreakdown(
      color: ScorePart.fromJson(json['color'] as Map<String, dynamic>),
      structure: ScorePart.fromJson(json['structure'] as Map<String, dynamic>),
      occasion: ScorePart.fromJson(json['occasion'] as Map<String, dynamic>),
      style: ScorePart.fromJson(json['style'] as Map<String, dynamic>),
      completeness: ScorePart.fromJson(
        json['completeness'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ScoreBreakdownToJson(_ScoreBreakdown instance) =>
    <String, dynamic>{
      'color': instance.color.toJson(),
      'structure': instance.structure.toJson(),
      'occasion': instance.occasion.toJson(),
      'style': instance.style.toJson(),
      'completeness': instance.completeness.toJson(),
    };

_StartingItem _$StartingItemFromJson(Map<String, dynamic> json) =>
    _StartingItem(
      clothingType: CatalogRef.fromJson(
        json['clothing_type'] as Map<String, dynamic>,
      ),
      color: ColorRef.fromJson(json['color'] as Map<String, dynamic>),
      role: $enumDecode(_$PieceRoleEnumMap, json['role']),
    );

Map<String, dynamic> _$StartingItemToJson(_StartingItem instance) =>
    <String, dynamic>{
      'clothing_type': instance.clothingType.toJson(),
      'color': instance.color.toJson(),
      'role': _$PieceRoleEnumMap[instance.role]!,
    };

_AppliedFilters _$AppliedFiltersFromJson(Map<String, dynamic> json) =>
    _AppliedFilters(
      occasionSlug: json['occasion_slug'] as String?,
      styleSlug: json['style_slug'] as String?,
    );

Map<String, dynamic> _$AppliedFiltersToJson(_AppliedFilters instance) =>
    <String, dynamic>{
      'occasion_slug': instance.occasionSlug,
      'style_slug': instance.styleSlug,
    };

_Broadening _$BroadeningFromJson(Map<String, dynamic> json) => _Broadening(
  applied: json['applied'] as bool? ?? false,
  steps:
      (json['steps'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$BroadeningCriterionEnumMap, e))
          .toList() ??
      const [],
);

Map<String, dynamic> _$BroadeningToJson(
  _Broadening instance,
) => <String, dynamic>{
  'applied': instance.applied,
  'steps': instance.steps.map((e) => _$BroadeningCriterionEnumMap[e]!).toList(),
};

const _$BroadeningCriterionEnumMap = {
  BroadeningCriterion.style: 'style',
  BroadeningCriterion.occasion: 'occasion',
  BroadeningCriterion.neighborShades: 'neighbor_shades',
  BroadeningCriterion.neutralAdvice: 'neutral_advice',
};

_RecommendedItem _$RecommendedItemFromJson(Map<String, dynamic> json) =>
    _RecommendedItem(
      clothingType: CatalogRef.fromJson(
        json['clothing_type'] as Map<String, dynamic>,
      ),
      color: ColorRef.fromJson(json['color'] as Map<String, dynamic>),
      role: $enumDecode(_$PieceRoleEnumMap, json['role']),
      isRequired: json['is_required'] as bool? ?? true,
      isStartingItem: json['is_starting_item'] as bool? ?? false,
    );

Map<String, dynamic> _$RecommendedItemToJson(_RecommendedItem instance) =>
    <String, dynamic>{
      'clothing_type': instance.clothingType.toJson(),
      'color': instance.color.toJson(),
      'role': _$PieceRoleEnumMap[instance.role]!,
      'is_required': instance.isRequired,
      'is_starting_item': instance.isStartingItem,
    };

_RecommendedLook _$RecommendedLookFromJson(Map<String, dynamic> json) =>
    _RecommendedLook(
      outfitId: const IdConverter().fromJson(json['outfit_id'] as Object),
      title: json['title'] as String,
      score: (json['score'] as num).toInt(),
      scoreBreakdown: ScoreBreakdown.fromJson(
        json['score_breakdown'] as Map<String, dynamic>,
      ),
      explanation: json['explanation'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => RecommendedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] == null
          ? null
          : LookImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecommendedLookToJson(_RecommendedLook instance) =>
    <String, dynamic>{
      'outfit_id': const IdConverter().toJson(instance.outfitId),
      'title': instance.title,
      'score': instance.score,
      'score_breakdown': instance.scoreBreakdown.toJson(),
      'explanation': instance.explanation,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'image': instance.image?.toJson(),
    };

_ColorAdvice _$ColorAdviceFromJson(Map<String, dynamic> json) => _ColorAdvice(
  text: json['text'] as String,
  colorIds: json['color_ids'] == null
      ? const []
      : const IdListConverter().fromJson(json['color_ids'] as List),
);

Map<String, dynamic> _$ColorAdviceToJson(_ColorAdvice instance) =>
    <String, dynamic>{
      'text': instance.text,
      'color_ids': const IdListConverter().toJson(instance.colorIds),
    };

_FromItemResponse _$FromItemResponseFromJson(Map<String, dynamic> json) =>
    _FromItemResponse(
      requestId: json['request_id'] as String,
      catalogVersion: (json['catalog_version'] as num).toInt(),
      rulesVersion: (json['rules_version'] as num).toInt(),
      startingItem: StartingItem.fromJson(
        json['starting_item'] as Map<String, dynamic>,
      ),
      filters: json['filters'] == null
          ? const AppliedFilters()
          : AppliedFilters.fromJson(json['filters'] as Map<String, dynamic>),
      broadened: json['broadened'] == null
          ? const Broadening()
          : Broadening.fromJson(json['broadened'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => RecommendedLook.fromJson(e as Map<String, dynamic>))
          .toList(),
      advice:
          (json['advice'] as List<dynamic>?)
              ?.map((e) => ColorAdvice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$FromItemResponseToJson(_FromItemResponse instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'catalog_version': instance.catalogVersion,
      'rules_version': instance.rulesVersion,
      'starting_item': instance.startingItem.toJson(),
      'filters': instance.filters.toJson(),
      'broadened': instance.broadened.toJson(),
      'results': instance.results.map((e) => e.toJson()).toList(),
      'advice': instance.advice.map((e) => e.toJson()).toList(),
    };

_TextNote _$TextNoteFromJson(Map<String, dynamic> json) =>
    _TextNote(text: json['text'] as String);

Map<String, dynamic> _$TextNoteToJson(_TextNote instance) => <String, dynamic>{
  'text': instance.text,
};

_OutfitWarning _$OutfitWarningFromJson(Map<String, dynamic> json) =>
    _OutfitWarning(
      type: $enumDecode(_$WarningTypeEnumMap, json['type']),
      text: json['text'] as String,
      itemIndexes:
          (json['item_indexes'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$OutfitWarningToJson(_OutfitWarning instance) =>
    <String, dynamic>{
      'type': _$WarningTypeEnumMap[instance.type]!,
      'text': instance.text,
      'item_indexes': instance.itemIndexes,
    };

const _$WarningTypeEnumMap = {
  WarningType.structure: 'structure',
  WarningType.preference: 'preference',
};

_EvaluationResponse _$EvaluationResponseFromJson(Map<String, dynamic> json) =>
    _EvaluationResponse(
      requestId: json['request_id'] as String,
      catalogVersion: (json['catalog_version'] as num).toInt(),
      rulesVersion: (json['rules_version'] as num).toInt(),
      score: (json['score'] as num).toInt(),
      scoreBreakdown: ScoreBreakdown.fromJson(
        json['score_breakdown'] as Map<String, dynamic>,
      ),
      isComplete: json['is_complete'] as bool? ?? false,
      strengths:
          (json['strengths'] as List<dynamic>?)
              ?.map((e) => TextNote.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      warnings:
          (json['warnings'] as List<dynamic>?)
              ?.map((e) => OutfitWarning.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      suggestions:
          (json['suggestions'] as List<dynamic>?)
              ?.map((e) => TextNote.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$EvaluationResponseToJson(_EvaluationResponse instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'catalog_version': instance.catalogVersion,
      'rules_version': instance.rulesVersion,
      'score': instance.score,
      'score_breakdown': instance.scoreBreakdown.toJson(),
      'is_complete': instance.isComplete,
      'strengths': instance.strengths.map((e) => e.toJson()).toList(),
      'warnings': instance.warnings.map((e) => e.toJson()).toList(),
      'suggestions': instance.suggestions.map((e) => e.toJson()).toList(),
    };

_OutfitChange _$OutfitChangeFromJson(Map<String, dynamic> json) =>
    _OutfitChange(
      action: $enumDecode(_$ChangeActionEnumMap, json['action']),
      itemIndex: (json['item_index'] as num?)?.toInt(),
      item: json['item'] == null
          ? null
          : RequestItem.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OutfitChangeToJson(_OutfitChange instance) =>
    <String, dynamic>{
      'action': _$ChangeActionEnumMap[instance.action]!,
      'item_index': instance.itemIndex,
      'item': instance.item?.toJson(),
    };

const _$ChangeActionEnumMap = {
  ChangeAction.addItem: 'add_item',
  ChangeAction.replaceItem: 'replace_item',
  ChangeAction.removeItem: 'remove_item',
};

_Improvement _$ImprovementFromJson(Map<String, dynamic> json) => _Improvement(
  text: json['text'] as String,
  change: OutfitChange.fromJson(json['change'] as Map<String, dynamic>),
  resultingScore: (json['resulting_score'] as num).toInt(),
);

Map<String, dynamic> _$ImprovementToJson(_Improvement instance) =>
    <String, dynamic>{
      'text': instance.text,
      'change': instance.change.toJson(),
      'resulting_score': instance.resultingScore,
    };

_ImprovementResponse _$ImprovementResponseFromJson(Map<String, dynamic> json) =>
    _ImprovementResponse(
      requestId: json['request_id'] as String,
      catalogVersion: (json['catalog_version'] as num).toInt(),
      rulesVersion: (json['rules_version'] as num).toInt(),
      currentScore: (json['current_score'] as num).toInt(),
      improvements:
          (json['improvements'] as List<dynamic>?)
              ?.map((e) => Improvement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ImprovementResponseToJson(
  _ImprovementResponse instance,
) => <String, dynamic>{
  'request_id': instance.requestId,
  'catalog_version': instance.catalogVersion,
  'rules_version': instance.rulesVersion,
  'current_score': instance.currentScore,
  'improvements': instance.improvements.map((e) => e.toJson()).toList(),
};

_FeedbackRequest _$FeedbackRequestFromJson(Map<String, dynamic> json) =>
    _FeedbackRequest(
      outfitId: const NullableIdConverter().fromJson(json['outfit_id']),
      rating: (json['rating'] as num?)?.toInt(),
      isHelpful: json['is_helpful'] as bool?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$FeedbackRequestToJson(_FeedbackRequest instance) =>
    <String, dynamic>{
      'outfit_id': const NullableIdConverter().toJson(instance.outfitId),
      'rating': instance.rating,
      'is_helpful': instance.isHelpful,
      'comment': instance.comment,
    };

_FeedbackReceipt _$FeedbackReceiptFromJson(Map<String, dynamic> json) =>
    _FeedbackReceipt(
      requestId: json['request_id'] as String,
      outfitId: const NullableIdConverter().fromJson(json['outfit_id']),
      rating: (json['rating'] as num?)?.toInt(),
      isHelpful: json['is_helpful'] as bool?,
      comment: json['comment'] as String?,
      createdAt: const UtcDateTimeConverter().fromJson(
        json['created_at'] as String,
      ),
    );

Map<String, dynamic> _$FeedbackReceiptToJson(_FeedbackReceipt instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'outfit_id': const NullableIdConverter().toJson(instance.outfitId),
      'rating': instance.rating,
      'is_helpful': instance.isHelpful,
      'comment': instance.comment,
      'created_at': const UtcDateTimeConverter().toJson(instance.createdAt),
    };
