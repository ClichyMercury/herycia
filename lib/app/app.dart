import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../design_system/design_system.dart';
import '../features/account/application/preferences_controller.dart';
import '../features/account/domain/account_models.dart';
import '../l10n/l10n.dart';
import 'router.dart';

final themeModeProvider = Provider<ThemeMode>(
  (ref) => switch (ref.watch(preferencesProvider).value?.theme) {
    ThemePreference.light => ThemeMode.light,
    ThemePreference.dark => ThemeMode.dark,
    _ => ThemeMode.system,
  },
);

class HeryciaApp extends ConsumerWidget {
  const HeryciaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      onGenerateTitle: (context) => context.l10n.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ref.watch(themeModeProvider),
      locale: const Locale('fr'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: ref.watch(routerProvider),
    );
  }
}
