import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/app/router.dart';
import 'package:herycia/core/api/network_status.dart';
import 'package:herycia/design_system/design_system.dart';
import 'package:herycia/features/account/application/session_controller.dart';
import 'package:herycia/features/catalog/application/catalog_lookup.dart';
import 'package:herycia/features/compose_outfit/application/composition_controller.dart';
import 'package:herycia/features/compose_outfit/domain/outfit_composition.dart';
import 'package:herycia/features/favorites/application/favorites_controller.dart';
import 'package:herycia/features/looks/presentation/look_view.dart';
import 'package:herycia/features/recommendation/application/offline_engine.dart';
import 'package:herycia/mock_backend/mock_backend.dart';
import 'package:herycia/mock_backend/mock_fixtures.dart';

import '../helpers/app_harness.dart';
import '../helpers/mock_api.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockFixtures fixtures;
  setUpAll(() async => fixtures = await MockApiHarness.fixtures());

  Future<LookView> firstLook(ProviderContainer container) async {
    final lookup = await container.read(catalogLookupProvider.future);
    return LookView.fromLook(fixtures.looks.first, lookup);
  }

  testWidgets('favori sans compte : local, puis envoyé au serveur à la connexion', (tester) async {
    final harness = MockApiHarness(fixtures);
    final container = await pumpFullApp(tester, harness);
    final look = await firstLook(container);

    await container.read(favoritesProvider.notifier).toggle(look);
    await tester.pumpAndSettle();
    var state = container.read(favoritesProvider).value!;
    expect(state.visible, hasLength(1));
    expect(state.status, FavoritesSyncStatus.localOnly);

    await container.read(sessionProvider.notifier).login(MockBackend.demoEmail, MockBackend.demoPassword);
    await tester.pumpAndSettle();
    await container.read(favoritesProvider.notifier).sync();
    await tester.pumpAndSettle();

    state = container.read(favoritesProvider).value!;
    expect(state.status, FavoritesSyncStatus.synced);
    final demoId = container.read(sessionProvider).value!.id;
    expect(harness.backend.favorites[demoId]!.map((f) => f.snapshot.title), contains(look.title));
    expect(state.visible.length, harness.backend.favorites[demoId]!.length);
  });

  testWidgets('écran Favoris : retrait puis « Annuler »', (tester) async {
    final container = await pumpFullApp(tester, MockApiHarness(fixtures));
    final look = await firstLook(container);
    await container.read(favoritesProvider.notifier).toggle(look);
    await tester.tap(find.widgetWithText(NavigationDestination, 'Favoris'));
    await tester.pumpAndSettle();
    expect(find.byType(LookCard), findsOneWidget);

    final uuid = container.read(favoritesProvider).value!.visible.single.clientUuid;
    await tester.tap(find.byKey(ValueKey('favorite-remove-$uuid')));
    await tester.pumpAndSettle();
    expect(find.text('Aucun favori pour l\'instant'), findsOneWidget);
    await tester.tap(find.text('Annuler'));
    await tester.pumpAndSettle();
    expect(find.byType(LookCard), findsOneWidget);
  });

  testWidgets('hors ligne connecté : le favori attend, puis part au retour du réseau', (tester) async {
    final harness = MockApiHarness(fixtures);
    final container = await pumpFullApp(tester, harness);
    await container.read(sessionProvider.notifier).login(MockBackend.demoEmail, MockBackend.demoPassword);
    await tester.pumpAndSettle();
    final demoId = container.read(sessionProvider).value!.id;
    final before = harness.backend.favorites[demoId]!.length;

    container.read(offlineProvider.notifier).set(true);
    await tester.pumpAndSettle();
    expect(find.byType(OfflineBanner), findsOneWidget);

    await container.read(favoritesProvider.notifier).toggle(await firstLook(container));
    await tester.pumpAndSettle();
    expect(container.read(favoritesProvider).value!.status, FavoritesSyncStatus.pending);
    expect(harness.backend.favorites[demoId]!.length, before);

    container.read(offlineProvider.notifier).set(false);
    await container.read(favoritesProvider.notifier).sync();
    await tester.pumpAndSettle();
    expect(container.read(favoritesProvider).value!.status, FavoritesSyncStatus.synced);
    expect(harness.backend.favorites[demoId]!.length, before + 1);
  });

  testWidgets('hors ligne : évaluation calculée sur l’appareil', (tester) async {
    final container = await pumpFullApp(tester, MockApiHarness(fixtures));
    await container.read(offlineEngineProvider.future);
    ComposedPiece piece(String t, String c) => ComposedPiece(
          type: fixtures.types.firstWhere((x) => x.slug == t),
          color: fixtures.colors.firstWhere((x) => x.slug == c),
        );
    container.read(compositionProvider.notifier).restore(OutfitComposition.empty
        .withPiece(CompositionRole.top, piece('shirt', 'white'))
        .withPiece(CompositionRole.bottom, piece('trousers', 'navy'))
        .withPiece(CompositionRole.shoes, piece('loafers', 'brown')));
    container.read(offlineProvider.notifier).set(true);

    await tester.tap(find.byKey(const ValueKey('mode-full-outfit')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('compose-evaluate')));
    await tester.pumpAndSettle();
    expect(find.byType(ScoreRing), findsOneWidget);
    expect(find.text('CALCULÉ HORS LIGNE'), findsOneWidget);
    expect(find.byKey(const ValueKey('feedback-helpful')), findsNothing);
  });

  testWidgets('enregistrer une composition : invitation si déconnecté, sinon enregistrée', (tester) async {
    final harness = MockApiHarness(fixtures);
    final container = await pumpFullApp(tester, harness);
    ComposedPiece piece(String t, String c) => ComposedPiece(
          type: fixtures.types.firstWhere((x) => x.slug == t),
          color: fixtures.colors.firstWhere((x) => x.slug == c),
        );
    container.read(compositionProvider.notifier).restore(OutfitComposition.empty
        .withPiece(CompositionRole.onePiece, piece('dress', 'emerald'))
        .withPiece(CompositionRole.shoes, piece('sandals', 'camel')));
    container.read(routerProvider).go('/compose/outfit/evaluation');
    await tester.pumpAndSettle();

    await scrollTo(tester, find.byKey(const ValueKey('evaluation-save')));
    await tester.tap(find.byKey(const ValueKey('evaluation-save')));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('prompt-sign-in')), findsOneWidget);
    await tester.tap(find.text('Plus tard'));
    await tester.pumpAndSettle();

    await container.read(sessionProvider.notifier).login(MockBackend.demoEmail, MockBackend.demoPassword);
    await tester.pumpAndSettle();
    final demoId = container.read(sessionProvider).value!.id;
    final before = harness.backend.savedOutfits[demoId]!.length;
    await tester.tap(find.byKey(const ValueKey('evaluation-save')));
    await tester.pumpAndSettle();
    expect(harness.backend.savedOutfits[demoId]!.length, before + 1);
    expect(find.text('Composition enregistrée'), findsOneWidget);
  });
}
