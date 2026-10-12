// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClothingCategory _$ClothingCategoryFromJson(Map<String, dynamic> json) =>
    _ClothingCategory(
      id: const IdConverter().fromJson(json['id'] as Object),
      name: json['name'] as String,
      slug: json['slug'] as String,
      groupType: $enumDecode(_$CategoryGroupEnumMap, json['group_type']),
      isOptional: json['is_optional'] as bool? ?? false,
      sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ClothingCategoryToJson(_ClothingCategory instance) =>
    <String, dynamic>{
      'id': const IdConverter().toJson(instance.id),
      'name': instance.name,
      'slug': instance.slug,
      'group_type': _$CategoryGroupEnumMap[instance.groupType]!,
      'is_optional': instance.isOptional,
      'sort_order': instance.sortOrder,
    };

const _$CategoryGroupEnumMap = {
  CategoryGroup.top: 'top',
  CategoryGroup.bottom: 'bottom',
  CategoryGroup.onePiece: 'one_piece',
  CategoryGroup.shoes: 'shoes',
  CategoryGroup.accessory: 'accessory',
};

_ClothingType _$ClothingTypeFromJson(Map<String, dynamic> json) =>
    _ClothingType(
      id: const IdConverter().fromJson(json['id'] as Object),
      categoryId: const IdConverter().fromJson(json['category_id'] as Object),
      name: json['name'] as String,
      slug: json['slug'] as String,
      isOnePiece: json['is_one_piece'] as bool? ?? false,
      sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ClothingTypeToJson(_ClothingType instance) =>
    <String, dynamic>{
      'id': const IdConverter().toJson(instance.id),
      'category_id': const IdConverter().toJson(instance.categoryId),
      'name': instance.name,
      'slug': instance.slug,
      'is_one_piece': instance.isOnePiece,
      'sort_order': instance.sortOrder,
    };

_CatalogColor _$CatalogColorFromJson(Map<String, dynamic> json) =>
    _CatalogColor(
      id: const IdConverter().fromJson(json['id'] as Object),
      name: json['name'] as String,
      slug: json['slug'] as String,
      hexCode: json['hex_code'] as String,
      colorFamily: json['color_family'] as String,
      temperature: json['temperature'] as String?,
      brightness: (json['brightness'] as num?)?.toDouble(),
      saturation: (json['saturation'] as num?)?.toDouble(),
      isNeutral: json['is_neutral'] as bool? ?? false,
    );

Map<String, dynamic> _$CatalogColorToJson(_CatalogColor instance) =>
    <String, dynamic>{
      'id': const IdConverter().toJson(instance.id),
      'name': instance.name,
      'slug': instance.slug,
      'hex_code': instance.hexCode,
      'color_family': instance.colorFamily,
      'temperature': instance.temperature,
      'brightness': instance.brightness,
      'saturation': instance.saturation,
      'is_neutral': instance.isNeutral,
    };

_OutfitStyle _$OutfitStyleFromJson(Map<String, dynamic> json) => _OutfitStyle(
  id: const IdConverter().fromJson(json['id'] as Object),
  name: json['name'] as String,
  slug: json['slug'] as String,
  description: json['description'] as String?,
  sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$OutfitStyleToJson(_OutfitStyle instance) =>
    <String, dynamic>{
      'id': const IdConverter().toJson(instance.id),
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'sort_order': instance.sortOrder,
    };

_Occasion _$OccasionFromJson(Map<String, dynamic> json) => _Occasion(
  id: const IdConverter().fromJson(json['id'] as Object),
  name: json['name'] as String,
  slug: json['slug'] as String,
  description: json['description'] as String?,
  sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$OccasionToJson(_Occasion instance) => <String, dynamic>{
  'id': const IdConverter().toJson(instance.id),
  'name': instance.name,
  'slug': instance.slug,
  'description': instance.description,
  'sort_order': instance.sortOrder,
};

_CatalogVersion _$CatalogVersionFromJson(Map<String, dynamic> json) =>
    _CatalogVersion(
      catalogVersion: json['catalog_version'] as String,
      rulesVersion: json['rules_version'] as String,
      updatedAt: const UtcDateTimeConverter().fromJson(
        json['updated_at'] as String,
      ),
    );

Map<String, dynamic> _$CatalogVersionToJson(_CatalogVersion instance) =>
    <String, dynamic>{
      'catalog_version': instance.catalogVersion,
      'rules_version': instance.rulesVersion,
      'updated_at': const UtcDateTimeConverter().toJson(instance.updatedAt),
    };

_ColorFamilyGuide _$ColorFamilyGuideFromJson(Map<String, dynamic> json) =>
    _ColorFamilyGuide(
      slug: json['slug'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      isNeutral: json['is_neutral'] as bool? ?? false,
      colorIds: const IdListConverter().fromJson(json['color_ids'] as List),
      pairsWellWithColorIds: json['pairs_well_with_color_ids'] == null
          ? const []
          : const IdListConverter().fromJson(
              json['pairs_well_with_color_ids'] as List,
            ),
    );

Map<String, dynamic> _$ColorFamilyGuideToJson(_ColorFamilyGuide instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'name': instance.name,
      'description': instance.description,
      'is_neutral': instance.isNeutral,
      'color_ids': const IdListConverter().toJson(instance.colorIds),
      'pairs_well_with_color_ids': const IdListConverter().toJson(
        instance.pairsWellWithColorIds,
      ),
    };

_GuidePrinciple _$GuidePrincipleFromJson(Map<String, dynamic> json) =>
    _GuidePrinciple(
      slug: json['slug'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      exampleColorIds: json['example_color_ids'] == null
          ? const []
          : const IdListConverter().fromJson(json['example_color_ids'] as List),
    );

Map<String, dynamic> _$GuidePrincipleToJson(
  _GuidePrinciple instance,
) => <String, dynamic>{
  'slug': instance.slug,
  'title': instance.title,
  'body': instance.body,
  'example_color_ids': const IdListConverter().toJson(instance.exampleColorIds),
};

_ColorGuide _$ColorGuideFromJson(Map<String, dynamic> json) => _ColorGuide(
  families: (json['families'] as List<dynamic>)
      .map((e) => ColorFamilyGuide.fromJson(e as Map<String, dynamic>))
      .toList(),
  principles: (json['principles'] as List<dynamic>)
      .map((e) => GuidePrinciple.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ColorGuideToJson(_ColorGuide instance) =>
    <String, dynamic>{
      'families': instance.families.map((e) => e.toJson()).toList(),
      'principles': instance.principles.map((e) => e.toJson()).toList(),
    };

_ColorPairingRule _$ColorPairingRuleFromJson(Map<String, dynamic> json) =>
    _ColorPairingRule(
      id: const IdConverter().fromJson(json['id'] as Object),
      colorAId: const IdConverter().fromJson(json['color_a_id'] as Object),
      colorBId: const IdConverter().fromJson(json['color_b_id'] as Object),
      ruleType: $enumDecode(_$PairingRuleTypeEnumMap, json['rule_type']),
      compatibilityScore: (json['compatibility_score'] as num).toDouble(),
      explanation: json['explanation'] as String,
      ruleVersion: json['rule_version'] as String,
    );

Map<String, dynamic> _$ColorPairingRuleToJson(_ColorPairingRule instance) =>
    <String, dynamic>{
      'id': const IdConverter().toJson(instance.id),
      'color_a_id': const IdConverter().toJson(instance.colorAId),
      'color_b_id': const IdConverter().toJson(instance.colorBId),
      'rule_type': _$PairingRuleTypeEnumMap[instance.ruleType]!,
      'compatibility_score': instance.compatibilityScore,
      'explanation': instance.explanation,
      'rule_version': instance.ruleVersion,
    };

const _$PairingRuleTypeEnumMap = {
  PairingRuleType.neutralBase: 'neutral_base',
  PairingRuleType.toneOnTone: 'tone_on_tone',
  PairingRuleType.analogous: 'analogous',
  PairingRuleType.complementary: 'complementary',
  PairingRuleType.contrast: 'contrast',
  PairingRuleType.bold: 'bold',
};

_RecommendationRule _$RecommendationRuleFromJson(Map<String, dynamic> json) =>
    _RecommendationRule(
      id: const IdConverter().fromJson(json['id'] as Object),
      name: json['name'] as String,
      ruleType: $enumDecode(_$RecommendationRuleTypeEnumMap, json['rule_type']),
      conditionsJson: Map<String, String>.from(json['conditions_json'] as Map),
      weight: (json['weight'] as num).toDouble(),
      explanation: json['explanation'] as String,
      version: json['version'] as String,
    );

Map<String, dynamic> _$RecommendationRuleToJson(_RecommendationRule instance) =>
    <String, dynamic>{
      'id': const IdConverter().toJson(instance.id),
      'name': instance.name,
      'rule_type': _$RecommendationRuleTypeEnumMap[instance.ruleType]!,
      'conditions_json': instance.conditionsJson,
      'weight': instance.weight,
      'explanation': instance.explanation,
      'version': instance.version,
    };

const _$RecommendationRuleTypeEnumMap = {
  RecommendationRuleType.typeOccasion: 'type_occasion',
  RecommendationRuleType.typeStyle: 'type_style',
};
