import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/core/api/api_client.dart';
import 'package:herycia/features/catalog/domain/catalog_models.dart';
import 'package:herycia/features/looks/domain/look_models.dart';
import 'package:herycia/features/recommendation/domain/recommendation_models.dart';

import '../helpers/mock_api.dart';

Map<String, dynamic> fixture(String name) =>
    jsonDecode(File('test/fixtures/$name.json').readAsStringSync()) as Map<String, dynamic>;

List<Map<String, dynamic>> fixtureList(String name) =>
    [for (final item in fixture(name)['data'] as List<dynamic>) item as Map<String, dynamic>];

Set<String> keysOf(Object? json) => json is Map<String, dynamic> ? json.keys.toSet() : const {};

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('réponses réelles de hery.mikoha.com', () {
    test('référentiel : UUID, slugs français, rôles du contrat', () {
      final categories = fixtureList('clothing_categories').map(ClothingCategory.fromJson).toList();
      expect(categories.map((c) => c.groupType), containsAll(CategoryGroup.values));
      final types = fixtureList('clothing_types').map(ClothingType.fromJson).toList();
      expect(types.map((t) => t.slug), containsAll(['chemise', 'pantalon', 'baskets', 'veste', 'blazer']));
      expect(types.where((t) => t.canBeOuterwear).map((t) => t.slug), unorderedEquals(['veste', 'blazer']));
      final colors = fixtureList('colors').map(CatalogColor.fromJson).toList();
      expect(colors, hasLength(42));
      expect(colors.every((c) => c.color.a == 1), isTrue);
      expect(fixtureList('styles').map(OutfitStyle.fromJson).map((s) => s.slug), contains('classique'));
      expect(fixtureList('occasions').map(Occasion.fromJson).map((o) => o.slug), contains('travail-entretien'));
      expect(CatalogVersion.fromJson(fixture('catalog_version')['data'] as Map<String, dynamic>).catalogVersion, 1);
    });

    test('guide des couleurs : familles, neutres et quatre types d’harmonie', () {
      final guide = ColorGuide.fromJson(fixture('color_guide')['data'] as Map<String, dynamic>);
      expect(guide.families, hasLength(15));
      expect(guide.neutralColorIds, isNotEmpty);
      final black = guide.harmonyFor('e4415da7-2919-5acc-8b06-5657736ae031')!;
      expect(black.contrast.first.explanation, isNotEmpty);
      expect(guide.partnersOf(black.colorId), isNotEmpty);
    });

    test('looks : image et crédit, pièces avec rôle outerwear', () {
      final looks = fixtureList('outfits').map(Look.fromJson).toList();
      expect(looks, isNotEmpty);
      expect(looks.every((l) => l.image?.requiresCredit ?? true), isTrue);
      expect(looks.expand((l) => l.items).map((i) => i.role), contains(PieceRole.outerwear));
      expect(PageMeta.fromJson(fixture('outfits')['meta'] as Map<String, dynamic>).total, looks.length);
    });

    test('mode A : pièce de départ, filtres appliqués, élargissement', () {
      final normal = FromItemResponse.fromJson(fixture('from_item_chemise_blanc').dataMap);
      expect(normal.startingItem.clothingType.slug, 'chemise');
      for (final r in normal.results) {
        expect(r.items.where((i) => i.isStartingItem), hasLength(1));
        expect(r.scoreBreakdown.total, r.score);
      }
      final broadened = FromItemResponse.fromJson(fixture('from_item_broadened').dataMap);
      expect(broadened.broadened.applied, isTrue);
      expect(broadened.broadened.steps, [BroadeningCriterion.style, BroadeningCriterion.occasion]);
      expect(broadened.filters.styleSlug, isNull);
    });

    test('évaluation et améliorations : avertissements typés, changements par index', () {
      final evaluation = EvaluationResponse.fromJson(fixture('evaluate_incomplete').dataMap);
      expect(evaluation.isComplete, isFalse);
      expect(evaluation.warnings.map((w) => w.type), containsAll(WarningType.values));
      expect(evaluation.scoreBreakdown.color.max, 40);
      final improvements = ImprovementResponse.fromJson(fixture('improve_incomplete').dataMap);
      expect(improvements.improvements.map((i) => i.change.action), containsAll([ChangeAction.addItem, ChangeAction.replaceItem]));
      expect(improvements.improvements.every((i) => i.resultingScore > improvements.currentScore), isTrue);
    });
  });

  group('le faux serveur répond avec la même forme que le vrai', () {
    late MockApiHarness api;

    setUp(() async => api = MockApiHarness(await MockApiHarness.fixtures()));

    test('mode A', () async {
      final real = fixture('from_item_chemise_blanc').dataMap;
      final mock = (await api.client.post('/recommendations/from-item', body: {
        'clothing_type_id': 'f9c84ba6-8813-5dc9-84be-bf8a5c4e0521',
        'color_id': '0491898d-fc0d-51ca-9b9f-e2cdadf5a975',
      }))
          .dataMap;
      expect(keysOf(mock), keysOf(real));
      expect(keysOf((mock['results'] as List).first), keysOf((real['results'] as List).first));
      expect(
        keysOf(((mock['results'] as List).first as Map)['items'][0]),
        keysOf(((real['results'] as List).first as Map)['items'][0]),
      );
    });

    test('évaluation et améliorations', () async {
      final body = {
        'items': [
          {'clothing_type_id': '1d867035-98c1-5c73-b792-1b1234231248', 'color_id': '1639317e-4f0a-588b-a4ac-63513aba2829', 'role': 'bottom'},
          {'clothing_type_id': 'f9c84ba6-8813-5dc9-84be-bf8a5c4e0521', 'color_id': '0491898d-fc0d-51ca-9b9f-e2cdadf5a975', 'role': 'top'},
        ],
      };
      final evaluation = (await api.client.post('/recommendations/evaluate-outfit', body: body)).dataMap;
      expect(keysOf(evaluation), keysOf(fixture('evaluate_incomplete').dataMap));
      final improve = (await api.client.post('/recommendations/improve-outfit', body: body)).dataMap;
      final real = fixture('improve_incomplete').dataMap;
      expect(keysOf(improve), keysOf(real));
      expect(keysOf((improve['improvements'] as List).first), keysOf((real['improvements'] as List).first));
    });
  });
}
