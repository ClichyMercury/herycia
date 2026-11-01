// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CatalogRef _$CatalogRefFromJson(Map<String, dynamic> json) => _CatalogRef(
  id: const IdConverter().fromJson(json['id'] as Object),
  slug: json['slug'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$CatalogRefToJson(_CatalogRef instance) =>
    <String, dynamic>{
      'id': const IdConverter().toJson(instance.id),
      'slug': instance.slug,
      'name': instance.name,
    };

_ColorRef _$ColorRefFromJson(Map<String, dynamic> json) => _ColorRef(
  id: const IdConverter().fromJson(json['id'] as Object),
  slug: json['slug'] as String,
  name: json['name'] as String,
  hexCode: json['hex_code'] as String,
);

Map<String, dynamic> _$ColorRefToJson(_ColorRef instance) => <String, dynamic>{
  'id': const IdConverter().toJson(instance.id),
  'slug': instance.slug,
  'name': instance.name,
  'hex_code': instance.hexCode,
};

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
  CategoryGroup.footwear: 'footwear',
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
      brightness: json['brightness'] as String?,
      saturation: json['saturation'] as String?,
      isNeutral: json['is_neutral'] as bool? ?? false,
      aliases:
          (json['aliases'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
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
      'aliases': instance.aliases,
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
      catalogVersion: (json['catalog_version'] as num).toInt(),
      rulesVersion: (json['rules_version'] as num).toInt(),
    );

Map<String, dynamic> _$CatalogVersionToJson(_CatalogVersion instance) =>
    <String, dynamic>{
      'catalog_version': instance.catalogVersion,
      'rules_version': instance.rulesVersion,
    };

_ColorFamilyGuide _$ColorFamilyGuideFromJson(Map<String, dynamic> json) =>
    _ColorFamilyGuide(
      slug: json['slug'] as String,
      name: json['name'] as String,
      colorIds: const IdListConverter().fromJson(json['color_ids'] as List),
    );

Map<String, dynamic> _$ColorFamilyGuideToJson(_ColorFamilyGuide instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'name': instance.name,
      'color_ids': const IdListConverter().toJson(instance.colorIds),
    };

_ColorPartner _$ColorPartnerFromJson(Map<String, dynamic> json) =>
    _ColorPartner(
      colorId: const IdConverter().fromJson(json['color_id'] as Object),
      score: (json['score'] as num).toInt(),
      explanation: json['explanation'] as String,
    );

Map<String, dynamic> _$ColorPartnerToJson(_ColorPartner instance) =>
    <String, dynamic>{
      'color_id': const IdConverter().toJson(instance.colorId),
      'score': instance.score,
      'explanation': instance.explanation,
    };

_ColorHarmony _$ColorHarmonyFromJson(Map<String, dynamic> json) =>
    _ColorHarmony(
      colorId: const IdConverter().fromJson(json['color_id'] as Object),
      harmonious:
          (json['harmonious'] as List<dynamic>?)
              ?.map((e) => ColorPartner.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      contrast:
          (json['contrast'] as List<dynamic>?)
              ?.map((e) => ColorPartner.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      neutralPairing:
          (json['neutral_pairing'] as List<dynamic>?)
              ?.map((e) => ColorPartner.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      caution:
          (json['caution'] as List<dynamic>?)
              ?.map((e) => ColorPartner.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ColorHarmonyToJson(
  _ColorHarmony instance,
) => <String, dynamic>{
  'color_id': const IdConverter().toJson(instance.colorId),
  'harmonious': instance.harmonious.map((e) => e.toJson()).toList(),
  'contrast': instance.contrast.map((e) => e.toJson()).toList(),
  'neutral_pairing': instance.neutralPairing.map((e) => e.toJson()).toList(),
  'caution': instance.caution.map((e) => e.toJson()).toList(),
};

_ColorGuide _$ColorGuideFromJson(Map<String, dynamic> json) => _ColorGuide(
  catalogVersion: (json['catalog_version'] as num?)?.toInt() ?? 1,
  rulesVersion: (json['rules_version'] as num?)?.toInt() ?? 1,
  families: (json['families'] as List<dynamic>)
      .map((e) => ColorFamilyGuide.fromJson(e as Map<String, dynamic>))
      .toList(),
  neutralColorIds: json['neutral_color_ids'] == null
      ? const []
      : const IdListConverter().fromJson(json['neutral_color_ids'] as List),
  harmonies:
      (json['harmonies'] as List<dynamic>?)
          ?.map((e) => ColorHarmony.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ColorGuideToJson(
  _ColorGuide instance,
) => <String, dynamic>{
  'catalog_version': instance.catalogVersion,
  'rules_version': instance.rulesVersion,
  'families': instance.families.map((e) => e.toJson()).toList(),
  'neutral_color_ids': const IdListConverter().toJson(instance.neutralColorIds),
  'harmonies': instance.harmonies.map((e) => e.toJson()).toList(),
};
