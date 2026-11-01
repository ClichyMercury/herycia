import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/catalog_models.dart';
import 'catalog_providers.dart';

class CatalogLookup {
  CatalogLookup({
    required this.categories,
    required this.types,
    required this.colors,
    required this.styles,
    required this.occasions,
  })  : _categories = {for (final c in categories) c.id: c},
        _types = {for (final t in types) t.id: t},
        _typesBySlug = {for (final t in types) t.slug: t},
        _colors = {for (final c in colors) c.id: c},
        _colorsBySlug = {for (final c in colors) c.slug: c},
        _styles = {for (final s in styles) s.id: s},
        _stylesBySlug = {for (final s in styles) s.slug: s},
        _occasions = {for (final o in occasions) o.id: o},
        _occasionsBySlug = {for (final o in occasions) o.slug: o};

  final List<ClothingCategory> categories;
  final List<ClothingType> types;
  final List<CatalogColor> colors;
  final List<OutfitStyle> styles;
  final List<Occasion> occasions;
  final Map<String, ClothingCategory> _categories;
  final Map<String, ClothingType> _types;
  final Map<String, ClothingType> _typesBySlug;
  final Map<String, CatalogColor> _colors;
  final Map<String, CatalogColor> _colorsBySlug;
  final Map<String, OutfitStyle> _styles;
  final Map<String, OutfitStyle> _stylesBySlug;
  final Map<String, Occasion> _occasions;
  final Map<String, Occasion> _occasionsBySlug;

  ClothingType? type(String id) => _types[id];

  ClothingType? typeBySlug(String slug) => _typesBySlug[slug];

  ClothingType typeOf(CatalogRef ref) => _types[ref.id] ?? _typesBySlug[ref.slug] ?? ClothingType.fromRef(ref);

  CatalogColor? color(String id) => _colors[id];

  CatalogColor? colorBySlug(String slug) => _colorsBySlug[slug];

  CatalogColor colorOf(ColorRef ref) => _colors[ref.id] ?? _colorsBySlug[ref.slug] ?? CatalogColor.fromRef(ref);

  OutfitStyle? style(String id) => _styles[id];

  OutfitStyle? styleBySlug(String? slug) => slug == null ? null : _stylesBySlug[slug];

  Occasion? occasion(String id) => _occasions[id];

  Occasion? occasionBySlug(String? slug) => slug == null ? null : _occasionsBySlug[slug];

  CategoryGroup? groupOf(String typeId) {
    final type = _types[typeId];
    return type == null ? null : _categories[type.categoryId]?.groupType;
  }

  ClothingCategory? categoryOf(CategoryGroup group) {
    for (final c in categories) {
      if (c.groupType == group) return c;
    }
    return null;
  }
}

final catalogLookupProvider = FutureProvider<CatalogLookup>((ref) async {
  final (categories, types, colors, styles, occasions) = await (
    ref.watch(categoriesProvider.future),
    ref.watch(catalogRepositoryProvider).types(),
    ref.watch(colorsProvider.future),
    ref.watch(stylesProvider.future),
    ref.watch(occasionsProvider.future),
  ).wait;
  return CatalogLookup(
    categories: categories,
    types: types,
    colors: colors,
    styles: styles,
    occasions: occasions,
  );
});
