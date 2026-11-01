import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/app/router.dart';
import 'package:herycia/core/api/network_status.dart';
import 'package:herycia/core/storage/app_database.dart';
import 'package:herycia/design_system/design_system.dart';
import 'package:herycia/features/account/application/session_controller.dart';
import 'package:herycia/features/catalog/application/catalog_lookup.dart';
import 'package:herycia/features/catalog/application/catalog_providers.dart';
import 'package:herycia/features/catalog/domain/catalog_models.dart';
import 'package:herycia/features/compose_from_item/application/from_item_controller.dart';
import 'package:herycia/features/compose_outfit/application/composition_controller.dart';
import 'package:herycia/features/compose_outfit/domain/outfit_composition.dart';
import 'package:herycia/features/favorites/application/favorites_controller.dart';
import 'package:herycia/features/favorites/application/saved_outfits_providers.dart';
import 'package:herycia/features/favorites/application/wardrobe_providers.dart';
import 'package:herycia/features/looks/domain/look_models.dart';
import 'package:herycia/features/looks/presentation/look_view.dart';
import 'package:herycia/mock_backend/mock_backend.dart';
import 'package:herycia/mock_backend/mock_fixtures.dart';

import '../helpers/app_harness.dart';
import '../helpers/mock_api.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockFixtures fixtures;
  setUpAll(() async => fixtures = await MockApiHarness.fixtures());

  const demoId = '0197b2c4-7d1e-7a3b-9f10-2c8e5a4d6b11';

  Future<LookView> firstLook(ProviderContainer container) async {
    final lookup = await container.read(catalogLookupProvider.future);
    return LookView.fromLook(Look.fromJson(fixtures.outfits.first), lookup);
  }

  ComposedPiece piece(String t, String c) => ComposedPiece(
        type: ClothingType.fromJson(fixtures.types.firstWhere((x) => x['slug'] == t)),
        color: CatalogColor.fromJson(fixtures.colors.firstWhere((x) => x['slug'] == c)),
      );

  Future<void> login(WidgetTester tester, ProviderContainer container) async {
    await container.read(sessionProvider.notifier).login(MockBackend.demoEmail, MockBackend.demoPassword);
    await tester.pumpAndSettle();
  }

  testWidgets('favori sans compte : local, puis envoyé au serveur à la connexion', (tester) async {
    final harness = MockApiHarness(fixtures);
    final container = await pumpFullApp(tester, harness);
    final look = await firstLook(container);

    await container.read(favoritesProvider.notifier).toggle(look);
    await tester.pumpAndSettle();
    expect(container.read(favoritesProvider).value!.visible, hasLength(1));
    expect(container.read(wardrobeSyncProvider), WardrobeSyncStatus.localOnly);
    expect(harness.backend.callCounts['POST /me/favorites'], isNull);

    await login(tester, container);

    expect(container.read(wardrobeSyncProvider), WardrobeSyncStatus.synced);
    final remote = harness.backend.favorites[demoId]!.values.single;
    expect(remote.data['outfit_id'], look.outfitId);
    expect(container.read(favoritesProvider).value!.visible.single.syncState, SyncState.synced);
    expect(container.read(favoritesProvider).value!.contains(look), isTrue);
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

  testWidgets('hors ligne connecté : le favori attend, puis part tout seul au retour du réseau', (tester) async {
    final harness = MockApiHarness(fixtures);
    final container = await pumpFullApp(tester, harness);
    await login(tester, container);

    container.read(simulatedOfflineProvider.notifier).set(true);
    await tester.pumpAndSettle();
    expect(find.byType(OfflineBanner), findsOneWidget);

    await container.read(favoritesProvider.notifier).toggle(await firstLook(container));
    await tester.pumpAndSettle();
    expect(container.read(wardrobeSyncProvider), WardrobeSyncStatus.pending);
    expect(harness.backend.favorites[demoId] ?? const {}, isEmpty);

    container.read(simulatedOfflineProvider.notifier).set(false);
    await tester.pumpAndSettle();
    expect(container.read(wardrobeSyncProvider), WardrobeSyncStatus.synced);
    expect(harness.backend.favorites[demoId], hasLength(1));
  });

  testWidgets('favori ajouté sur un autre appareil : récupéré par la synchronisation', (tester) async {
    final harness = MockApiHarness(fixtures);
    final container = await pumpFullApp(tester, harness);
    await login(tester, container);
    final token = await harness.signIn();
    await harness.client.post('/me/favorites', body: {
      'client_uuid': '7b0f3c2e-5d41-4f6a-9a3e-2c1d8e4b6a90',
      'outfit_id': fixtures.outfits.last['id'],
    });
    expect(token, isNotEmpty);

    await container.read(wardrobeSyncProvider.notifier).sync();
    await tester.pumpAndSettle();
    expect(container.read(favoritesProvider).value!.visible.single.outfitId, fixtures.outfits.last['id']);
  });

  testWidgets('hors ligne : évaluation déjà reçue rejouée avec sa date, sans demande d’avis', (tester) async {
    final harness = MockApiHarness(fixtures);
    final container = await pumpFullApp(tester, harness);
    await login(tester, container);
    container.read(compositionProvider.notifier).restore(OutfitComposition.empty
        .withPiece(CompositionRole.top, piece('chemise', 'blanc'))
        .withPiece(CompositionRole.bottom, piece('pantalon', 'bleu-marine'))
        .withPiece(CompositionRole.shoes, piece('mocassins', 'marron')));
    container.read(routerProvider).go(AppRoutes.evaluation);
    await tester.pumpAndSettle();
    await scrollTo(tester, find.byKey(const ValueKey('feedback-helpful')));
    expect(find.byKey(const ValueKey('feedback-helpful')), findsOneWidget);
    container.read(routerProvider).go(AppRoutes.composeOutfit);
    await tester.pumpAndSettle();

    container.read(simulatedOfflineProvider.notifier).set(true);
    container.read(routerProvider).go(AppRoutes.evaluation);
    await tester.pumpAndSettle();
    expect(find.byType(ScoreRing), findsOneWidget);
    expect(find.byKey(const ValueKey('cached-result')), findsOneWidget);
    expect(find.byKey(const ValueKey('feedback-helpful')), findsNothing);
  });

  testWidgets('hors ligne sans résultat en cache : conseils du guide des couleurs, jamais de faux score', (tester) async {
    final container = await pumpFullApp(tester, MockApiHarness(fixtures));
    final lookup = await container.read(catalogLookupProvider.future);
    await container.read(colorGuideProvider.future);
    await tester.pumpAndSettle();
    final draft = container.read(fromItemDraftProvider.notifier)
      ..selectCategory(lookup.categoryOf(CategoryGroup.top)!)
      ..selectType(lookup.typeBySlug('chemise')!);
    draft.selectColor(lookup.colorBySlug('noir')!);

    container.read(simulatedOfflineProvider.notifier).set(true);
    container.read(routerProvider).go(AppRoutes.fromItemResults);
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('offline-hints')), findsOneWidget);
    expect(find.text('Avec du noir'), findsOneWidget);
    expect(find.byType(ScoreRing), findsNothing);
  });

  testWidgets('composition enregistrée sans compte : locale, puis envoyée à la connexion', (tester) async {
    final harness = MockApiHarness(fixtures);
    final container = await pumpFullApp(tester, harness);
    container.read(compositionProvider.notifier).restore(OutfitComposition.empty
        .withPiece(CompositionRole.onePiece, piece('robe', 'vert'))
        .withPiece(CompositionRole.shoes, piece('sandales', 'camel')));
    container.read(routerProvider).go(AppRoutes.evaluation);
    await tester.pumpAndSettle();

    await scrollTo(tester, find.byKey(const ValueKey('evaluation-save')));
    await tester.tap(find.byKey(const ValueKey('evaluation-save')));
    await tester.pumpAndSettle();
    expect(find.text('Composition enregistrée'), findsOneWidget);
    expect((await container.read(savedOutfitsProvider.future)).single.score, isNotNull);
    expect(harness.backend.callCounts['POST /me/saved-outfits'], isNull);

    await login(tester, container);
    final remote = harness.backend.savedOutfits[demoId]!.values.single;
    expect((remote.data['composition'] as Map)['items'], hasLength(2));
    expect(remote.data['rule_version'], 1);
  });

  testWidgets('session expirée : bandeau, mode visiteur, données locales conservées', (tester) async {
    final harness = MockApiHarness(fixtures);
    final container = await pumpFullApp(tester, harness);
    await login(tester, container);
    await container.read(favoritesProvider.notifier).toggle(await firstLook(container));
    await tester.pumpAndSettle();

    harness.backend.revokeAllTokens(harness.backend.users[MockBackend.demoEmail]!);
    await container.read(wardrobeSyncProvider.notifier).sync();
    await tester.pumpAndSettle();

    expect(container.read(sessionProvider).value, isNull);
    expect(await harness.tokens.read(), isNull);
    expect(find.byKey(const ValueKey('session-expired-banner')), findsOneWidget);
    expect(container.read(favoritesProvider).value!.visible, hasLength(1));
  });
}
