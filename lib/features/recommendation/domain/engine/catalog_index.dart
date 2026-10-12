import '../../../catalog/domain/catalog_models.dart';
import '../../../looks/domain/look_models.dart';

PieceRole roleForGroup(CategoryGroup group) => switch (group) {
      CategoryGroup.top => PieceRole.top,
      CategoryGroup.bottom => PieceRole.bottom,
      CategoryGroup.onePiece => PieceRole.onePiece,
      CategoryGroup.shoes => PieceRole.shoes,
      CategoryGroup.accessory => PieceRole.accessory,
    };

class CatalogIndex {
  CatalogIndex({
    required List<ClothingCategory> categories,
    required List<ClothingType> types,
    required List<CatalogColor> colors,
    required List<OutfitStyle> styles,
    required List<Occasion> occasions,
    required List<ColorPairingRule> pairingRules,
    required List<RecommendationRule> recommendationRules,
    required this.catalogVersion,
    required this.rulesVersion,
  })  : categoriesById = {for (final c in categories) c.id: c},
        typesById = {for (final t in types) t.id: t},
        colorsById = {for (final c in colors) c.id: c},
        stylesBySlug = {for (final s in styles) s.slug: s},
        stylesById = {for (final s in styles) s.id: s},
        occasionsBySlug = {for (final o in occasions) o.slug: o},
        occasionsById = {for (final o in occasions) o.id: o},
        colors = List.unmodifiable(colors),
        types = List.unmodifiable(types),
        _pairs = {for (final r in pairingRules) _key(r.colorAId, r.colorBId): r},
        recommendationRules = List.unmodifiable(recommendationRules);

  final Map<String, ClothingCategory> categoriesById;
  final Map<String, ClothingType> typesById;
  final Map<String, CatalogColor> colorsById;
  final Map<String, OutfitStyle> stylesBySlug;
  final Map<String, OutfitStyle> stylesById;
  final Map<String, Occasion> occasionsBySlug;
  final Map<String, Occasion> occasionsById;
  final List<CatalogColor> colors;
  final List<ClothingType> types;
  final List<RecommendationRule> recommendationRules;
  final String catalogVersion;
  final String rulesVersion;
  final Map<String, ColorPairingRule> _pairs;

  static String _key(String a, String b) => a.compareTo(b) <= 0 ? '$a|$b' : '$b|$a';

  ColorPairingRule? pairRule(String colorA, String colorB) => _pairs[_key(colorA, colorB)];

  CategoryGroup? groupOf(String typeId) {
    final type = typesById[typeId];
    return type == null ? null : categoriesById[type.categoryId]?.groupType;
  }

  ClothingType? typeBySlug(String slug) {
    for (final t in types) {
      if (t.slug == slug) return t;
    }
    return null;
  }

  ClothingType? firstTypeOf(CategoryGroup group) {
    for (final t in types) {
      if (groupOf(t.id) == group) return t;
    }
    return null;
  }

  CatalogColor? colorBySlug(String slug) {
    for (final c in colors) {
      if (c.slug == slug) return c;
    }
    return null;
  }
}
