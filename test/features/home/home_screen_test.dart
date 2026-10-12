import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/design_system/design_system.dart';
import 'package:herycia/features/catalog/application/catalog_providers.dart';
import 'package:herycia/features/home/presentation/home_screen.dart';

import 'package:herycia/mock_backend/mock_fixtures.dart';

import '../../helpers/mock_api.dart';
import '../../helpers/pump_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockFixtures fixtures;
  setUpAll(() async => fixtures = await MockApiHarness.fixtures());

  testWidgets('affiche les deux modes et la palette du catalogue', (tester) async {
    await tester.binding.setSurfaceSize(const Size(430, 1800));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final repo = FakeCatalogRepository();
    await tester.pumpDs(
      const HomeScreen(),
      overrides: [...MockApiHarness(fixtures).overrides, catalogRepositoryProvider.overrideWithValue(repo)],
    );

    expect(find.text('Partir d\'une pièce'), findsOneWidget);
    expect(find.text('Composer une tenue'), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('palette-skeleton')), findsNothing);
    expect(find.text('Bleu marine'), findsOneWidget);
    expect(find.text('Camel'), findsOneWidget);
  });

  testWidgets('squelette pendant le chargement', (tester) async {
    await tester.binding.setSurfaceSize(const Size(430, 1800));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpDs(
      const HomeScreen(),
      overrides: [...MockApiHarness(fixtures).overrides, catalogRepositoryProvider.overrideWithValue(FakeCatalogRepository())],
    );
    expect(find.byKey(const ValueKey('palette-skeleton')), findsOneWidget);
    await tester.pumpAndSettle();
  });

  testWidgets('erreur puis « Réessayer » recharge les couleurs', (tester) async {
    await tester.binding.setSurfaceSize(const Size(430, 1800));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final repo = FakeCatalogRepository(failColors: true);
    await tester.pumpDs(
      const HomeScreen(),
      overrides: [...MockApiHarness(fixtures).overrides, catalogRepositoryProvider.overrideWithValue(repo)],
    );
    await tester.pumpAndSettle();

    expect(find.byType(ErrorState), findsWidgets);
    expect(repo.colorCalls, 1);

    repo.failColors = false;
    await tester.ensureVisible(find.text('Réessayer').last);
    await tester.tap(find.text('Réessayer').last);
    await tester.pumpAndSettle();

    expect(repo.colorCalls, 2);
    expect(find.byType(ErrorState), findsNothing);
    expect(find.text('Bleu marine'), findsOneWidget);
  });
}
