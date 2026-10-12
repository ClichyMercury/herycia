import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/design_system/gallery/design_system_gallery.dart';
import 'package:herycia/features/account/presentation/profile_screen.dart';
import 'package:herycia/features/compose_outfit/presentation/compose_outfit_screen.dart';
import 'package:herycia/features/favorites/presentation/favorites_screen.dart';
import 'package:herycia/features/home/presentation/home_screen.dart';

import 'package:herycia/mock_backend/mock_fixtures.dart';

import '../helpers/app_harness.dart';
import '../helpers/mock_api.dart';
import '../helpers/pump_app.dart';

late MockFixtures fixtures;

Future<void> pumpApp(WidgetTester tester, {bool devTools = true}) =>
    pumpFullApp(tester, MockApiHarness(fixtures), devTools: devTools);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async => fixtures = await MockApiHarness.fixtures());

  testWidgets('démarre sur l’onglet Composer avec 3 onglets', (tester) async {
    await pumpApp(tester);
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byType(NavigationDestination), findsNWidgets(3));
    for (final label in ['Composer', 'Favoris', 'Profil']) {
      expect(find.widgetWithText(NavigationDestination, label), findsOneWidget);
    }
  });

  testWidgets('change d’onglet et revient depuis l’état vide des favoris', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.widgetWithText(NavigationDestination, 'Favoris'));
    await tester.pumpAndSettle();
    expect(find.byType(FavoritesScreen), findsOneWidget);
    expect(find.text('Aucun favori pour l\'instant'), findsOneWidget);

    await tester.tap(find.widgetWithText(NavigationDestination, 'Profil'));
    await tester.pumpAndSettle();
    expect(find.byType(ProfileScreen), findsOneWidget);

    await tester.tap(find.widgetWithText(NavigationDestination, 'Favoris'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Composer une tenue'));
    await tester.pumpAndSettle();
    expect(find.byType(ComposeOutfitScreen), findsOneWidget);
  });

  testWidgets('« Composer une tenue » ouvre l’écran de composition, retour possible', (tester) async {
    await pumpApp(tester);
    await tester.tap(find.byKey(const ValueKey('mode-full-outfit')));
    await tester.pumpAndSettle();
    expect(find.byType(ComposeOutfitScreen), findsOneWidget);
    expect(find.byType(NavigationBar), findsOneWidget);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('la galerie du design system est accessible en dev', (tester) async {
    await pumpApp(tester);
    await tester.tap(find.widgetWithText(NavigationDestination, 'Profil'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('design-system-tile')));
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.byType(DesignSystemGallery), findsOneWidget);
  });

  testWidgets('la galerie est absente hors dev', (tester) async {
    await pumpApp(tester, devTools: false);
    await tester.tap(find.widgetWithText(NavigationDestination, 'Profil'));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('design-system-tile')), findsNothing);
  });

  testWidgets('le thème suit le système par défaut', (tester) async {
    await pumpApp(tester);
    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.themeMode, ThemeMode.system);
    expect(app.darkTheme, isNotNull);
  });

  testWidgets('la galerie s’affiche sans erreur en clair et en sombre', (tester) async {
    for (final mode in [ThemeMode.light, ThemeMode.dark]) {
      await tester.pumpDs(const DesignSystemGallery(), themeMode: mode);
      await tester.pump(const Duration(seconds: 1));
      expect(tester.takeException(), isNull);
    }
  });
}
