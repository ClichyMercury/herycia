import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/app/app.dart';
import 'package:herycia/features/account/application/preferences_controller.dart';
import 'package:herycia/features/account/application/session_controller.dart';
import 'package:herycia/features/account/domain/account_models.dart';
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

  testWidgets('connexion : profil, préférences serveur appliquées (silhouette, thème)', (tester) async {
    final container = await pumpFullApp(tester, MockApiHarness(fixtures), location: '/profile');
    await login(tester);
    expect(find.byKey(const ValueKey('profile-name')), findsOneWidget);
    expect(find.text('Awa'), findsOneWidget);
    expect(container.read(sessionProvider).value!.email, MockBackend.demoEmail);
    final prefs = await container.read(preferencesProvider.future);
    expect(prefs.silhouette, 'hourglass');
    expect(prefs.styleSlugs, contains('smart-casual'));
  });

  testWidgets('identifiants refusés : erreur sous le champ e-mail', (tester) async {
    await pumpFullApp(tester, MockApiHarness(fixtures), location: '/profile');
    await login(tester, password: 'mauvais');
    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.text('Ces identifiants ne correspondent à aucun compte.'), findsOneWidget);
  });

  testWidgets('validation locale avant tout appel réseau', (tester) async {
    final harness = MockApiHarness(fixtures);
    await pumpFullApp(tester, harness, location: '/profile/login');
    await tester.tap(find.byKey(const ValueKey('login-submit')));
    await tester.pumpAndSettle();
    expect(find.text('Ce champ est obligatoire.'), findsNWidgets(2));
    expect(harness.backend.failedLogins, isEmpty);
  });

  testWidgets('inscription puis préférences : le thème sombre s’applique et se synchronise', (tester) async {
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

    await tester.tap(find.byKey(const ValueKey('tile-preferences')));
    await tester.pumpAndSettle();
    await scrollTo(tester, find.byKey(const ValueKey('pref-theme-dark')));
    await tester.tap(find.byKey(const ValueKey('pref-theme-dark')));
    await tester.pumpAndSettle();
    expect(container.read(themeModeProvider), ThemeMode.dark);
    final userId = container.read(sessionProvider).value!.id;
    expect(harness.backend.preferences[userId]!.theme, ThemePreference.dark);
  });

  testWidgets('préférences sans compte : gardées sur l’appareil', (tester) async {
    final harness = MockApiHarness(fixtures);
    final container = await pumpFullApp(tester, harness, location: '/profile/preferences');
    await tester.tap(find.byKey(const ValueKey('pref-style-classic')));
    await tester.pumpAndSettle();
    expect(container.read(preferencesProvider).value!.styleSlugs, ['classic']);
    expect(harness.backend.preferences.values.every((p) => !p.styleSlugs.contains('classic')), isTrue);
  });

  testWidgets('déconnexion puis suppression de compte avec double confirmation', (tester) async {
    final harness = MockApiHarness(fixtures);
    final container = await pumpFullApp(tester, harness, location: '/profile');
    await login(tester);
    await scrollTo(tester, find.byKey(const ValueKey('profile-delete')));
    await tester.tap(find.byKey(const ValueKey('profile-delete')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('delete-confirm-1')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('delete-confirm-2')));
    await tester.pumpAndSettle();
    expect(container.read(sessionProvider).value, isNull);
    expect(harness.backend.users.values.where((u) => u.email == MockBackend.demoEmail), isEmpty);
    expect(find.text('Votre compte a été supprimé.'), findsOneWidget);
  });

  testWidgets('mot de passe oublié → code de démo → réinitialisation → connexion', (tester) async {
    await pumpFullApp(tester, MockApiHarness(fixtures), location: '/profile/forgot-password');
    await tester.enterText(find.descendant(of: find.byKey(const ValueKey('forgot-email')), matching: find.byType(TextField)), MockBackend.demoEmail);
    await tester.tap(find.byKey(const ValueKey('forgot-submit')));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('forgot-sent')), findsOneWidget);
    expect(find.textContaining('RESET_0001'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('forgot-have-code')));
    await tester.pumpAndSettle();
    await tester.enterText(find.descendant(of: find.byKey(const ValueKey('reset-code')), matching: find.byType(TextField)), 'reset_0001');
    await tester.enterText(find.descendant(of: find.byKey(const ValueKey('reset-password')), matching: find.byType(TextField)), 'nouveaumdp');
    await tester.tap(find.byKey(const ValueKey('reset-submit')));
    await tester.pumpAndSettle();
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
