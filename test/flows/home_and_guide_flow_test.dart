import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/features/color_guide/presentation/color_guide_screens.dart';
import 'package:herycia/features/compose_from_item/application/from_item_controller.dart';
import 'package:herycia/features/compose_from_item/presentation/from_item_screen.dart';
import 'package:herycia/features/looks/presentation/look_detail_screen.dart';
import 'package:herycia/mock_backend/mock_fixtures.dart';

import '../helpers/app_harness.dart';
import '../helpers/mock_api.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockFixtures fixtures;
  setUpAll(() async => fixtures = await MockApiHarness.fixtures());

  testWidgets('accueil : looks d’inspiration publiés, ouverture du détail', (tester) async {
    await pumpFullApp(tester, MockApiHarness(fixtures));
    expect(find.text('Looks d\'inspiration'), findsOneWidget);
    final first = find.byWidgetPredicate((w) => w.key is ValueKey && '${(w.key! as ValueKey).value}'.startsWith('inspiration-'));
    expect(first, findsWidgets);
    await tester.tap(first.first);
    await tester.pumpAndSettle();
    expect(find.byType(LookDetailScreen), findsOneWidget);
    expect(find.byType(LookByIdScreen), findsOneWidget);
  });

  testWidgets('guide : famille → associations → composer avec la couleur', (tester) async {
    final container = await pumpFullApp(tester, MockApiHarness(fixtures));
    await scrollTo(tester, find.text('Guide des couleurs'));
    await tester.tap(find.text('Guide des couleurs'));
    await tester.pumpAndSettle();
    expect(find.byType(ColorGuideScreen), findsOneWidget);

    await scrollTo(tester, find.byKey(const ValueKey('family-blue')));
    await tester.tap(find.byKey(const ValueKey('family-blue')));
    await tester.pumpAndSettle();
    expect(find.byType(ColorFamilyScreen), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('guide-swatch-royal-blue')));
    await tester.pumpAndSettle();
    expect(find.text('Associations conseillées pour : bleu roi'), findsOneWidget);

    await scrollTo(tester, find.byKey(const ValueKey('guide-compose')));
    await tester.tap(find.byKey(const ValueKey('guide-compose')));
    await tester.pumpAndSettle();
    expect(find.byType(FromItemScreen), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('category-top')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('type-shirt')));
    await tester.pumpAndSettle();
    final draft = container.read(fromItemDraftProvider);
    expect(draft.color!.slug, 'royal-blue');
    expect(draft.step, FromItemStep.filters);
  });

  testWidgets('principes d’harmonie', (tester) async {
    await pumpFullApp(tester, MockApiHarness(fixtures), location: '/compose/color-guide/principles');
    expect(find.text('Partir des neutres'), findsOneWidget);
  });
}
