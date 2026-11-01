import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/app/app.dart';
import 'package:herycia/features/account/application/preferences_controller.dart';
import 'package:herycia/features/account/application/session_controller.dart';
import 'package:herycia/app/router.dart';
import 'package:herycia/core/storage/storage_providers.dart';
import 'package:herycia/features/account/presentation/auth_screens.dart';
import 'package:herycia/mock_backend/mock_backend.dart';
import 'package:herycia/mock_backend/mock_fixtures.dart';

import '../helpers/app_harness.dart';
import '../helpers/mock_api.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockFixtures fixtures;
  setUpAll(() async => fixtures = await MockApiHarness.fixtures());

  Future<void> login(WidgetTester tester, {String email = MockBackend.demoEmail, String password = MockBackend.demoPassword}) async {
    await tester.tap(find.byKey(const ValueKey('profile-sign-in')));
    await tester.pumpAndSettle();
    await tester.enterText(find.descendant(of: find.byKey(const ValueKey('login-email')), matching: find.byType(TextField)), email);
    await tester.enterText(find.descendant(of: find.byKey(const ValueKey('login-password')), matching: find.byType(TextField)), password);
    await tester.tap(find.byKey(const ValueKey('login-submit')));
    await tester.pumpAndSettle();
  }

  testWidgets('connexion : profil, préférences du serveur prioritaires sur les locales', (tester) async {
    final harness = MockApiHarness(fixtures);
    harness.backend.preferences['0197b2c4-7d1e-7a3b-9f10-2c8e5a4d6b11'] = {
      'language': 'fr',
      'style_ids': ['18ca3d5f-d049-51e4-9f81-bf8916bf3732'],
      'occasion_ids': <String>[],
      'updated_at': '2026-10-30T09:00:00Z',
    };
    final container = await pumpFullApp(tester, harness, location: '/profile');
    await login(tester);
    expect(find.byKey(const ValueKey('profile-name')), findsOneWidget);
    expect(find.text('Awa Démo'), findsOneWidget);
    expect(container.read(sessionProvider).value!.email, MockBackend.demoEmail);
    final prefs = await container.read(preferencesProvider.future);
    expect(prefs.styleIds, ['18ca3d5f-d049-51e4-9f81-bf8916bf3732']);
  });

  testWidgets('première connexion : les préférences locales sont envoyées au serveur', (tester) async {
    final harness = MockApiHarness(fixtures);
    final container = await pumpFullApp(tester, harness, location: '/profile/preferences');
    await tester.tap(find.byKey(const ValueKey('pref-style-classique')));
    await tester.pumpAndSettle();
    container.read(routerProvider).go('/profile');
    await tester.pumpAndSettle();
    await login(tester);
    await container.read(preferencesProvider.future);
    await tester.pumpAndSettle();
    final remote = harness.backend.preferences['0197b2c4-7d1e-7a3b-9f10-2c8e5a4d6b11']!;
    expect(remote['style_ids'], ['2f2e1cea-0a8d-5e3d-b21d-2389a145e54a']);
  });

  testWidgets('identifiants refusés : erreur sous le champ e-mail', (tester) async {
    await pumpFullApp(tester, MockApiHarness(fixtures), location: '/profile');
    await login(tester, password: 'mauvais');
    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.text('Identifiants invalides. Vérifiez votre e-mail et votre mot de passe.'), findsOneWidget);
  });

  testWidgets('validation locale avant tout appel réseau', (tester) async {
    final harness = MockApiHarness(fixtures);
    await pumpFullApp(tester, harness, location: '/profile/login');
    await tester.tap(find.byKey(const ValueKey('login-submit')));
    await tester.pumpAndSettle();
    expect(find.text('Ce champ est obligatoire.'), findsNWidgets(2));
    expect(harness.backend.callCounts['POST /auth/login'], isNull);
  });

  testWidgets('inscription : consentement gardé en local, styles synchronisés, thème local', (tester) async {
    final harness = MockApiHarness(fixtures);
    final container = await pumpFullApp(tester, harness, location: '/profile/register');
    Future<void> type(String key, String value) =>
        tester.enterText(find.descendant(of: find.byKey(ValueKey(key)), matching: find.byType(TextField)), value);
    await type('register-name', 'Kofi');
    await type('register-email', 'kofi@example.com');
    await type('register-password', 'unmotdepasse');
    await tester.tap(find.byKey(const ValueKey('register-privacy')));
    await tester.ensureVisible(find.byKey(const ValueKey('register-submit')));
    await tester.tap(find.byKey(const ValueKey('register-submit')));
    await tester.pumpAndSettle();
    expect(find.text('Kofi'), findsOneWidget);

    expect(await container.read(appDatabaseProvider).readValue(privacyConsentKey), isNotNull);
    final userId = container.read(sessionProvider).value!.id;

    await tester.tap(find.byKey(const ValueKey('tile-preferences')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('pref-style-casual')));
    await tester.pumpAndSettle();
    expect(harness.backend.preferences[userId]!['style_ids'], ['53b091ff-b61a-59c2-a221-10925d18edb9']);

    await scrollTo(tester, find.byKey(const ValueKey('pref-theme-dark')));
    await tester.tap(find.byKey(const ValueKey('pref-theme-dark')));
    await tester.pumpAndSettle();
    expect(container.read(themeModeProvider), ThemeMode.dark);
    expect(harness.backend.preferences[userId]!.containsKey('theme'), isFalse);
    expect(harness.backend.callCounts['PUT /me/preferences'], 2);
  });

  testWidgets('préférences sans compte : gardées sur l’appareil', (tester) async {
    final harness = MockApiHarness(fixtures);
    final container = await pumpFullApp(tester, harness, location: '/profile/preferences');
    await tester.tap(find.byKey(const ValueKey('pref-style-classique')));
    await tester.pumpAndSettle();
    expect(container.read(preferencesProvider).value!.styleIds, ['2f2e1cea-0a8d-5e3d-b21d-2389a145e54a']);
    expect(harness.backend.callCounts['PUT /me/preferences'], isNull);
  });

  testWidgets('suppression de compte : confirmation puis mot de passe obligatoire', (tester) async {
    final harness = MockApiHarness(fixtures);
    final container = await pumpFullApp(tester, harness, location: '/profile');
    await login(tester);
    await scrollTo(tester, find.byKey(const ValueKey('profile-delete')));
    await tester.tap(find.byKey(const ValueKey('profile-delete')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('delete-confirm-1')));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.descendant(of: find.byKey(const ValueKey('delete-password')), matching: find.byType(TextField)),
      MockBackend.demoPassword,
    );
    await tester.tap(find.byKey(const ValueKey('delete-confirm-2')));
    await tester.pumpAndSettle();
    expect(container.read(sessionProvider).value, isNull);
    expect(harness.backend.users.values.where((u) => u.email == MockBackend.demoEmail), isEmpty);
    expect(find.text('Votre compte a été supprimé.'), findsOneWidget);
  });

  testWidgets('mot de passe oublié → code à 6 chiffres → réinitialisation → connexion', (tester) async {
    await pumpFullApp(tester, MockApiHarness(fixtures), location: '/profile/forgot-password');
    await tester.enterText(find.descendant(of: find.byKey(const ValueKey('forgot-email')), matching: find.byType(TextField)), MockBackend.demoEmail);
    await tester.tap(find.byKey(const ValueKey('forgot-submit')));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('forgot-sent')), findsOneWidget);
    expect(find.text('Renvoyer un code dans 60 s'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('forgot-have-code')));
    await tester.pumpAndSettle();
    await tester.enterText(find.descendant(of: find.byKey(const ValueKey('reset-code')), matching: find.byType(TextField)), 'abc');
    await tester.enterText(find.descendant(of: find.byKey(const ValueKey('reset-password')), matching: find.byType(TextField)), 'nouveaumdp');
    await tester.tap(find.byKey(const ValueKey('reset-submit')));
    await tester.pumpAndSettle();
    expect(find.text('Entrez le code à 6 chiffres reçu par e-mail.'), findsOneWidget);
    await tester.enterText(find.descendant(of: find.byKey(const ValueKey('reset-code')), matching: find.byType(TextField)), MockBackend.mockOtp);
    await tester.enterText(find.descendant(of: find.byKey(const ValueKey('reset-password')), matching: find.byType(TextField)), 'nouveaumdp');
    await tester.tap(find.byKey(const ValueKey('reset-submit')));
    await tester.pumpAndSettle();
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
