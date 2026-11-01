import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/json/id_converter.dart';
import '../../looks/domain/look_models.dart';
import '../../recommendation/domain/recommendation_models.dart';

part 'wardrobe_models.freezed.dart';
part 'wardrobe_models.g.dart';

@freezed
abstract class CompositionPayload with _$CompositionPayload {
  const factory CompositionPayload({
    required List<RequestItem> items,
    String? occasionSlug,
    String? styleSlug,
  }) = _CompositionPayload;

  factory CompositionPayload.fromJson(Map<String, dynamic> json) =>
      _$CompositionPayloadFromJson(json);
}

@freezed
abstract class SnapshotRef with _$SnapshotRef {
  const factory SnapshotRef({required String slug, required String name}) = _SnapshotRef;

  factory SnapshotRef.fromJson(Map<String, dynamic> json) => _$SnapshotRefFromJson(json);
}

@freezed
abstract class SnapshotColor with _$SnapshotColor {
  const factory SnapshotColor({
    required String slug,
    required String name,
    required String hexCode,
  }) = _SnapshotColor;

  factory SnapshotColor.fromJson(Map<String, dynamic> json) => _$SnapshotColorFromJson(json);
}

@freezed
abstract class SnapshotItem with _$SnapshotItem {
  const factory SnapshotItem({
    required SnapshotRef clothingType,
    required SnapshotColor color,
    required PieceRole role,
    @Default(true) bool isRequired,
  }) = _SnapshotItem;

  factory SnapshotItem.fromJson(Map<String, dynamic> json) => _$SnapshotItemFromJson(json);
}

@freezed
abstract class SnapshotImage with _$SnapshotImage {
  const factory SnapshotImage({
    required String url,
    String? thumbnailUrl,
    required String altText,
    String? credit,
    required String licenseType,
  }) = _SnapshotImage;

  factory SnapshotImage.fromJson(Map<String, dynamic> json) => _$SnapshotImageFromJson(json);
}

@freezed
abstract class LookSnapshot with _$LookSnapshot {
  const factory LookSnapshot({
    @Default(1) int schemaVersion,
    required String title,
    @Default(1) int catalogVersion,
    @JsonKey(includeIfNull: false) SnapshotRef? style,
    @JsonKey(includeIfNull: false) SnapshotRef? occasion,
    @JsonKey(includeIfNull: false) SnapshotImage? image,
    required List<SnapshotItem> items,
  }) = _LookSnapshot;

  factory LookSnapshot.fromJson(Map<String, dynamic> json) => _$LookSnapshotFromJson(json);

  static const maxItems = 12;
}

@freezed
abstract class Favorite with _$Favorite {
  const factory Favorite({
    @IdConverter() required String id,
    @NullableIdConverter() String? outfitId,
    required LookSnapshot snapshot,
    @UtcDateTimeConverter() required DateTime createdAt,
    @UtcDateTimeConverter() required DateTime updatedAt,
  }) = _Favorite;

  factory Favorite.fromJson(Map<String, dynamic> json) => _$FavoriteFromJson(json);
}

@freezed
abstract class FavoriteInput with _$FavoriteInput {
  const factory FavoriteInput({
    required String clientUuid,
    @JsonKey(includeIfNull: false) @NullableIdConverter() String? outfitId,
    required LookSnapshot snapshot,
  }) = _FavoriteInput;

  factory FavoriteInput.fromJson(Map<String, dynamic> json) => _$FavoriteInputFromJson(json);
}

@freezed
abstract class SavedOutfit with _$SavedOutfit {
  const factory SavedOutfit({
    @IdConverter() required String id,
    String? title,
    required CompositionPayload composition,
    int? score,
    @Default(1) int ruleVersion,
    @UtcDateTimeConverter() required DateTime createdAt,
    @UtcDateTimeConverter() required DateTime updatedAt,
  }) = _SavedOutfit;

  factory SavedOutfit.fromJson(Map<String, dynamic> json) => _$SavedOutfitFromJson(json);
}

@freezed
abstract class SavedOutfitInput with _$SavedOutfitInput {
  const factory SavedOutfitInput({
    String? title,
    required CompositionPayload composition,
    int? score,
    @Default(1) int ruleVersion,
  }) = _SavedOutfitInput;

  factory SavedOutfitInput.fromJson(Map<String, dynamic> json) => _$SavedOutfitInputFromJson(json);
}

enum SyncResource {
  @JsonValue('favorite')
  favorite,
  @JsonValue('saved_outfit')
  savedOutfit,
}

enum SyncOp {
  @JsonValue('upsert')
  upsert,
  @JsonValue('delete')
  delete,
}

@freezed
abstract class SyncChange with _$SyncChange {
  const factory SyncChange({
    required SyncResource resource,
    required SyncOp op,
    @IdConverter() required String id,
    @UtcDateTimeConverter() required DateTime updatedAt,
    @NullableUtcDateTimeConverter() DateTime? deletedAt,
    Map<String, dynamic>? data,
  }) = _SyncChange;

  factory SyncChange.fromJson(Map<String, dynamic> json) => _$SyncChangeFromJson(json);
}

@freezed
abstract class SyncPage with _$SyncPage {
  const factory SyncPage({
    required List<SyncChange> changes,
    required String cursor,
    @Default(false) bool hasMore,
  }) = _SyncPage;

  factory SyncPage.fromJson(Map<String, dynamic> json) => _$SyncPageFromJson(json);
}
