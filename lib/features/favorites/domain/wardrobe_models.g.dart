// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wardrobe_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompositionPayload _$CompositionPayloadFromJson(Map<String, dynamic> json) =>
    _CompositionPayload(
      items: (json['items'] as List<dynamic>)
          .map((e) => RequestItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      occasionSlug: json['occasion_slug'] as String?,
      styleSlug: json['style_slug'] as String?,
    );

Map<String, dynamic> _$CompositionPayloadToJson(_CompositionPayload instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'occasion_slug': instance.occasionSlug,
      'style_slug': instance.styleSlug,
    };

_SnapshotRef _$SnapshotRefFromJson(Map<String, dynamic> json) =>
    _SnapshotRef(slug: json['slug'] as String, name: json['name'] as String);

Map<String, dynamic> _$SnapshotRefToJson(_SnapshotRef instance) =>
    <String, dynamic>{'slug': instance.slug, 'name': instance.name};

_SnapshotColor _$SnapshotColorFromJson(Map<String, dynamic> json) =>
    _SnapshotColor(
      slug: json['slug'] as String,
      name: json['name'] as String,
      hexCode: json['hex_code'] as String,
    );

Map<String, dynamic> _$SnapshotColorToJson(_SnapshotColor instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'name': instance.name,
      'hex_code': instance.hexCode,
    };

_SnapshotItem _$SnapshotItemFromJson(Map<String, dynamic> json) =>
    _SnapshotItem(
      clothingType: SnapshotRef.fromJson(
        json['clothing_type'] as Map<String, dynamic>,
      ),
      color: SnapshotColor.fromJson(json['color'] as Map<String, dynamic>),
      role: $enumDecode(_$PieceRoleEnumMap, json['role']),
      isRequired: json['is_required'] as bool? ?? true,
    );

Map<String, dynamic> _$SnapshotItemToJson(_SnapshotItem instance) =>
    <String, dynamic>{
      'clothing_type': instance.clothingType.toJson(),
      'color': instance.color.toJson(),
      'role': _$PieceRoleEnumMap[instance.role]!,
      'is_required': instance.isRequired,
    };

const _$PieceRoleEnumMap = {
  PieceRole.top: 'top',
  PieceRole.bottom: 'bottom',
  PieceRole.onePiece: 'one_piece',
  PieceRole.footwear: 'footwear',
  PieceRole.accessory: 'accessory',
  PieceRole.outerwear: 'outerwear',
};

_SnapshotImage _$SnapshotImageFromJson(Map<String, dynamic> json) =>
    _SnapshotImage(
      url: json['url'] as String,
      thumbnailUrl: json['thumbnail_url'] as String?,
      altText: json['alt_text'] as String,
      credit: json['credit'] as String?,
      licenseType: json['license_type'] as String,
    );

Map<String, dynamic> _$SnapshotImageToJson(_SnapshotImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      'thumbnail_url': instance.thumbnailUrl,
      'alt_text': instance.altText,
      'credit': instance.credit,
      'license_type': instance.licenseType,
    };

_LookSnapshot _$LookSnapshotFromJson(Map<String, dynamic> json) =>
    _LookSnapshot(
      schemaVersion: (json['schema_version'] as num?)?.toInt() ?? 1,
      title: json['title'] as String,
      catalogVersion: (json['catalog_version'] as num?)?.toInt() ?? 1,
      style: json['style'] == null
          ? null
          : SnapshotRef.fromJson(json['style'] as Map<String, dynamic>),
      occasion: json['occasion'] == null
          ? null
          : SnapshotRef.fromJson(json['occasion'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : SnapshotImage.fromJson(json['image'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => SnapshotItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LookSnapshotToJson(_LookSnapshot instance) =>
    <String, dynamic>{
      'schema_version': instance.schemaVersion,
      'title': instance.title,
      'catalog_version': instance.catalogVersion,
      'style': ?instance.style?.toJson(),
      'occasion': ?instance.occasion?.toJson(),
      'image': ?instance.image?.toJson(),
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

_Favorite _$FavoriteFromJson(Map<String, dynamic> json) => _Favorite(
  id: const IdConverter().fromJson(json['id'] as Object),
  outfitId: const NullableIdConverter().fromJson(json['outfit_id']),
  snapshot: LookSnapshot.fromJson(json['snapshot'] as Map<String, dynamic>),
  createdAt: const UtcDateTimeConverter().fromJson(
    json['created_at'] as String,
  ),
  updatedAt: const UtcDateTimeConverter().fromJson(
    json['updated_at'] as String,
  ),
);

Map<String, dynamic> _$FavoriteToJson(_Favorite instance) => <String, dynamic>{
  'id': const IdConverter().toJson(instance.id),
  'outfit_id': const NullableIdConverter().toJson(instance.outfitId),
  'snapshot': instance.snapshot.toJson(),
  'created_at': const UtcDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const UtcDateTimeConverter().toJson(instance.updatedAt),
};

_FavoriteInput _$FavoriteInputFromJson(Map<String, dynamic> json) =>
    _FavoriteInput(
      clientUuid: json['client_uuid'] as String,
      outfitId: const NullableIdConverter().fromJson(json['outfit_id']),
      snapshot: LookSnapshot.fromJson(json['snapshot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteInputToJson(_FavoriteInput instance) =>
    <String, dynamic>{
      'client_uuid': instance.clientUuid,
      'outfit_id': ?const NullableIdConverter().toJson(instance.outfitId),
      'snapshot': instance.snapshot.toJson(),
    };

_SavedOutfit _$SavedOutfitFromJson(Map<String, dynamic> json) => _SavedOutfit(
  id: const IdConverter().fromJson(json['id'] as Object),
  title: json['title'] as String?,
  composition: CompositionPayload.fromJson(
    json['composition'] as Map<String, dynamic>,
  ),
  score: (json['score'] as num?)?.toInt(),
  ruleVersion: (json['rule_version'] as num?)?.toInt() ?? 1,
  createdAt: const UtcDateTimeConverter().fromJson(
    json['created_at'] as String,
  ),
  updatedAt: const UtcDateTimeConverter().fromJson(
    json['updated_at'] as String,
  ),
);

Map<String, dynamic> _$SavedOutfitToJson(_SavedOutfit instance) =>
    <String, dynamic>{
      'id': const IdConverter().toJson(instance.id),
      'title': instance.title,
      'composition': instance.composition.toJson(),
      'score': instance.score,
      'rule_version': instance.ruleVersion,
      'created_at': const UtcDateTimeConverter().toJson(instance.createdAt),
      'updated_at': const UtcDateTimeConverter().toJson(instance.updatedAt),
    };

_SavedOutfitInput _$SavedOutfitInputFromJson(Map<String, dynamic> json) =>
    _SavedOutfitInput(
      title: json['title'] as String?,
      composition: CompositionPayload.fromJson(
        json['composition'] as Map<String, dynamic>,
      ),
      score: (json['score'] as num?)?.toInt(),
      ruleVersion: (json['rule_version'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$SavedOutfitInputToJson(_SavedOutfitInput instance) =>
    <String, dynamic>{
      'title': instance.title,
      'composition': instance.composition.toJson(),
      'score': instance.score,
      'rule_version': instance.ruleVersion,
    };

_SyncChange _$SyncChangeFromJson(Map<String, dynamic> json) => _SyncChange(
  resource: $enumDecode(_$SyncResourceEnumMap, json['resource']),
  op: $enumDecode(_$SyncOpEnumMap, json['op']),
  id: const IdConverter().fromJson(json['id'] as Object),
  updatedAt: const UtcDateTimeConverter().fromJson(
    json['updated_at'] as String,
  ),
  deletedAt: const NullableUtcDateTimeConverter().fromJson(
    json['deleted_at'] as String?,
  ),
  data: json['data'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$SyncChangeToJson(
  _SyncChange instance,
) => <String, dynamic>{
  'resource': _$SyncResourceEnumMap[instance.resource]!,
  'op': _$SyncOpEnumMap[instance.op]!,
  'id': const IdConverter().toJson(instance.id),
  'updated_at': const UtcDateTimeConverter().toJson(instance.updatedAt),
  'deleted_at': const NullableUtcDateTimeConverter().toJson(instance.deletedAt),
  'data': instance.data,
};

const _$SyncResourceEnumMap = {
  SyncResource.favorite: 'favorite',
  SyncResource.savedOutfit: 'saved_outfit',
};

const _$SyncOpEnumMap = {SyncOp.upsert: 'upsert', SyncOp.delete: 'delete'};

_SyncPage _$SyncPageFromJson(Map<String, dynamic> json) => _SyncPage(
  changes: (json['changes'] as List<dynamic>)
      .map((e) => SyncChange.fromJson(e as Map<String, dynamic>))
      .toList(),
  cursor: json['cursor'] as String,
  hasMore: json['has_more'] as bool? ?? false,
);

Map<String, dynamic> _$SyncPageToJson(_SyncPage instance) => <String, dynamic>{
  'changes': instance.changes.map((e) => e.toJson()).toList(),
  'cursor': instance.cursor,
  'has_more': instance.hasMore,
};
