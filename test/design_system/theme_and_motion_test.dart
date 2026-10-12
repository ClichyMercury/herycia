import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/design_system/design_system.dart';

import '../helpers/pump_app.dart';

void main() {
  test('les thèmes clair et sombre exposent les mêmes extensions', () {
    for (final theme in [AppTheme.light(), AppTheme.dark()]) {
      expect(theme.extension<AppColors>(), isNotNull);
      expect(theme.extension<AppTypography>(), isNotNull);
    }
    expect(AppTheme.light().extension<AppColors>(), AppColors.light);
    expect(AppTheme.dark().extension<AppColors>(), AppColors.dark);
    expect(AppTheme.dark().brightness, Brightness.dark);
  });

  testWidgets('context.colors suit le thème actif', (tester) async {
    late AppColors seen;
    await tester.pumpDs(
      Builder(builder: (context) {
        seen = context.colors;
        return const SizedBox();
      }),
      themeMode: ThemeMode.dark,
    );
    expect(seen, AppColors.dark);
  });

  group('AppMotion', () {
    Future<BuildContext> contextWith(WidgetTester tester, {required bool reduce}) async {
      late BuildContext captured;
      await tester.pumpDs(
        Builder(builder: (context) {
          captured = context;
          return const SizedBox();
        }),
        disableAnimations: reduce,
      );
      return captured;
    }

    testWidgets('durées normales sans préférence système', (tester) async {
      final context = await contextWith(tester, reduce: false);
      expect(AppMotion.base.resolve(context), const Duration(milliseconds: 240));
      expect(AppMotion.score.resolve(context), const Duration(milliseconds: 700));
    });

    testWidgets('« réduire les animations » coupe tout sauf l’état pressé', (tester) async {
      final context = await contextWith(tester, reduce: true);
      expect(AppMotion.base.resolve(context), Duration.zero);
      expect(AppMotion.score.resolve(context), Duration.zero);
      expect(AppMotion.instant.resolve(context), const Duration(milliseconds: 100));
    });

    testWidgets('cascade de 40 ms limitée à 5 cartes', (tester) async {
      final context = await contextWith(tester, reduce: false);
      expect(AppMotion.cascadeDelay(context, 0), Duration.zero);
      expect(AppMotion.cascadeDelay(context, 3), const Duration(milliseconds: 120));
      expect(AppMotion.cascadeDelay(context, 7), Duration.zero);
    });
  });
}
