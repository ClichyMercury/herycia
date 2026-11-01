import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/design_system/design_system.dart';
import 'package:herycia/features/compose_from_item/presentation/from_item_results_screen.dart';
import 'package:herycia/features/compose_outfit/application/composition_controller.dart';
import 'package:herycia/features/compose_outfit/presentation/compose_outfit_screen.dart';
import 'package:herycia/features/favorites/application/favorites_controller.dart';
import 'package:herycia/features/looks/presentation/look_detail_screen.dart';
import 'package:herycia/mock_backend/mock_fixtures.dart';

import '../helpers/app_harness.dart';
import '../helpers/mock_api.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockFixtures fixtures;
  setUpAll(() async => fixtures = await MockApiHarness.fixtures());

  Future<void> chooseShirt(WidgetTester tester) async {
    await tester.tap(find.byKey(const ValueKey('mode-from-item')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('category-hauts')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('type-chemise')));
    await tester.pumpAndSettle();
    await scrollTo(tester, find.byKey(const ValueKey('swatch-bleu-ciel')));
    await tester.tap(find.byKey(const ValueKey('swatch-bleu-ciel')));
    await tester.pumpAndSettle();
  }

  testWidgets('pièce → filtres → résultats : la pièce de départ est partout', (tester) async {
    await pumpFullApp(tester, MockApiHarness(fixtures));
    await chooseShirt(tester);

    expect(find.text('Pour quelle occasion ?'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('occasion-travail-entretien')));
    await tester.pumpAndSettle();
    expect(find.text('Chemise bleu ciel · Travail / entretien'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('from-item-show')));
    await tester.pumpAndSettle();
    expect(find.byType(FromItemResultsScreen), findsOneWidget);
    expect(find.text('Votre pièce : Chemise bleu ciel'), findsOneWidget);
    expect(find.byType(LookCard), findsWidgets);
    expect(find.textContaining("nous avons ignoré l'occasion"), findsOneWidget);
  });

  testWidgets('retour arrière dans les étapes avec « Changer »', (tester) async {
    await pumpFullApp(tester, MockApiHarness(fixtures));
    await chooseShirt(tester);
    await tester.tap(find.byKey(const ValueKey('from-item-change')));
    await tester.pumpAndSettle();
    expect(find.text('De quelle couleur ?'), findsOneWidget);
  });

  testWidgets('élargissement annoncé quand les filtres sont trop stricts', (tester) async {
    await pumpFullApp(tester, MockApiHarness(fixtures));
    await tester.tap(find.byKey(const ValueKey('mode-from-item')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('category-hauts')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('type-t-shirt')));
    await tester.pumpAndSettle();
    await scrollTo(tester, find.byKey(const ValueKey('swatch-fuchsia')));
    await tester.tap(find.byKey(const ValueKey('swatch-fuchsia')));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const ValueKey('occasion-ceremonie')));
    await tester.tap(find.byKey(const ValueKey('occasion-ceremonie')));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const ValueKey('style-minimaliste')));
    await tester.tap(find.byKey(const ValueKey('style-minimaliste')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('from-item-show')));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('broadened')), findsOneWidget);
  });

  testWidgets('fiche d’un résultat, favori, puis « Composer à partir de ce look »', (tester) async {
    final container = await pumpFullApp(tester, MockApiHarness(fixtures));
    await chooseShirt(tester);
    await tester.tap(find.byKey(const ValueKey('from-item-show')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('result-0')));
    await tester.pumpAndSettle();
    expect(find.byType(LookDetailScreen), findsOneWidget);
    await scrollTo(tester, find.text('VOTRE PIÈCE'));
    expect(find.text('VOTRE PIÈCE'), findsOneWidget);

    final heart = find.descendant(of: find.byType(AppBar), matching: find.byType(InkWell));
    await tester.tap(heart.last);
    await tester.pumpAndSettle();
    expect(container.read(favoritesProvider).value!.visible, hasLength(1));

    await scrollTo(tester, find.byKey(const ValueKey('look-use-as-base')));
    await tester.tap(find.byKey(const ValueKey('look-use-as-base')));
    await tester.pumpAndSettle();
    expect(find.byType(ComposeOutfitScreen), findsOneWidget);
    expect(container.read(compositionProvider).top!.type.slug, 'chemise');
    expect(container.read(compositionProvider).top!.color.slug, 'bleu-ciel');
  });
}
