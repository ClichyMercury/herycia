import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/design_system/design_system.dart';
import 'package:herycia/features/catalog/application/catalog_lookup.dart';
import 'package:herycia/features/catalog/domain/catalog_models.dart';
import 'package:herycia/features/compose_outfit/application/composition_controller.dart';
import 'package:herycia/features/compose_outfit/domain/outfit_composition.dart';
import 'package:herycia/features/compose_outfit/presentation/evaluation_screen.dart';
import 'package:herycia/mock_backend/mock_fixtures.dart';

import '../../helpers/mock_api.dart';
import '../../helpers/pump_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockFixtures fixtures;
  setUpAll(() async => fixtures = await MockApiHarness.fixtures());

  ComposedPiece piece(String typeSlug, String colorSlug) => ComposedPiece(
        type: ClothingType.fromJson(fixtures.types.firstWhere((t) => t['slug'] == typeSlug)),
        color: CatalogColor.fromJson(fixtures.colors.firstWhere((c) => c['slug'] == colorSlug)),
      );

  Future<ProviderContainer> pumpEvaluation(
    WidgetTester tester,
    OutfitComposition composition, {
    bool signedIn = false,
  }) async {
    final harness = MockApiHarness(fixtures);
    if (signedIn) await harness.signIn();
    await tester.binding.setSurfaceSize(const Size(430, 1600));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpDs(const EvaluationScreen(), overrides: harness.overrides, tokens: harness.tokens);
    final container = ProviderScope.containerOf(tester.element(find.byType(EvaluationScreen)));
    container.read(compositionProvider.notifier).restore(composition);
    container.read(catalogLookupProvider);
    await tester.pumpAndSettle();
    return container;
  }

  testWidgets('affiche le score, les points forts et la répartition', (tester) async {
    await pumpEvaluation(
      tester,
      OutfitComposition.empty
          .withPiece(CompositionRole.top, piece('chemise', 'blanc'))
          .withPiece(CompositionRole.bottom, piece('pantalon', 'bleu-marine'))
          .withPiece(CompositionRole.shoes, piece('chaussures-habillees', 'noir'))
          .withContext(occasionSlug: 'travail-entretien', styleSlug: 'classique'),
    );
    final ring = tester.widget<ScoreRing>(find.byType(ScoreRing));
    expect(ring.score, greaterThanOrEqualTo(80));
    expect(find.text('Votre tenue est complète.'), findsOneWidget);
    expect(find.text('Points forts'), findsOneWidget);
    expect(find.text('STRUCTURE'), findsNothing);

    await tester.tap(find.text('Comment c\'est calculé ?'));
    await tester.pumpAndSettle();
    expect(find.text('Harmonie des couleurs'), findsOneWidget);
    expect(find.text('25 / 25'), findsOneWidget);
  });

  testWidgets('remarques structurelles et suggestion appliquée : avant / après', (tester) async {
    final container = await pumpEvaluation(
      tester,
      OutfitComposition.empty
          .withPiece(CompositionRole.top, piece('pull', 'fuchsia'))
          .withPiece(CompositionRole.bottom, piece('jean', 'orange')),
    );
    final before = tester.widget<ScoreRing>(find.byType(ScoreRing)).score;
    final composition = container.read(compositionProvider);
    expect(find.text('Il manque encore des pièces pour compléter la tenue.'), findsOneWidget);
    expect(find.text('STRUCTURE'), findsWidgets);
    expect(find.text('Pour aller plus loin'), findsOneWidget);

    await tester.tap(find.text('Essayer').first);
    await tester.pumpAndSettle();

    final after = tester.widget<ScoreRing>(find.byType(ScoreRing)).score;
    expect(after, greaterThan(before));
    expect(find.byKey(const ValueKey('before-after')), findsOneWidget);
    expect(container.read(compositionProvider), isNot(composition));
  });

  testWidgets('envoi d’un feedback', (tester) async {
    await pumpEvaluation(
      tester,
      OutfitComposition.empty
          .withPiece(CompositionRole.onePiece, piece('robe', 'bordeaux'))
          .withPiece(CompositionRole.shoes, piece('sandales', 'noir')),
      signedIn: true,
    );
    await tester.tap(find.byKey(const ValueKey('feedback-helpful')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Parfait');
    await tester.tap(find.byKey(const ValueKey('feedback-send')));
    await tester.pumpAndSettle();
    expect(find.text('Merci pour votre retour !'), findsOneWidget);
  });

  testWidgets('visiteur : pas de demande d’avis, la composition s’enregistre en local', (tester) async {
    await pumpEvaluation(
      tester,
      OutfitComposition.empty
          .withPiece(CompositionRole.onePiece, piece('robe', 'bordeaux'))
          .withPiece(CompositionRole.shoes, piece('sandales', 'noir')),
    );
    expect(find.byKey(const ValueKey('feedback-helpful')), findsNothing);
    await tester.tap(find.byKey(const ValueKey('evaluation-save')));
    await tester.pumpAndSettle();
    expect(find.text('Composition enregistrée'), findsOneWidget);
  });
}
