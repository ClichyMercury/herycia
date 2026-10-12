import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/json/id_converter.dart';
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
abstract class LookSnapshot with _$LookSnapshot {
  const factory LookSnapshot({
    required String title,
    required List<RequestItem> items,
    String? occasionSlug,
    String? styleSlug,
    int? score,
    String? imageUrl,
    String? explanation,
  }) = _LookSnapshot;

  factory LookSnapshot.fromJson(Map<String, dynamic> json) => _$LookSnapshotFromJson(json);
}

@freezed
abstract class Favorite with _$Favorite {
  const factory Favorite({
    @IdConverter() required String id,
    required String clientUuid,
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
    @NullableIdConverter() String? outfitId,
    required LookSnapshot snapshot,
  }) = _FavoriteInput;

  factory FavoriteInput.fromJson(Map<String, dynamic> json) => _$FavoriteInputFromJson(json);
}

@freezed
abstract class SavedOutfit with _$SavedOutfit {
  const factory SavedOutfit({
    @IdConverter() required String id,
    required String clientUuid,
    String? title,
    required CompositionPayload composition,
    int? score,
    String? ruleVersion,
    @UtcDateTimeConverter() required DateTime createdAt,
    @UtcDateTimeConverter() required DateTime updatedAt,
  }) = _SavedOutfit;

  factory SavedOutfit.fromJson(Map<String, dynamic> json) => _$SavedOutfitFromJson(json);
}

@freezed
abstract class SavedOutfitInput with _$SavedOutfitInput {
  const factory SavedOutfitInput({
    required String clientUuid,
    String? title,
    required CompositionPayload composition,
    int? score,
    String? ruleVersion,
    @NullableUtcDateTimeConverter() DateTime? baseUpdatedAt,
  }) = _SavedOutfitInput;

  factory SavedOutfitInput.fromJson(Map<String, dynamic> json) => _$SavedOutfitInputFromJson(json);
}
