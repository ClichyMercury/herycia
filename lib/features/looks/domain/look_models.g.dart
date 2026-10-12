// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'look_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LookImage _$LookImageFromJson(Map<String, dynamic> json) => _LookImage(
  id: const IdConverter().fromJson(json['id'] as Object),
  url: json['url'] as String,
  thumbnailUrl: json['thumbnail_url'] as String?,
  sourceName: json['source_name'] as String,
  sourceUrl: json['source_url'] as String?,
  licenseType: $enumDecode(_$LicenseTypeEnumMap, json['license_type']),
  attribution: json['attribution'] as String?,
  usageApproved: json['usage_approved'] as bool,
  altText: json['alt_text'] as String,
);

Map<String, dynamic> _$LookImageToJson(_LookImage instance) =>
    <String, dynamic>{
      'id': const IdConverter().toJson(instance.id),
      'url': instance.url,
      'thumbnail_url': instance.thumbnailUrl,
      'source_name': instance.sourceName,
      'source_url': instance.sourceUrl,
      'license_type': _$LicenseTypeEnumMap[instance.licenseType]!,
      'attribution': instance.attribution,
      'usage_approved': instance.usageApproved,
      'alt_text': instance.altText,
    };

const _$LicenseTypeEnumMap = {
  LicenseType.owned: 'owned',
  LicenseType.cc0: 'cc0',
  LicenseType.ccBy: 'cc_by',
  LicenseType.unsplash: 'unsplash',
  LicenseType.partner: 'partner',
};

_LookItem _$LookItemFromJson(Map<String, dynamic> json) => _LookItem(
  id: const IdConverter().fromJson(json['id'] as Object),
  clothingTypeId: const IdConverter().fromJson(
    json['clothing_type_id'] as Object,
  ),
  colorId: const IdConverter().fromJson(json['color_id'] as Object),
  role: $enumDecode(_$PieceRoleEnumMap, json['role']),
  isRequired: json['is_required'] as bool? ?? true,
  sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$LookItemToJson(_LookItem instance) => <String, dynamic>{
  'id': const IdConverter().toJson(instance.id),
  'clothing_type_id': const IdConverter().toJson(instance.clothingTypeId),
  'color_id': const IdConverter().toJson(instance.colorId),
  'role': _$PieceRoleEnumMap[instance.role]!,
  'is_required': instance.isRequired,
  'sort_order': instance.sortOrder,
};

const _$PieceRoleEnumMap = {
  PieceRole.top: 'top',
  PieceRole.bottom: 'bottom',
  PieceRole.onePiece: 'one_piece',
  PieceRole.shoes: 'shoes',
  PieceRole.accessory: 'accessory',
};

_Look _$LookFromJson(Map<String, dynamic> json) => _Look(
  id: const IdConverter().fromJson(json['id'] as Object),
  title: json['title'] as String,
  slug: json['slug'] as String,
  description: json['description'] as String,
  styleId: const NullableIdConverter().fromJson(json['style_id']),
  occasionId: const NullableIdConverter().fromJson(json['occasion_id']),
  status: $enumDecode(_$LookStatusEnumMap, json['status']),
  publishedAt: const NullableUtcDateTimeConverter().fromJson(
    json['published_at'] as String?,
  ),
  origin:
      $enumDecodeNullable(_$LookOriginEnumMap, json['origin']) ??
      LookOrigin.editorial,
  items: (json['items'] as List<dynamic>)
      .map((e) => LookItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  primaryImage: json['primary_image'] == null
      ? null
      : LookImage.fromJson(json['primary_image'] as Map<String, dynamic>),
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => LookImage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$LookToJson(_Look instance) => <String, dynamic>{
  'id': const IdConverter().toJson(instance.id),
  'title': instance.title,
  'slug': instance.slug,
  'description': instance.description,
  'style_id': const NullableIdConverter().toJson(instance.styleId),
  'occasion_id': const NullableIdConverter().toJson(instance.occasionId),
  'status': _$LookStatusEnumMap[instance.status]!,
  'published_at': const NullableUtcDateTimeConverter().toJson(
    instance.publishedAt,
  ),
  'origin': _$LookOriginEnumMap[instance.origin]!,
  'items': instance.items.map((e) => e.toJson()).toList(),
  'primary_image': instance.primaryImage?.toJson(),
  'images': instance.images.map((e) => e.toJson()).toList(),
};

const _$LookStatusEnumMap = {
  LookStatus.draft: 'draft',
  LookStatus.published: 'published',
  LookStatus.archived: 'archived',
};

const _$LookOriginEnumMap = {
  LookOrigin.editorial: 'editorial',
  LookOrigin.stylist: 'stylist',
  LookOrigin.vendor: 'vendor',
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
