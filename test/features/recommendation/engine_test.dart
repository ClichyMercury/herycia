import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/features/looks/domain/look_models.dart';
import 'package:herycia/features/recommendation/domain/engine/catalog_index.dart';
import 'package:herycia/features/recommendation/domain/engine/outfit_evaluator.dart';
import 'package:herycia/features/recommendation/domain/engine/recommender.dart';
import 'package:herycia/features/recommendation/domain/recommendation_models.dart';
import 'package:herycia/mock_backend/mock_fixtures.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockFixtures fixtures;
  late CatalogIndex index;
  late OutfitEvaluator evaluator;
  late Recommender recommender;
  late Improver improver;

  setUpAll(() async {
    fixtures = await MockFixtures.load(rootBundle);
    index = CatalogIndex(
      categories: fixtures.categories,
      types: fixtures.types,
      colors: fixtures.colors,
      styles: fixtures.styles,
      occasions: fixtures.occasions,
      pairingRules: fixtures.pairingRules,
      recommendationRules: fixtures.recommendationRules,
      catalogVersion: fixtures.version.catalogVersion,
      rulesVersion: fixtures.version.rulesVersion,
    );
    evaluator = OutfitEvaluator(index);
    recommender = Recommender(evaluator);
    improver = Improver(evaluator);
  });

  EnginePiece piece(String typeSlug, String colorSlug) {
    final type = index.typeBySlug(typeSlug)!;
    return EnginePiece(
      type: type,
      color: index.colorBySlug(colorSlug)!,
      role: roleForGroup(index.groupOf(type.id)!),
    );
  }

  List<EnginePiece> office() => [
        piece('shirt', 'white'),
        piece('trousers', 'navy'),
        piece('dress-shoes', 'black'),
      ];

  group('Données de règles', () {
    test('une règle par paire de couleurs, sans doublon A-B / B-A', () {
      final keys = <String>{};
      for (final rule in fixtures.pairingRules) {
        final key = ([rule.colorAId, rule.colorBId]..sort()).join('|');
        expect(keys.add(key), isTrue, reason: key);
        expect(rule.colorAId, isNot(rule.colorBId));
      }
      final n = fixtures.colors.length;
      expect(keys, hasLength(n * (n - 1) ~/ 2));
    });

    test('explications courtes (≤ 90 caractères) et sans vocabulaire d’interdit', () {
      final banned = RegExp(r'interdit|faux|erreur de goût|à éviter', caseSensitive: false);
      for (final rule in fixtures.pairingRules) {
        expect(rule.explanation.length, lessThanOrEqualTo(90), reason: rule.explanation);
        expect(banned.hasMatch(rule.explanation), isFalse, reason: rule.explanation);
      }
      for (final rule in fixtures.recommendationRules) {
        expect(banned.hasMatch(rule.explanation), isFalse, reason: rule.explanation);
      }
    });

    test('les règles occasion/style référencent des slugs existants', () {
      for (final rule in fixtures.recommendationRules) {
        expect(index.typeBySlug(rule.conditionsJson['type_slug']!), isNotNull);
        final occasion = rule.conditionsJson['occasion_slug'];
        final style = rule.conditionsJson['style_slug'];
        if (occasion != null) expect(index.occasionsBySlug, contains(occasion));
        if (style != null) expect(index.stylesBySlug, contains(style));
      }
    });

    test('les looks référencent des types et couleurs du catalogue', () {
      for (final look in fixtures.looks) {
        for (final item in look.items) {
          expect(index.typesById, contains(item.clothingTypeId), reason: look.title);
          expect(index.colorsById, contains(item.colorId), reason: look.title);
          expect(roleForGroup(index.groupOf(item.clothingTypeId)!), item.role, reason: look.title);
        }
      }
    });
  });

  group('OutfitEvaluator', () {
    test('score sur 100 décomposé selon les poids du cahier des charges', () {
      final result = evaluator.evaluate(office());
      final b = result.breakdown;
      expect(b.color, inInclusiveRange(0, 40));
      expect(b.structure, 25);
      expect(b.occasion, 15);
      expect(b.style, 10);
      expect(b.completeness, inInclusiveRange(0, 10));
      expect(result.score, b.total);
      expect(result.score, lessThanOrEqualTo(100));
    });

    test('déterministe à entrées identiques', () {
      final a = evaluator.evaluate(office(), occasion: index.occasionsBySlug['work']);
      final b = evaluator.evaluate(office(), occasion: index.occasionsBySlug['work']);
      expect(a.breakdown, b.breakdown);
      expect(a.explanation, b.explanation);
      expect(a.warnings, b.warnings);
    });

    test('une tenue classique de bureau obtient un bon score', () {
      final result = evaluator.evaluate(
        office(),
        occasion: index.occasionsBySlug['work'],
        style: index.stylesBySlug['classic'],
      );
      expect(result.score, greaterThanOrEqualTo(85));
      expect(result.warnings, isEmpty);
      expect(result.strengths, isNotEmpty);
    });

    test('pièces manquantes : remarques structurelles distinctes des préférences', () {
      final result = evaluator.evaluate([piece('shirt', 'white')]);
      final codes = result.warnings.map((w) => w.code);
      expect(codes, containsAll(['missing_bottom', 'missing_shoes']));
      expect(result.warnings.every((w) => w.kind == RemarkKind.structural), isTrue);
      expect(result.hasStructuralIssue, isTrue);
    });

    test('robe + bas : contradiction signalée, score nettement plus bas', () {
      final dressAndJeans = evaluator.evaluate([
        piece('dress', 'navy'),
        piece('jeans', 'navy'),
        piece('sneakers', 'white'),
      ]);
      expect(dressAndJeans.warnings.map((w) => w.code), contains('one_piece_conflict'));
      final dressOnly = evaluator.evaluate([piece('dress', 'navy'), piece('sneakers', 'white')]);
      expect(dressOnly.hasStructuralIssue, isFalse);
      expect(dressOnly.score, greaterThan(dressAndJeans.score));
    });

    test('doublons : deux hauts, même accessoire deux fois', () {
      final result = evaluator.evaluate([
        ...office(),
        piece('t-shirt', 'navy'),
        piece('watch', 'black'),
        piece('watch', 'black'),
      ]);
      expect(result.warnings.map((w) => w.code), containsAll(['duplicate_role', 'duplicate_accessory']));
    });

    test('règle d’occasion : baskets à une cérémonie → remarque de style, points réduits', () {
      final pieces = [piece('shirt', 'white'), piece('trousers', 'navy'), piece('sneakers', 'white')];
      final ceremony = evaluator.evaluate(pieces, occasion: index.occasionsBySlug['ceremony']);
      final everyday = evaluator.evaluate(pieces, occasion: index.occasionsBySlug['everyday']);
      expect(ceremony.breakdown.occasion, lessThan(everyday.breakdown.occasion));
      final remark = ceremony.warnings.singleWhere((w) => w.code == 'occasion_mismatch');
      expect(remark.kind, RemarkKind.style);
    });

    test('règle de style : cravate en streetwear', () {
      final result = evaluator.evaluate(
        [...office(), piece('tie', 'burgundy')],
        style: index.stylesBySlug['streetwear'],
      );
      expect(result.breakdown.style, lessThan(10));
      expect(result.warnings.map((w) => w.code), contains('style_mismatch'));
    });

    test('plus de trois couleurs vives : remarque sans interdire', () {
      final result = evaluator.evaluate([
        piece('sweater', 'red'),
        piece('trousers', 'emerald'),
        piece('sneakers', 'mustard'),
        piece('bag', 'purple'),
      ]);
      expect(result.warnings.map((w) => w.code), contains('many_accents'));
      expect(result.score, greaterThan(0));
    });

    test('contraste très faible signalé', () {
      final result = evaluator.evaluate([
        piece('shirt', 'white'),
        piece('trousers', 'off-white'),
        piece('loafers', 'white'),
      ]);
      expect(result.warnings.map((w) => w.code), contains('low_contrast'));
    });

    test('un accessoire augmente la complétude', () {
      final without = evaluator.evaluate(office());
      final withBelt = evaluator.evaluate([...office(), piece('belt', 'black')]);
      expect(withBelt.breakdown.completeness, greaterThan(without.breakdown.completeness));
    });
  });

  group('Improver', () {
    final clashing = [
      ('sweater', 'fuchsia'),
      ('jeans', 'orange'),
      ('sneakers', 'purple'),
    ];

    test('propose des changements qui augmentent vraiment le score', () {
      final pieces = [for (final (t, c) in clashing) piece(t, c)];
      final current = evaluator.evaluate(pieces).score;
      final improvements = improver.improve(pieces);
      expect(improvements, isNotEmpty);
      for (final imp in improvements) {
        expect(imp.gain, greaterThanOrEqualTo(Improver.minGain));
        expect(imp.newScore, current + imp.gain);
        final i = pieces.indexWhere((p) => p.type.id == imp.clothingTypeId);
        final changed = [...pieces]..[i] = pieces[i].withColor(index.colorsById[imp.toColorId]!);
        expect(evaluator.evaluate(changed).score, imp.newScore);
      }
    });

    test('une pièce et une couleur cible différentes par suggestion, triées par gain', () {
      final improvements = improver.improve([for (final (t, c) in clashing) piece(t, c)]);
      expect(improvements.map((i) => i.clothingTypeId).toSet(), hasLength(improvements.length));
      expect(improvements.map((i) => i.toColorId).toSet(), hasLength(improvements.length));
      for (var i = 1; i < improvements.length; i++) {
        expect(improvements[i - 1].gain, greaterThanOrEqualTo(improvements[i].gain));
      }
    });

    test('rien à proposer pour une tenue déjà très harmonieuse', () {
      expect(improver.improve(office(), occasion: index.occasionsBySlug['work']), isEmpty);
    });
  });

  group('Recommender (mode A)', () {
    RecommendationOutcome run(String type, String color, {String? occasion, String? style}) =>
        recommender.fromItem(
          anchorType: index.typeBySlug(type)!,
          anchorColor: index.colorBySlug(color)!,
          looks: fixtures.looks,
          occasion: occasion == null ? null : index.occasionsBySlug[occasion],
          style: style == null ? null : index.stylesBySlug[style],
        );

    test('la pièce de départ est présente dans chaque résultat', () {
      for (final (type, color) in [('shirt', 'sky-blue'), ('jeans', 'black'), ('dress', 'red'), ('sneakers', 'orange'), ('watch', 'camel')]) {
        final outcome = run(type, color);
        expect(outcome.results, isNotEmpty, reason: '$type $color');
        final anchorType = index.typeBySlug(type)!.id;
        final anchorColor = index.colorBySlug(color)!.id;
        for (final r in outcome.results) {
          final anchors = r.items.where((i) => i.isAnchor).toList();
          expect(anchors, hasLength(1), reason: r.title);
          expect(anchors.single.clothingTypeId, anchorType);
          expect(anchors.single.colorId, anchorColor);
        }
      }
    });

    test('au plus 5 résultats, triés, sans doublon, chacun expliqué', () {
      final outcome = run('shirt', 'sky-blue');
      expect(outcome.results.length, lessThanOrEqualTo(5));
      final signatures = outcome.results
          .map((r) => (r.items.where((i) => i.role != PieceRole.accessory).map((i) => '${i.clothingTypeId}:${i.colorId}').toList()..sort()).join('|'))
          .toList();
      expect(signatures.toSet(), hasLength(signatures.length));
      for (var i = 1; i < outcome.results.length; i++) {
        expect(outcome.results[i - 1].score, greaterThanOrEqualTo(outcome.results[i].score));
      }
      for (final r in outcome.results) {
        expect(r.explanation, isNotEmpty);
      }
    });

    test('jamais de look brouillon ou archivé', () {
      final hidden = fixtures.looks.where((l) => l.status != LookStatus.published).map((l) => l.id).toSet();
      for (final (t, c) in [('sweater', 'khaki-green'), ('t-shirt', 'pale-yellow')]) {
        for (final r in run(t, c).results) {
          expect(hidden, isNot(contains(r.outfitId)));
        }
      }
    });

    test('photo du look seulement si la pièce choisie est identique et la licence approuvée', () {
      final outcome = run('shirt', 'sky-blue', occasion: 'work');
      final original = outcome.results.firstWhere((r) => r.outfitId == '1');
      expect(original.image, isNotNull);
      expect(original.title, 'Chemise bleu ciel et chino beige');
      for (final r in outcome.results.where((r) => r.outfitId != '1')) {
        expect(r.image, isNull, reason: r.title);
      }
      final unapproved = run('jacket', 'orange').results.where((r) => r.outfitId == '11');
      for (final r in unapproved) {
        expect(r.image, isNull);
      }
    });

    test('élargissement dans l’ordre : style, occasion, nuances, neutres', () {
      final outcome = run('t-shirt', 'fuchsia', occasion: 'ceremony', style: 'elegant');
      final order = outcome.broadened.map((b) => b.criterion).toList();
      const expected = [
        BroadeningCriterion.style,
        BroadeningCriterion.occasion,
        BroadeningCriterion.neighborShades,
        BroadeningCriterion.neutralAdvice,
      ];
      expect(order, expected.take(order.length).toList());
      expect(order.first, BroadeningCriterion.style);
    });

    test('sans élargissement quand il y a assez de bons résultats', () {
      expect(run('shirt', 'sky-blue', occasion: 'work').broadened, isEmpty);
    });

    test('déterministe', () {
      final a = run('jeans', 'navy', style: 'casual');
      final b = run('jeans', 'navy', style: 'casual');
      expect(a.results, b.results);
      expect(a.broadened, b.broadened);
    });

    test('conseils neutres en dernier recours : aucune photo, pièce de départ conservée', () {
      final advice = recommender.fromItem(
        anchorType: index.typeBySlug('jumpsuit')!,
        anchorColor: index.colorBySlug('lavender')!,
        looks: const [],
      );
      expect(advice.broadened.last.criterion, BroadeningCriterion.neutralAdvice);
      expect(advice.results, isNotEmpty);
      for (final r in advice.results) {
        expect(r.outfitId, isNull);
        expect(r.image, isNull);
        expect(r.items.where((i) => i.isAnchor), hasLength(1));
      }
    });
  });
}
