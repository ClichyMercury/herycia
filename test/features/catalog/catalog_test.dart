import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/core/api/api_client.dart';
import 'package:herycia/core/json/id_converter.dart';
import 'package:herycia/features/catalog/data/api_catalog_repository.dart';
import 'package:herycia/features/catalog/domain/catalog_models.dart';
import 'package:herycia/mock_backend/mock_api_client.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('IdConverter', () {
    const converter = IdConverter();

    test('accepte un entier ou une chaîne et renvoie une chaîne', () {
      expect(converter.fromJson(12), '12');
      expect(converter.fromJson('01J9Z3'), '01J9Z3');
      expect(converter.fromJson('6f1c2a9e-0b7d-4c1e-9a3f-2b1d0c9e8f7a'),
          '6f1c2a9e-0b7d-4c1e-9a3f-2b1d0c9e8f7a');
    });

    test('renvoie un entier quand l’identifiant est numérique, sinon la chaîne', () {
      expect(converter.toJson('12'), 12);
      expect(converter.toJson('01J9Z3'), '01J9Z3');
    });

    test('rejette une chaîne vide ou un autre type', () {
      expect(() => converter.fromJson(''), throwsFormatException);
      expect(() => converter.fromJson(1.5), throwsFormatException);
    });
  });

  group('parseHexColor', () {
    test('lit un code avec ou sans #', () {
      expect(parseHexColor('#1F2A44'), const Color(0xFF1F2A44));
      expect(parseHexColor('c19a6b'), const Color(0xFFC19A6B));
    });

    test('rejette un code invalide', () {
      expect(() => parseHexColor('#FFF'), throwsFormatException);
      expect(() => parseHexColor('#GGGGGG'), throwsFormatException);
    });
  });

  group('Modèles du catalogue', () {
    test('CatalogColor lit le JSON snake_case de l’API', () {
      final color = CatalogColor.fromJson({
        'id': 3,
        'name': 'Bleu marine',
        'slug': 'navy',
        'hex_code': '#1F2A44',
        'color_family': 'blue',
        'temperature': 'cool',
        'brightness': 0.19,
        'saturation': 1,
        'is_neutral': true,
      });
      expect(color.id, '3');
      expect(color.colorFamily, 'blue');
      expect(color.saturation, 1.0);
      expect(color.isNeutral, isTrue);
      expect(color.color, const Color(0xFF1F2A44));
    });

    test('valeurs par défaut quand les champs facultatifs manquent', () {
      final color = CatalogColor.fromJson({
        'id': 'c1',
        'name': 'Camel',
        'slug': 'camel',
        'hex_code': '#C19A6B',
        'color_family': 'camel',
      });
      expect(color.isNeutral, isFalse);
      expect(color.temperature, isNull);
    });

    test('ClothingCategory convertit le group_type', () {
      final category = ClothingCategory.fromJson({
        'id': 3,
        'name': 'Pièces complètes',
        'slug': 'one-piece',
        'group_type': 'one_piece',
      });
      expect(category.groupType, CategoryGroup.onePiece);
      expect(category.isOptional, isFalse);
    });

    test('aller-retour JSON sans perte', () {
      const type = ClothingType(
        id: '12',
        categoryId: '2',
        name: 'Jean',
        slug: 'jeans',
        sortOrder: 2,
      );
      expect(ClothingType.fromJson(type.toJson()), type);
      expect(type.toJson()['category_id'], 2);
    });

    test('égalité par valeur', () {
      const a = Occasion(id: '2', name: 'Travail', slug: 'work');
      const b = Occasion(id: '2', name: 'Travail', slug: 'work');
      expect(a, b);
      expect(a.copyWith(slug: 'office'), isNot(b));
    });
  });

  group('Données mock livrées avec l’app', () {
    final r = ApiCatalogRepository(MockApiClient.fromBundle(
      rootBundle,
      tokenStore: InMemoryTokenStore(),
      latency: Duration.zero,
    ));

    test('les 5 catégories du cahier des charges, accessoires facultatifs', () async {
      final categories = await r.categories();
      expect(categories.map((c) => c.groupType), [
        CategoryGroup.top,
        CategoryGroup.bottom,
        CategoryGroup.onePiece,
        CategoryGroup.shoes,
        CategoryGroup.accessory,
      ]);
      expect(categories.where((c) => c.isOptional).map((c) => c.groupType), [CategoryGroup.accessory]);
    });

    test('seules robe et combinaison sont des pièces complètes', () async {
      final categories = await r.categories();
      final onePieceCategory = categories.firstWhere((c) => c.groupType == CategoryGroup.onePiece);
      final types = await r.types();
      expect(types.where((t) => t.isOnePiece).map((t) => t.slug).toSet(), {'dress', 'jumpsuit'});
      expect(types.where((t) => t.isOnePiece).every((t) => t.categoryId == onePieceCategory.id), isTrue);
    });

    test('chaque type référence une catégorie existante', () async {
      final ids = (await r.categories()).map((c) => c.id).toSet();
      for (final type in await r.types()) {
        expect(ids, contains(type.categoryId));
      }
    });

    test('couleurs : hex valides, slugs uniques, 15 familles couvertes', () async {
      final colors = await r.colors();
      for (final c in colors) {
        expect(() => c.color, returnsNormally);
      }
      expect(colors.map((c) => c.slug).toSet(), hasLength(colors.length));
      expect(colors.map((c) => c.colorFamily).toSet(), {
        'black', 'white', 'grey', 'beige', 'cream', 'brown', 'camel', 'blue',
        'green', 'red', 'burgundy', 'pink', 'purple', 'yellow', 'orange',
      });
    });

    test('styles et occasions initiaux en slugs anglais', () async {
      expect((await r.styles()).map((s) => s.slug), [
        'classic', 'casual', 'smart-casual', 'elegant', 'minimalist', 'bold', 'streetwear',
      ]);
      expect((await r.occasions()).map((o) => o.slug), [
        'everyday', 'work', 'night-out', 'ceremony', 'evening', 'casual-event',
      ]);
    });

    test('slugs de types uniques', () async {
      final types = await r.types();
      expect(types.map((t) => t.slug).toSet(), hasLength(types.length));
    });
  });
}
