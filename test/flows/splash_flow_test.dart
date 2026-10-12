import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/app/router.dart';
import 'package:herycia/features/home/presentation/home_screen.dart';
import 'package:herycia/features/splash/presentation/splash_screen.dart';
import 'package:herycia/mock_backend/mock_fixtures.dart';

import '../helpers/app_harness.dart';
import '../helpers/mock_api.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockFixtures fixtures;
  setUpAll(() async => fixtures = await MockApiHarness.fixtures());

  testWidgets('la page de lancement affiche le logo puis bascule vers l’accueil', (tester) async {
    final harness = MockApiHarness(fixtures);
    await tester.binding.setSurfaceSize(const Size(430, 932));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final container = await pumpFullApp(tester, harness, initialLocation: AppRoutes.splash);
    expect(container.read(routerProvider).routeInformationProvider.value.uri.path, AppRoutes.compose);
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byType(SplashScreen), findsNothing);
  });

  testWidgets('le logo reste visible pendant la durée minimale', (tester) async {
    final harness = MockApiHarness(fixtures);
    await tester.binding.setSurfaceSize(const Size(430, 932));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(const SizedBox());
    await pumpFullAppWithoutSettling(tester, harness);
    expect(find.byKey(const ValueKey('splash-logo')), findsOneWidget);
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.byType(SplashScreen), findsOneWidget);
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
