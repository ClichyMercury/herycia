import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/app/app.dart';
import 'package:herycia/app/router.dart';

import 'mock_api.dart';
import 'pump_app.dart';

Future<ProviderContainer> pumpFullApp(
  WidgetTester tester,
  MockApiHarness harness, {
  String? location,
  bool devTools = true,
  String initialLocation = AppRoutes.compose,
}) async {
  await tester.binding.setSurfaceSize(const Size(430, 932));
  addTearDown(() => tester.binding.setSurfaceSize(null));
  await tester.pumpWidget(ProviderScope(
    retry: (_, _) => null,
    overrides: [
      ...baseOverrides(tokens: harness.tokens),
      ...harness.overrides,
      showDevToolsProvider.overrideWithValue(devTools),
      initialLocationProvider.overrideWithValue(initialLocation),
    ],
    child: const HeryciaApp(),
  ));
  await tester.pumpAndSettle();
  final container = ProviderScope.containerOf(tester.element(find.byType(HeryciaApp)));
  if (location != null) {
    container.read(routerProvider).go(location);
    await tester.pumpAndSettle();
  }
  return container;
}

Future<void> scrollTo(WidgetTester tester, Finder finder, {double delta = 250}) async {
  await tester.scrollUntilVisible(finder, delta, scrollable: find.byType(Scrollable).first);
  await tester.pumpAndSettle();
}

Future<void> pumpFullAppWithoutSettling(WidgetTester tester, MockApiHarness harness) async {
  await tester.pumpWidget(ProviderScope(
    retry: (_, _) => null,
    overrides: [
      ...baseOverrides(tokens: harness.tokens),
      ...harness.overrides,
      initialLocationProvider.overrideWithValue(AppRoutes.splash),
    ],
    child: const HeryciaApp(),
  ));
  await tester.pump();
}
