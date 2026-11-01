import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../catalog/application/catalog_providers.dart';
import '../../mannequin/application/silhouette_provider.dart';
import '../../mannequin/domain/body_silhouette.dart';
import '../../mannequin/domain/mannequin_outfit.dart';
import '../../mannequin/presentation/mannequin_view.dart';
import '../application/preferences_controller.dart';
import '../application/session_controller.dart';
import '../domain/account_models.dart';

class PreferencesScreen extends ConsumerWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final colors = context.colors;
    final prefs = ref.watch(preferencesProvider).value ?? const UserPreferences();
    final controller = ref.read(preferencesProvider.notifier);
    final styles = ref.watch(stylesProvider).value ?? const [];
    final occasions = ref.watch(occasionsProvider).value ?? const [];
    final signedIn = ref.watch(isSignedInProvider);

    List<String> toggle(List<String> list, String slug) =>
        list.contains(slug) ? [...list.where((s) => s != slug)] : [...list, slug];

    Widget title(String text) => Padding(
          padding: const EdgeInsets.only(top: AppSpacing.betweenSections, bottom: AppSpacing.titleToContent),
          child: Text(text, style: context.typo.title3.copyWith(color: colors.textPrimary)),
        );

    Widget chips(List<Widget> children) => Wrap(spacing: AppSpacing.s2, runSpacing: AppSpacing.s1, children: children);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.prefsTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(AppSpacing.screenHorizontal, 0, AppSpacing.screenHorizontal, AppSpacing.s8),
        children: [
          if (!signedIn) Text(l10n.prefsLocalHint, style: context.typo.caption.copyWith(color: colors.textSecondary)),
          title(l10n.prefsStyles),
          chips([
            for (final s in styles)
              AppChip(
                key: ValueKey('pref-style-${s.slug}'),
                label: s.name,
                selected: prefs.styleIds.contains(s.id),
                onTap: () => controller.change((p) => p.copyWith(styleIds: toggle(p.styleIds, s.id))),
              ),
          ]),
          title(l10n.prefsOccasions),
          chips([
            for (final o in occasions)
              AppChip(
                key: ValueKey('pref-occasion-${o.slug}'),
                label: o.name,
                selected: prefs.occasionIds.contains(o.id),
                onTap: () => controller.change((p) => p.copyWith(occasionIds: toggle(p.occasionIds, o.id))),
              ),
          ]),
          title(l10n.prefsTheme),
          chips([
            for (final (theme, label) in [
              (ThemePreference.system, l10n.prefsThemeSystem),
              (ThemePreference.light, l10n.prefsThemeLight),
              (ThemePreference.dark, l10n.prefsThemeDark),
            ])
              AppChip(
                key: ValueKey('pref-theme-${theme.name}'),
                label: label,
                selected: prefs.theme == theme,
                onTap: () => controller.change((p) => p.copyWith(theme: theme)),
              ),
          ]),
          title(l10n.prefsSilhouette),
          Row(
            children: [
              SizedBox(
                width: 72,
                height: 150,
                child: MannequinView(
                  outfit: MannequinOutfit.empty,
                  silhouette: ref.watch(silhouetteProvider),
                  semanticsLabel: silhouetteLabel(l10n, ref.watch(silhouetteProvider)),
                ),
              ),
              const SizedBox(width: AppSpacing.s4),
              Expanded(
                child: chips([
                  for (final s in BodySilhouette.values)
                    AppChip(
                      key: ValueKey('pref-silhouette-${s.name}'),
                      label: silhouetteLabel(l10n, s),
                      selected: ref.watch(silhouetteProvider) == s,
                      onTap: () => ref.read(silhouetteProvider.notifier).select(s),
                    ),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
