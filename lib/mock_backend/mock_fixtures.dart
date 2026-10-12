import 'dart:convert';

import 'package:flutter/services.dart';

import '../features/catalog/domain/catalog_models.dart';
import '../features/looks/domain/look_models.dart';

class MockFixtures {
  const MockFixtures({
    required this.version,
    required this.categories,
    required this.types,
    required this.colors,
    required this.styles,
    required this.occasions,
    required this.colorGuide,
    required this.pairingRules,
    required this.recommendationRules,
    required this.looks,
  });

  static const files = {
    'version': 'assets/mock/catalog/version.json',
    'categories': 'assets/mock/catalog/clothing_categories.json',
    'types': 'assets/mock/catalog/clothing_types.json',
    'colors': 'assets/mock/catalog/colors.json',
    'styles': 'assets/mock/catalog/styles.json',
    'occasions': 'assets/mock/catalog/occasions.json',
    'colorGuide': 'assets/mock/catalog/color_guide.json',
    'pairingRules': 'assets/mock/rules/color_pairing_rules.json',
    'recommendationRules': 'assets/mock/rules/recommendation_rules.json',
    'looks': 'assets/mock/looks/outfits.json',
  };

  final CatalogVersion version;
  final List<ClothingCategory> categories;
  final List<ClothingType> types;
  final List<CatalogColor> colors;
  final List<OutfitStyle> styles;
  final List<Occasion> occasions;
  final ColorGuide colorGuide;
  final List<ColorPairingRule> pairingRules;
  final List<RecommendationRule> recommendationRules;
  final List<Look> looks;

  static Future<MockFixtures> load(AssetBundle bundle) async {
    Future<Object?> data(String key) async =>
        (jsonDecode(await bundle.loadString(files[key]!, cache: false)) as Map<String, dynamic>)['data'];

    Future<List<T>> list<T>(String key, T Function(Map<String, dynamic>) parse) async => [
          for (final item in await data(key) as List<dynamic>) parse(item as Map<String, dynamic>),
        ];

    return MockFixtures(
      version: CatalogVersion.fromJson(await data('version') as Map<String, dynamic>),
      categories: await list('categories', ClothingCategory.fromJson),
      types: await list('types', ClothingType.fromJson),
      colors: await list('colors', CatalogColor.fromJson),
      styles: await list('styles', OutfitStyle.fromJson),
      occasions: await list('occasions', Occasion.fromJson),
      colorGuide: ColorGuide.fromJson(await data('colorGuide') as Map<String, dynamic>),
      pairingRules: await list('pairingRules', ColorPairingRule.fromJson),
      recommendationRules: await list('recommendationRules', RecommendationRule.fromJson),
      looks: await list('looks', Look.fromJson),
    );
  }
}
