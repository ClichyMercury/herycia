import 'dart:convert';

import 'package:flutter/services.dart';

typedef Json = Map<String, dynamic>;

class MockFixtures {
  const MockFixtures({
    required this.version,
    required this.categories,
    required this.types,
    required this.colors,
    required this.styles,
    required this.occasions,
    required this.colorGuide,
    required this.outfits,
  });

  static const files = {
    'version': 'assets/mock/catalog_version.json',
    'categories': 'assets/mock/clothing_categories.json',
    'types': 'assets/mock/clothing_types.json',
    'colors': 'assets/mock/colors.json',
    'styles': 'assets/mock/styles.json',
    'occasions': 'assets/mock/occasions.json',
    'colorGuide': 'assets/mock/color_guide.json',
    'outfits': 'assets/mock/outfits.json',
  };

  final Json version;
  final List<Json> categories;
  final List<Json> types;
  final List<Json> colors;
  final List<Json> styles;
  final List<Json> occasions;
  final Json colorGuide;
  final List<Json> outfits;

  static Future<MockFixtures> load(AssetBundle bundle) async {
    Future<Object?> data(String key) async =>
        (jsonDecode(await bundle.loadString(files[key]!, cache: false)) as Json)['data'];

    Future<List<Json>> list(String key) async => [for (final item in await data(key) as List<dynamic>) item as Json];

    return MockFixtures(
      version: await data('version') as Json,
      categories: await list('categories'),
      types: await list('types'),
      colors: await list('colors'),
      styles: await list('styles'),
      occasions: await list('occasions'),
      colorGuide: await data('colorGuide') as Json,
      outfits: await list('outfits'),
    );
  }
}
