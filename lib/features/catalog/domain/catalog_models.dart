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
  @JsonValue('shoes')
  shoes,
  @JsonValue('accessory')
  accessory,
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
  const factory ClothingType({
    @IdConverter() required String id,
    @IdConverter() required String categoryId,
    required String name,
    required String slug,
    @Default(false) bool isOnePiece,
    @Default(0) int sortOrder,
  }) = _ClothingType;

  factory ClothingType.fromJson(Map<String, dynamic> json) => _$ClothingTypeFromJson(json);
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
    double? brightness,
    double? saturation,
    @Default(false) bool isNeutral,
  }) = _CatalogColor;

  factory CatalogColor.fromJson(Map<String, dynamic> json) => _$CatalogColorFromJson(json);

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
    required String catalogVersion,
    required String rulesVersion,
    @UtcDateTimeConverter() required DateTime updatedAt,
  }) = _CatalogVersion;

  factory CatalogVersion.fromJson(Map<String, dynamic> json) => _$CatalogVersionFromJson(json);
}

@freezed
abstract class ColorFamilyGuide with _$ColorFamilyGuide {
  const factory ColorFamilyGuide({
    required String slug,
    required String name,
    required String description,
    @Default(false) bool isNeutral,
    @IdListConverter() required List<String> colorIds,
    @IdListConverter() @Default([]) List<String> pairsWellWithColorIds,
  }) = _ColorFamilyGuide;

  factory ColorFamilyGuide.fromJson(Map<String, dynamic> json) => _$ColorFamilyGuideFromJson(json);
}

@freezed
abstract class GuidePrinciple with _$GuidePrinciple {
  const factory GuidePrinciple({
    required String slug,
    required String title,
    required String body,
    @IdListConverter() @Default([]) List<String> exampleColorIds,
  }) = _GuidePrinciple;

  factory GuidePrinciple.fromJson(Map<String, dynamic> json) => _$GuidePrincipleFromJson(json);
}

@freezed
abstract class ColorGuide with _$ColorGuide {
  const factory ColorGuide({
    required List<ColorFamilyGuide> families,
    required List<GuidePrinciple> principles,
  }) = _ColorGuide;

  factory ColorGuide.fromJson(Map<String, dynamic> json) => _$ColorGuideFromJson(json);
}

enum PairingRuleType {
  @JsonValue('neutral_base')
  neutralBase,
  @JsonValue('tone_on_tone')
  toneOnTone,
  @JsonValue('analogous')
  analogous,
  @JsonValue('complementary')
  complementary,
  @JsonValue('contrast')
  contrast,
  @JsonValue('bold')
  bold,
}

@freezed
abstract class ColorPairingRule with _$ColorPairingRule {
  const factory ColorPairingRule({
    @IdConverter() required String id,
    @IdConverter() required String colorAId,
    @IdConverter() required String colorBId,
    required PairingRuleType ruleType,
    required double compatibilityScore,
    required String explanation,
    required String ruleVersion,
  }) = _ColorPairingRule;

  factory ColorPairingRule.fromJson(Map<String, dynamic> json) => _$ColorPairingRuleFromJson(json);
}

enum RecommendationRuleType {
  @JsonValue('type_occasion')
  typeOccasion,
  @JsonValue('type_style')
  typeStyle,
}

@freezed
abstract class RecommendationRule with _$RecommendationRule {
  const factory RecommendationRule({
    @IdConverter() required String id,
    required String name,
    required RecommendationRuleType ruleType,
    required Map<String, String> conditionsJson,
    required double weight,
    required String explanation,
    required String version,
  }) = _RecommendationRule;

  factory RecommendationRule.fromJson(Map<String, dynamic> json) =>
      _$RecommendationRuleFromJson(json);
}

Color parseHexColor(String hex) {
  final cleaned = hex.trim().replaceFirst('#', '');
  if (cleaned.length != 6 || int.tryParse(cleaned, radix: 16) == null) {
    throw FormatException('Code couleur invalide : $hex');
  }
  return Color(0xFF000000 | int.parse(cleaned, radix: 16));
}
