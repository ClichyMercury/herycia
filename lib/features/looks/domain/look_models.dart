import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/json/id_converter.dart';

part 'look_models.freezed.dart';
part 'look_models.g.dart';

enum LookStatus {
  @JsonValue('draft')
  draft,
  @JsonValue('published')
  published,
  @JsonValue('archived')
  archived,
}

enum LookOrigin {
  @JsonValue('editorial')
  editorial,
  @JsonValue('stylist')
  stylist,
  @JsonValue('vendor')
  vendor,
}

enum PieceRole {
  @JsonValue('top')
  top,
  @JsonValue('bottom')
  bottom,
  @JsonValue('one_piece')
  onePiece,
  @JsonValue('shoes')
  shoes,
  @JsonValue('accessory')
  accessory,
}

enum LicenseType {
  @JsonValue('owned')
  owned,
  @JsonValue('cc0')
  cc0,
  @JsonValue('cc_by')
  ccBy,
  @JsonValue('unsplash')
  unsplash,
  @JsonValue('partner')
  partner,
}

@freezed
abstract class LookImage with _$LookImage {
  const LookImage._();

  const factory LookImage({
    @IdConverter() required String id,
    required String url,
    String? thumbnailUrl,
    required String sourceName,
    String? sourceUrl,
    required LicenseType licenseType,
    String? attribution,
    required bool usageApproved,
    required String altText,
  }) = _LookImage;

  factory LookImage.fromJson(Map<String, dynamic> json) => _$LookImageFromJson(json);

  bool get requiresCredit => licenseType == LicenseType.ccBy || attribution != null;
}

@freezed
abstract class LookItem with _$LookItem {
  const factory LookItem({
    @IdConverter() required String id,
    @IdConverter() required String clothingTypeId,
    @IdConverter() required String colorId,
    required PieceRole role,
    @Default(true) bool isRequired,
    @Default(0) int sortOrder,
  }) = _LookItem;

  factory LookItem.fromJson(Map<String, dynamic> json) => _$LookItemFromJson(json);
}

@freezed
abstract class Look with _$Look {
  const factory Look({
    @IdConverter() required String id,
    required String title,
    required String slug,
    required String description,
    @NullableIdConverter() String? styleId,
    @NullableIdConverter() String? occasionId,
    required LookStatus status,
    @NullableUtcDateTimeConverter() DateTime? publishedAt,
    @Default(LookOrigin.editorial) LookOrigin origin,
    required List<LookItem> items,
    LookImage? primaryImage,
    @Default([]) List<LookImage> images,
  }) = _Look;

  factory Look.fromJson(Map<String, dynamic> json) => _$LookFromJson(json);
}

@freezed
abstract class PageMeta with _$PageMeta {
  const factory PageMeta({
    required int currentPage,
    required int perPage,
    required int total,
    required int lastPage,
  }) = _PageMeta;

  factory PageMeta.fromJson(Map<String, dynamic> json) => _$PageMetaFromJson(json);
}

class Paginated<T> {
  const Paginated({required this.data, required this.meta});

  final List<T> data;
  final PageMeta meta;

  bool get hasMore => meta.currentPage < meta.lastPage;
}

@freezed
abstract class LookQuery with _$LookQuery {
  const LookQuery._();

  const factory LookQuery({
    String? styleSlug,
    String? occasionSlug,
    @Default(1) int page,
    @Default(10) int perPage,
  }) = _LookQuery;

  Map<String, String> toQuery() => {
        'style_slug': ?styleSlug,
        'occasion_slug': ?occasionSlug,
        'page': '$page',
        'per_page': '$perPage',
      };
}
