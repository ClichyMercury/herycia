import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/json/id_converter.dart';
import '../../catalog/domain/catalog_models.dart';

part 'look_models.freezed.dart';
part 'look_models.g.dart';

enum PieceRole {
  @JsonValue('top')
  top,
  @JsonValue('bottom')
  bottom,
  @JsonValue('one_piece')
  onePiece,
  @JsonValue('footwear')
  footwear,
  @JsonValue('accessory')
  accessory,
  @JsonValue('outerwear')
  outerwear;

  String get wire => switch (this) {
        PieceRole.onePiece => 'one_piece',
        _ => name,
      };

  static PieceRole fromWire(String value) => values.firstWhere((r) => r.wire == value);
}

@freezed
abstract class LookImage with _$LookImage {
  const LookImage._();

  const factory LookImage({
    @IdConverter() required String id,
    required String url,
    String? thumbnailUrl,
    required String altText,
    String? credit,
    required String licenseType,
    String? sourceName,
    String? sourceUrl,
  }) = _LookImage;

  factory LookImage.fromJson(Map<String, dynamic> json) => _$LookImageFromJson(json);

  bool get requiresCredit => credit != null && credit!.isNotEmpty;
}

@freezed
abstract class LookItem with _$LookItem {
  const factory LookItem({
    required CatalogRef clothingType,
    required ColorRef color,
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
    String? description,
    CatalogRef? style,
    CatalogRef? occasion,
    LookImage? image,
    required List<LookItem> items,
    @Default('editorial') String origin,
    @NullableUtcDateTimeConverter() DateTime? publishedAt,
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
    String? excludeId,
    @Default(1) int page,
    @Default(10) int perPage,
  }) = _LookQuery;

  Map<String, String> toQuery() => {
        'style': ?styleSlug,
        'occasion': ?occasionSlug,
        'exclude': ?excludeId,
        'page': '$page',
        'per_page': '$perPage',
      };
}
