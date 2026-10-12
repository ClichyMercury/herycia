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

_LookSnapshot _$LookSnapshotFromJson(Map<String, dynamic> json) =>
    _LookSnapshot(
      title: json['title'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => RequestItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      occasionSlug: json['occasion_slug'] as String?,
      styleSlug: json['style_slug'] as String?,
      score: (json['score'] as num?)?.toInt(),
      imageUrl: json['image_url'] as String?,
      explanation: json['explanation'] as String?,
    );

Map<String, dynamic> _$LookSnapshotToJson(_LookSnapshot instance) =>
    <String, dynamic>{
      'title': instance.title,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'occasion_slug': instance.occasionSlug,
      'style_slug': instance.styleSlug,
      'score': instance.score,
      'image_url': instance.imageUrl,
      'explanation': instance.explanation,
    };

_Favorite _$FavoriteFromJson(Map<String, dynamic> json) => _Favorite(
  id: const IdConverter().fromJson(json['id'] as Object),
  clientUuid: json['client_uuid'] as String,
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
  'client_uuid': instance.clientUuid,
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
      'outfit_id': const NullableIdConverter().toJson(instance.outfitId),
      'snapshot': instance.snapshot.toJson(),
    };

_SavedOutfit _$SavedOutfitFromJson(Map<String, dynamic> json) => _SavedOutfit(
  id: const IdConverter().fromJson(json['id'] as Object),
  clientUuid: json['client_uuid'] as String,
  title: json['title'] as String?,
  composition: CompositionPayload.fromJson(
    json['composition'] as Map<String, dynamic>,
  ),
  score: (json['score'] as num?)?.toInt(),
  ruleVersion: json['rule_version'] as String?,
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
      'client_uuid': instance.clientUuid,
      'title': instance.title,
      'composition': instance.composition.toJson(),
      'score': instance.score,
      'rule_version': instance.ruleVersion,
      'created_at': const UtcDateTimeConverter().toJson(instance.createdAt),
      'updated_at': const UtcDateTimeConverter().toJson(instance.updatedAt),
    };

_SavedOutfitInput _$SavedOutfitInputFromJson(Map<String, dynamic> json) =>
    _SavedOutfitInput(
      clientUuid: json['client_uuid'] as String,
      title: json['title'] as String?,
      composition: CompositionPayload.fromJson(
        json['composition'] as Map<String, dynamic>,
      ),
      score: (json['score'] as num?)?.toInt(),
      ruleVersion: json['rule_version'] as String?,
      baseUpdatedAt: const NullableUtcDateTimeConverter().fromJson(
        json['base_updated_at'] as String?,
      ),
    );

Map<String, dynamic> _$SavedOutfitInputToJson(_SavedOutfitInput instance) =>
    <String, dynamic>{
      'client_uuid': instance.clientUuid,
      'title': instance.title,
      'composition': instance.composition.toJson(),
      'score': instance.score,
      'rule_version': instance.ruleVersion,
      'base_updated_at': const NullableUtcDateTimeConverter().toJson(
        instance.baseUpdatedAt,
      ),
    };
