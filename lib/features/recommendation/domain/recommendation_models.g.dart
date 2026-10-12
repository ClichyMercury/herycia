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
  PieceRole.shoes: 'shoes',
  PieceRole.accessory: 'accessory',
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

_ScoreBreakdown _$ScoreBreakdownFromJson(Map<String, dynamic> json) =>
    _ScoreBreakdown(
      color: (json['color'] as num).toInt(),
      structure: (json['structure'] as num).toInt(),
      occasion: (json['occasion'] as num).toInt(),
      style: (json['style'] as num).toInt(),
      completeness: (json['completeness'] as num).toInt(),
    );

Map<String, dynamic> _$ScoreBreakdownToJson(_ScoreBreakdown instance) =>
    <String, dynamic>{
      'color': instance.color,
      'structure': instance.structure,
      'occasion': instance.occasion,
      'style': instance.style,
      'completeness': instance.completeness,
    };

_Remark _$RemarkFromJson(Map<String, dynamic> json) => _Remark(
  kind: $enumDecode(_$RemarkKindEnumMap, json['kind']),
  code: json['code'] as String,
  message: json['message'] as String,
  roles:
      (json['roles'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$PieceRoleEnumMap, e))
          .toList() ??
      const [],
);

Map<String, dynamic> _$RemarkToJson(_Remark instance) => <String, dynamic>{
  'kind': _$RemarkKindEnumMap[instance.kind]!,
  'code': instance.code,
  'message': instance.message,
  'roles': instance.roles.map((e) => _$PieceRoleEnumMap[e]!).toList(),
};

const _$RemarkKindEnumMap = {
  RemarkKind.structural: 'structural',
  RemarkKind.style: 'style',
};

_Improvement _$ImprovementFromJson(Map<String, dynamic> json) => _Improvement(
  role: $enumDecode(_$PieceRoleEnumMap, json['role']),
  clothingTypeId: const IdConverter().fromJson(
    json['clothing_type_id'] as Object,
  ),
  fromColorId: const IdConverter().fromJson(json['from_color_id'] as Object),
  toColorId: const IdConverter().fromJson(json['to_color_id'] as Object),
  newScore: (json['new_score'] as num).toInt(),
  gain: (json['gain'] as num).toInt(),
  explanation: json['explanation'] as String,
);

Map<String, dynamic> _$ImprovementToJson(_Improvement instance) =>
    <String, dynamic>{
      'role': _$PieceRoleEnumMap[instance.role]!,
      'clothing_type_id': const IdConverter().toJson(instance.clothingTypeId),
      'from_color_id': const IdConverter().toJson(instance.fromColorId),
      'to_color_id': const IdConverter().toJson(instance.toColorId),
      'new_score': instance.newScore,
      'gain': instance.gain,
      'explanation': instance.explanation,
    };

_RecommendedItem _$RecommendedItemFromJson(Map<String, dynamic> json) =>
    _RecommendedItem(
      clothingTypeId: const IdConverter().fromJson(
        json['clothing_type_id'] as Object,
      ),
      colorId: const IdConverter().fromJson(json['color_id'] as Object),
      role: $enumDecode(_$PieceRoleEnumMap, json['role']),
      isAnchor: json['is_anchor'] as bool? ?? false,
    );

Map<String, dynamic> _$RecommendedItemToJson(_RecommendedItem instance) =>
    <String, dynamic>{
      'clothing_type_id': const IdConverter().toJson(instance.clothingTypeId),
      'color_id': const IdConverter().toJson(instance.colorId),
      'role': _$PieceRoleEnumMap[instance.role]!,
      'is_anchor': instance.isAnchor,
    };

_RecommendedLook _$RecommendedLookFromJson(Map<String, dynamic> json) =>
    _RecommendedLook(
      outfitId: const NullableIdConverter().fromJson(json['outfit_id']),
      title: json['title'] as String,
      score: (json['score'] as num).toInt(),
      breakdown: ScoreBreakdown.fromJson(
        json['breakdown'] as Map<String, dynamic>,
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
      'outfit_id': const NullableIdConverter().toJson(instance.outfitId),
      'title': instance.title,
      'score': instance.score,
      'breakdown': instance.breakdown.toJson(),
      'explanation': instance.explanation,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'image': instance.image?.toJson(),
    };

_BroadeningStep _$BroadeningStepFromJson(Map<String, dynamic> json) =>
    _BroadeningStep(
      criterion: $enumDecode(_$BroadeningCriterionEnumMap, json['criterion']),
      message: json['message'] as String,
    );

Map<String, dynamic> _$BroadeningStepToJson(_BroadeningStep instance) =>
    <String, dynamic>{
      'criterion': _$BroadeningCriterionEnumMap[instance.criterion]!,
      'message': instance.message,
    };

const _$BroadeningCriterionEnumMap = {
  BroadeningCriterion.style: 'style',
  BroadeningCriterion.occasion: 'occasion',
  BroadeningCriterion.neighborShades: 'neighbor_shades',
  BroadeningCriterion.neutralAdvice: 'neutral_advice',
};

_FromItemResponse _$FromItemResponseFromJson(Map<String, dynamic> json) =>
    _FromItemResponse(
      requestId: json['request_id'] as String,
      catalogVersion: json['catalog_version'] as String,
      rulesVersion: json['rules_version'] as String,
      computedOffline: json['computed_offline'] as bool? ?? false,
      broadened:
          (json['broadened'] as List<dynamic>?)
              ?.map((e) => BroadeningStep.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      results: (json['results'] as List<dynamic>)
          .map((e) => RecommendedLook.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FromItemResponseToJson(_FromItemResponse instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'catalog_version': instance.catalogVersion,
      'rules_version': instance.rulesVersion,
      'computed_offline': instance.computedOffline,
      'broadened': instance.broadened.map((e) => e.toJson()).toList(),
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

_EvaluationResponse _$EvaluationResponseFromJson(Map<String, dynamic> json) =>
    _EvaluationResponse(
      requestId: json['request_id'] as String,
      rulesVersion: json['rules_version'] as String,
      computedOffline: json['computed_offline'] as bool? ?? false,
      score: (json['score'] as num).toInt(),
      breakdown: ScoreBreakdown.fromJson(
        json['breakdown'] as Map<String, dynamic>,
      ),
      explanation: json['explanation'] as String,
      strengths: (json['strengths'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      warnings: (json['warnings'] as List<dynamic>)
          .map((e) => Remark.fromJson(e as Map<String, dynamic>))
          .toList(),
      suggestions: (json['suggestions'] as List<dynamic>)
          .map((e) => Improvement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EvaluationResponseToJson(_EvaluationResponse instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'rules_version': instance.rulesVersion,
      'computed_offline': instance.computedOffline,
      'score': instance.score,
      'breakdown': instance.breakdown.toJson(),
      'explanation': instance.explanation,
      'strengths': instance.strengths,
      'warnings': instance.warnings.map((e) => e.toJson()).toList(),
      'suggestions': instance.suggestions.map((e) => e.toJson()).toList(),
    };

_ImprovementResponse _$ImprovementResponseFromJson(Map<String, dynamic> json) =>
    _ImprovementResponse(
      requestId: json['request_id'] as String,
      rulesVersion: json['rules_version'] as String,
      computedOffline: json['computed_offline'] as bool? ?? false,
      currentScore: (json['current_score'] as num).toInt(),
      improvements: (json['improvements'] as List<dynamic>)
          .map((e) => Improvement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImprovementResponseToJson(
  _ImprovementResponse instance,
) => <String, dynamic>{
  'request_id': instance.requestId,
  'rules_version': instance.rulesVersion,
  'computed_offline': instance.computedOffline,
  'current_score': instance.currentScore,
  'improvements': instance.improvements.map((e) => e.toJson()).toList(),
};

_FeedbackRequest _$FeedbackRequestFromJson(Map<String, dynamic> json) =>
    _FeedbackRequest(
      isHelpful: json['is_helpful'] as bool,
      outfitId: const NullableIdConverter().fromJson(json['outfit_id']),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$FeedbackRequestToJson(_FeedbackRequest instance) =>
    <String, dynamic>{
      'is_helpful': instance.isHelpful,
      'outfit_id': const NullableIdConverter().toJson(instance.outfitId),
      'comment': instance.comment,
    };

_FeedbackReceipt _$FeedbackReceiptFromJson(Map<String, dynamic> json) =>
    _FeedbackReceipt(
      id: const IdConverter().fromJson(json['id'] as Object),
      requestId: json['request_id'] as String,
      createdAt: const UtcDateTimeConverter().fromJson(
        json['created_at'] as String,
      ),
    );

Map<String, dynamic> _$FeedbackReceiptToJson(_FeedbackReceipt instance) =>
    <String, dynamic>{
      'id': const IdConverter().toJson(instance.id),
      'request_id': instance.requestId,
      'created_at': const UtcDateTimeConverter().toJson(instance.createdAt),
    };
