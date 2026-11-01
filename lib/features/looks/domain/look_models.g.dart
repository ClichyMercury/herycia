// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'look_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LookImage _$LookImageFromJson(Map<String, dynamic> json) => _LookImage(
  id: const IdConverter().fromJson(json['id'] as Object),
  url: json['url'] as String,
  thumbnailUrl: json['thumbnail_url'] as String?,
  altText: json['alt_text'] as String,
  credit: json['credit'] as String?,
  licenseType: json['license_type'] as String,
  sourceName: json['source_name'] as String?,
  sourceUrl: json['source_url'] as String?,
);

Map<String, dynamic> _$LookImageToJson(_LookImage instance) =>
    <String, dynamic>{
      'id': const IdConverter().toJson(instance.id),
      'url': instance.url,
      'thumbnail_url': instance.thumbnailUrl,
      'alt_text': instance.altText,
      'credit': instance.credit,
      'license_type': instance.licenseType,
      'source_name': instance.sourceName,
      'source_url': instance.sourceUrl,
    };

_LookItem _$LookItemFromJson(Map<String, dynamic> json) => _LookItem(
  clothingType: CatalogRef.fromJson(
    json['clothing_type'] as Map<String, dynamic>,
  ),
  color: ColorRef.fromJson(json['color'] as Map<String, dynamic>),
  role: $enumDecode(_$PieceRoleEnumMap, json['role']),
  isRequired: json['is_required'] as bool? ?? true,
  sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$LookItemToJson(_LookItem instance) => <String, dynamic>{
  'clothing_type': instance.clothingType.toJson(),
  'color': instance.color.toJson(),
  'role': _$PieceRoleEnumMap[instance.role]!,
  'is_required': instance.isRequired,
  'sort_order': instance.sortOrder,
};

const _$PieceRoleEnumMap = {
  PieceRole.top: 'top',
  PieceRole.bottom: 'bottom',
  PieceRole.onePiece: 'one_piece',
  PieceRole.footwear: 'footwear',
  PieceRole.accessory: 'accessory',
  PieceRole.outerwear: 'outerwear',
};

_Look _$LookFromJson(Map<String, dynamic> json) => _Look(
  id: const IdConverter().fromJson(json['id'] as Object),
  title: json['title'] as String,
  slug: json['slug'] as String,
  description: json['description'] as String?,
  style: json['style'] == null
      ? null
      : CatalogRef.fromJson(json['style'] as Map<String, dynamic>),
  occasion: json['occasion'] == null
      ? null
      : CatalogRef.fromJson(json['occasion'] as Map<String, dynamic>),
  image: json['image'] == null
      ? null
      : LookImage.fromJson(json['image'] as Map<String, dynamic>),
  items: (json['items'] as List<dynamic>)
      .map((e) => LookItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  origin: json['origin'] as String? ?? 'editorial',
  publishedAt: const NullableUtcDateTimeConverter().fromJson(
    json['published_at'] as String?,
  ),
);

Map<String, dynamic> _$LookToJson(_Look instance) => <String, dynamic>{
  'id': const IdConverter().toJson(instance.id),
  'title': instance.title,
  'slug': instance.slug,
  'description': instance.description,
  'style': instance.style?.toJson(),
  'occasion': instance.occasion?.toJson(),
  'image': instance.image?.toJson(),
  'items': instance.items.map((e) => e.toJson()).toList(),
  'origin': instance.origin,
  'published_at': const NullableUtcDateTimeConverter().toJson(
    instance.publishedAt,
  ),
};

_PageMeta _$PageMetaFromJson(Map<String, dynamic> json) => _PageMeta(
  currentPage: (json['current_page'] as num).toInt(),
  perPage: (json['per_page'] as num).toInt(),
  total: (json['total'] as num).toInt(),
  lastPage: (json['last_page'] as num).toInt(),
);

Map<String, dynamic> _$PageMetaToJson(_PageMeta instance) => <String, dynamic>{
  'current_page': instance.currentPage,
  'per_page': instance.perPage,
  'total': instance.total,
  'last_page': instance.lastPage,
};
