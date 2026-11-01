import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/json/id_converter.dart';

part 'catalog_models.freezed.dart';
part 'catalog_models.g.dart';

enum CategoryGroup {
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
}

@freezed
abstract class CatalogRef with _$CatalogRef {
  const factory CatalogRef({
    @IdConverter() required String id,
    required String slug,
    required String name,
  }) = _CatalogRef;

  factory CatalogRef.fromJson(Map<String, dynamic> json) => _$CatalogRefFromJson(json);
}

@freezed
abstract class ColorRef with _$ColorRef {
  const factory ColorRef({
    @IdConverter() required String id,
    required String slug,
    required String name,
    required String hexCode,
  }) = _ColorRef;

  factory ColorRef.fromJson(Map<String, dynamic> json) => _$ColorRefFromJson(json);
}

@freezed
abstract class ClothingCategory with _$ClothingCategory {
  const factory ClothingCategory({
    @IdConverter() required String id,
    required String name,
    required String slug,
    required CategoryGroup groupType,
    @Default(false) bool isOptional,
    @Default(0) int sortOrder,
  }) = _ClothingCategory;

  factory ClothingCategory.fromJson(Map<String, dynamic> json) =>
      _$ClothingCategoryFromJson(json);
}

@freezed
abstract class ClothingType with _$ClothingType {
  const ClothingType._();

  const factory ClothingType({
    @IdConverter() required String id,
    @IdConverter() required String categoryId,
    required String name,
    required String slug,
    @Default(false) bool isOnePiece,
    @Default(0) int sortOrder,
  }) = _ClothingType;

  factory ClothingType.fromJson(Map<String, dynamic> json) => _$ClothingTypeFromJson(json);

  factory ClothingType.fromRef(CatalogRef ref) =>
      ClothingType(id: ref.id, categoryId: '', name: ref.name, slug: ref.slug);

  static const outerwearSlugs = {'veste', 'blazer'};

  bool get canBeOuterwear => outerwearSlugs.contains(slug);
}

@freezed
abstract class CatalogColor with _$CatalogColor {
  const CatalogColor._();

  const factory CatalogColor({
    @IdConverter() required String id,
    required String name,
    required String slug,
    required String hexCode,
    required String colorFamily,
    String? temperature,
    String? brightness,
    String? saturation,
    @Default(false) bool isNeutral,
    @Default([]) List<String> aliases,
  }) = _CatalogColor;

  factory CatalogColor.fromJson(Map<String, dynamic> json) => _$CatalogColorFromJson(json);

  factory CatalogColor.fromRef(ColorRef ref) =>
      CatalogColor(id: ref.id, name: ref.name, slug: ref.slug, hexCode: ref.hexCode, colorFamily: '');

  Color get color => parseHexColor(hexCode);
}

@freezed
abstract class OutfitStyle with _$OutfitStyle {
  const factory OutfitStyle({
    @IdConverter() required String id,
    required String name,
    required String slug,
    String? description,
    @Default(0) int sortOrder,
  }) = _OutfitStyle;

  factory OutfitStyle.fromJson(Map<String, dynamic> json) => _$OutfitStyleFromJson(json);
}

@freezed
abstract class Occasion with _$Occasion {
  const factory Occasion({
    @IdConverter() required String id,
    required String name,
    required String slug,
    String? description,
    @Default(0) int sortOrder,
  }) = _Occasion;

  factory Occasion.fromJson(Map<String, dynamic> json) => _$OccasionFromJson(json);
}

@freezed
abstract class CatalogVersion with _$CatalogVersion {
  const factory CatalogVersion({
    required int catalogVersion,
    required int rulesVersion,
  }) = _CatalogVersion;

  factory CatalogVersion.fromJson(Map<String, dynamic> json) => _$CatalogVersionFromJson(json);
}

@freezed
abstract class ColorFamilyGuide with _$ColorFamilyGuide {
  const factory ColorFamilyGuide({
    required String slug,
    required String name,
    @IdListConverter() required List<String> colorIds,
  }) = _ColorFamilyGuide;

  factory ColorFamilyGuide.fromJson(Map<String, dynamic> json) => _$ColorFamilyGuideFromJson(json);
}

@freezed
abstract class ColorPartner with _$ColorPartner {
  const factory ColorPartner({
    @IdConverter() required String colorId,
    required int score,
    required String explanation,
  }) = _ColorPartner;

  factory ColorPartner.fromJson(Map<String, dynamic> json) => _$ColorPartnerFromJson(json);
}

enum HarmonyKind { harmonious, contrast, neutralPairing, caution }

@freezed
abstract class ColorHarmony with _$ColorHarmony {
  const ColorHarmony._();

  const factory ColorHarmony({
    @IdConverter() required String colorId,
    @Default([]) List<ColorPartner> harmonious,
    @Default([]) List<ColorPartner> contrast,
    @Default([]) List<ColorPartner> neutralPairing,
    @Default([]) List<ColorPartner> caution,
  }) = _ColorHarmony;

  factory ColorHarmony.fromJson(Map<String, dynamic> json) => _$ColorHarmonyFromJson(json);

  List<ColorPartner> of(HarmonyKind kind) => switch (kind) {
        HarmonyKind.harmonious => harmonious,
        HarmonyKind.contrast => contrast,
        HarmonyKind.neutralPairing => neutralPairing,
        HarmonyKind.caution => caution,
      };
}

@freezed
abstract class ColorGuide with _$ColorGuide {
  const ColorGuide._();

  const factory ColorGuide({
    @Default(1) int catalogVersion,
    @Default(1) int rulesVersion,
    required List<ColorFamilyGuide> families,
    @IdListConverter() @Default([]) List<String> neutralColorIds,
    @Default([]) List<ColorHarmony> harmonies,
  }) = _ColorGuide;

  factory ColorGuide.fromJson(Map<String, dynamic> json) => _$ColorGuideFromJson(json);

  ColorHarmony? harmonyFor(String colorId) => harmonies.where((h) => h.colorId == colorId).firstOrNull;

  bool isNeutralFamily(ColorFamilyGuide family) =>
      family.colorIds.isNotEmpty && family.colorIds.every(neutralColorIds.contains);

  List<ColorPartner> partnersOf(String colorId, {Set<HarmonyKind> kinds = const {
    HarmonyKind.harmonious,
    HarmonyKind.neutralPairing,
    HarmonyKind.contrast,
  }}) {
    final harmony = harmonyFor(colorId);
    if (harmony == null) return const [];
    return [for (final kind in kinds) ...harmony.of(kind)]..sort((a, b) => b.score.compareTo(a.score));
  }
}

Color parseHexColor(String hex) {
  final cleaned = hex.trim().replaceFirst('#', '');
  if (cleaned.length != 6 || int.tryParse(cleaned, radix: 16) == null) {
    throw FormatException('Code couleur invalide : $hex');
  }
  return Color(0xFF000000 | int.parse(cleaned, radix: 16));
}
