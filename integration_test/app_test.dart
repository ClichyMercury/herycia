import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/app/app.dart';
import 'package:herycia/app/router.dart';
import 'package:herycia/core/config/env.dart';
import 'package:herycia/core/storage/app_database.dart';
import 'package:herycia/design_system/design_system.dart';
import 'package:herycia/features/account/application/session_controller.dart';
import 'package:herycia/features/catalog/application/catalog_lookup.dart';
import 'package:herycia/features/compose_outfit/application/composition_controller.dart';
import 'package:herycia/features/compose_outfit/domain/outfit_composition.dart';
import 'package:herycia/features/favorites/application/favorites_controller.dart';
import 'package:herycia/features/favorites/application/wardrobe_providers.dart';
import 'package:integration_test/integration_test.dart';

Future<void> pumpUntil(WidgetTester tester, Finder finder, {Duration timeout = const Duration(seconds: 60)}) async {
  final end = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(end)) {
    await tester.pump(const Duration(milliseconds: 200));
    if (finder.evaluate().isNotEmpty) return;
  }
  final visible = tester.widgetList<Text>(find.byType(Text).hitTestable()).map((t) => t.data).join(' | ');
  throw TestFailure('Introuvable après ${timeout.inSeconds} s : $finder\nÀ l’écran : $visible');
}

Future<void> waitFor(WidgetTester tester, bool Function() condition, String what) async {
  final end = DateTime.now().add(const Duration(seconds: 30));
  while (DateTime.now().isBefore(end)) {
    await tester.pump(const Duration(milliseconds: 200));
    if (condition()) return;
  }
  throw TestFailure('Condition non atteinte : $what');
}

Future<void> tapWhenVisible(WidgetTester tester, Finder finder) async {
  await reveal(tester, finder);
  await tester.ensureVisible(finder.first);
  await tester.pump(const Duration(milliseconds: 300));
  await tester.tap(finder.first);
  await tester.pump(const Duration(milliseconds: 300));
}

Future<void> reveal(WidgetTester tester, Finder finder) async {
  final end = DateTime.now().add(const Duration(seconds: 30));
  while (finder.evaluate().isEmpty && DateTime.now().isBefore(end)) {
    await tester.pump(const Duration(milliseconds: 200));
    final scrollable = find.byType(Scrollable).hitTestable();
    if (finder.evaluate().isEmpty && scrollable.evaluate().isNotEmpty) {
      await tester.drag(scrollable.first, const Offset(0, -300), warnIfMissed: false);
    }
  }
  await pumpUntil(tester, finder);
}

Future<void> typeInto(WidgetTester tester, String key, String text) async {
  final field = find.descendant(of: find.byKey(ValueKey(key)), matching: find.byType(TextField));
  await pumpUntil(tester, field);
  await tester.enterText(field, text);
  await tester.pump();
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<ProviderContainer> launch(WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: HeryciaApp()));
    final container = ProviderScope.containerOf(tester.element(find.byType(HeryciaApp)));
    await pumpUntil(tester, find.byWidgetPredicate(
      (w) => w.key is ValueKey && '${(w.key! as ValueKey).value}'.startsWith('inspiration-'),
    ));
    return container;
  }

  Future<void> modeA(WidgetTester tester) async {
    await tapWhenVisible(tester, find.byKey(const ValueKey('mode-from-item')));
    await tapWhenVisible(tester, find.byKey(const ValueKey('category-hauts')));
    await tapWhenVisible(tester, find.byKey(const ValueKey('type-chemise')));
    await tapWhenVisible(tester, find.byKey(const ValueKey('swatch-blanc')));
    await tapWhenVisible(tester, find.byKey(const ValueKey('from-item-show')));
    await pumpUntil(tester, find.byKey(const ValueKey('result-0')));
    expect(find.text('Votre pièce : Chemise blanc'), findsOneWidget);
  }

  Future<void> evaluate(WidgetTester tester, ProviderContainer container) async {
    final lookup = await container.read(catalogLookupProvider.future);
    container.read(compositionProvider.notifier).restore(OutfitComposition.empty
        .withPiece(CompositionRole.top, ComposedPiece(type: lookup.typeBySlug('chemise')!, color: lookup.colorBySlug('blanc')!))
        .withPiece(
          CompositionRole.bottom,
          ComposedPiece(type: lookup.typeBySlug('pantalon')!, color: lookup.colorBySlug('gris-anthracite')!),
        ));
    container.read(routerProvider).go(AppRoutes.evaluation);
    await pumpUntil(tester, find.byType(ScoreRing));
    expect(find.text('Il manque encore des pièces pour compléter la tenue.'), findsOneWidget);
    await reveal(tester, find.byKey(const ValueKey('suggestion-0')));
  }

  testWidgets('visiteur contre ${Env.apiBaseUrl} : catalogue, looks, mode A, évaluation, favori local', (tester) async {
    final container = await launch(tester);
    await modeA(tester);
    final heart = find.descendant(
      of: find.byKey(const ValueKey('result-0')),
      matching: find.byWidgetPredicate((w) => w is InkWell && '${w.key}'.contains('favorite-')),
    );
    await tapWhenVisible(tester, heart);
    await waitFor(tester, () => container.read(favoritesProvider).value?.visible.length == 1, 'favori local');
    expect(container.read(wardrobeSyncProvider), WardrobeSyncStatus.localOnly);
    await evaluate(tester, container);
    await tapWhenVisible(tester, find.byKey(const ValueKey('evaluation-save')));
    container.read(routerProvider).go(AppRoutes.colorGuide);
    await tapWhenVisible(tester, find.byKey(const ValueKey('family-bleu')));
    await tapWhenVisible(tester, find.byKey(const ValueKey('guide-swatch-bleu-marine')));
    await pumpUntil(tester, find.byKey(const ValueKey('guide-group-harmonious')));
  }, skip: Env.useMockApi);

  testWidgets('compte et synchronisation (faux serveur intégré)', (tester) async {
    final container = await launch(tester);
    await modeA(tester);
    final heart = find.descendant(
      of: find.byKey(const ValueKey('result-0')),
      matching: find.byWidgetPredicate((w) => w is InkWell && '${w.key}'.contains('favorite-')),
    );
    await tapWhenVisible(tester, heart);
    await waitFor(tester, () => container.read(favoritesProvider).value?.visible.isNotEmpty ?? false, 'favori local');

    final email = 'e2e.${DateTime.now().millisecondsSinceEpoch}@example.com';
    const password = 'Tenue-E2e-2026!';
    container.read(routerProvider).go(AppRoutes.register);
    await typeInto(tester, 'register-name', 'Test E2E');
    await typeInto(tester, 'register-email', email);
    await typeInto(tester, 'register-password', password);
    await tapWhenVisible(tester, find.byKey(const ValueKey('register-privacy')));
    await tapWhenVisible(tester, find.byKey(const ValueKey('register-submit')));
    await pumpUntil(tester, find.byKey(const ValueKey('profile-name')));
    await waitFor(tester, () => container.read(wardrobeSyncProvider) == WardrobeSyncStatus.synced, 'synchronisation');
    await waitFor(
      tester,
      () => container.read(favoritesProvider).value!.visible.every((f) => f.syncState == SyncState.synced),
      'favoris synchronisés',
    );

    await evaluate(tester, container);
    await tapWhenVisible(tester, find.byKey(const ValueKey('evaluation-save')));
    await waitFor(tester, () => container.read(wardrobeSyncProvider) == WardrobeSyncStatus.synced, 'composition');

    await waitFor(tester, () => find.byType(SnackBar).evaluate().isEmpty, 'fin du message');
    container.read(routerProvider).go(AppRoutes.profile);
    await tapWhenVisible(tester, find.byKey(const ValueKey('profile-delete')));
    await tapWhenVisible(tester, find.byKey(const ValueKey('delete-confirm-1')));
    await typeInto(tester, 'delete-password', password);
    await tapWhenVisible(tester, find.byKey(const ValueKey('delete-confirm-2')));
    await waitFor(tester, () => container.read(sessionProvider).value == null, 'suppression du compte');
  }, skip: !Env.useMockApi);
}
