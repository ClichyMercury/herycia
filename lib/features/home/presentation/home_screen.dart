import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../catalog/application/catalog_providers.dart';
import '../../catalog/domain/catalog_models.dart';
import '../../catalog/application/catalog_lookup.dart';
import '../../compose_from_item/application/from_item_controller.dart';
import '../../favorites/application/favorites_controller.dart';
import '../../favorites/presentation/favorite_look.dart';
import '../../looks/application/looks_providers.dart';
import '../../looks/domain/look_models.dart';
import '../../looks/presentation/look_view.dart';
import '../../looks/presentation/look_visual.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final colors = context.colors;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              context.brightness == Brightness.dark ? 'assets/branding/mark_dark.png' : 'assets/branding/mark.png',
              key: const ValueKey('home-logo'),
              height: 28,
              excludeFromSemantics: true,
            ),
            const SizedBox(width: AppSpacing.s2),
            Flexible(child: Text(l10n.homeTitle, overflow: TextOverflow.ellipsis)),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: AppSpacing.s6),
        children: [
          Padding(
            padding: AppSpacing.screenPadding,
            child: Text(
              l10n.homeGreeting,
              style: context.typo.body.copyWith(color: colors.textSecondary),
            ),
          ),
          const SizedBox(height: AppSpacing.s6),
          Padding(
            padding: AppSpacing.screenPadding,
            child: Column(
              children: [
                ModeCard(
                  key: const ValueKey('mode-from-item'),
                  icon: AppIcons.fromItem,
                  title: l10n.homeFromItemTitle,
                  subtitle: l10n.homeFromItemSubtitle,
                  onTap: () {
                    ref.read(fromItemDraftProvider.notifier).reset();
                    context.go(AppRoutes.fromItem);
                  },
                ),
                const SizedBox(height: AppSpacing.betweenCards),
                ModeCard(
                  key: const ValueKey('mode-full-outfit'),
                  icon: AppIcons.fullOutfit,
                  title: l10n.homeFullOutfitTitle,
                  subtitle: l10n.homeFullOutfitSubtitle,
                  onTap: () => context.go(AppRoutes.composeOutfit),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.betweenSections),
          const InspirationLooks(),
          const RecentFavorites(),
          Padding(
            padding: AppSpacing.screenPadding,
            child: Text(
              l10n.homePaletteTitle,
              style: context.typo.title3.copyWith(color: colors.textPrimary),
            ),
          ),
          const SizedBox(height: AppSpacing.titleToContent),
          const CatalogPalette(),
          const SizedBox(height: AppSpacing.betweenSections),
          Padding(
            padding: AppSpacing.screenPadding,
            child: ModeCard(
              icon: AppIcons.colorGuide,
              title: l10n.homeColorGuide,
              subtitle: l10n.homeColorGuideSubtitle,
              onTap: () => context.go(AppRoutes.colorGuide),
              compact: true,
            ),
          ),
        ],
      ),
    );
  }
}

class ModeCard extends StatelessWidget {
  const ModeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.compact = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Semantics(
      button: true,
      label: '$title. $subtitle',
      excludeSemantics: true,
      onTap: onTap,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(compact ? AppSpacing.cardPadding : AppSpacing.s5),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: colors.border),
            boxShadow: AppElevation.of(context.brightness, AppElevation.level1),
          ),
          child: Row(
            children: [
              Container(
                width: AppSizes.minTapTarget,
                height: AppSizes.minTapTarget,
                decoration: BoxDecoration(
                  color: colors.actionPrimarySoft,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Icon(icon, color: colors.actionPrimary),
              ),
              const SizedBox(width: AppSpacing.s4),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: (compact ? context.typo.bodyStrong : context.typo.title3)
                          .copyWith(color: colors.textPrimary),
                    ),
                    const SizedBox(height: AppSpacing.s1),
                    Text(
                      subtitle,
                      style: context.typo.caption.copyWith(color: colors.textSecondary),
                    ),
                  ],
                ),
              ),
              Icon(AppIcons.chevronRight, color: colors.textTertiary),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogPalette extends ConsumerWidget {
  const CatalogPalette({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsProvider);
    return switch (colors) {
      AsyncValue(:final value?, hasValue: true) => _PaletteRow(colors: value),
      AsyncValue(error: _?) => ErrorState(onRetry: () => ref.invalidate(colorsProvider)),
      _ => const _PaletteSkeleton(),
    };
  }
}

class _PaletteRow extends StatelessWidget {
  const _PaletteRow({required this.colors});

  final List<CatalogColor> colors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppColorSwatch.extentFor(context, SwatchSize.md),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: AppSpacing.screenPadding,
        itemCount: colors.length,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.gridGutter),
        itemBuilder: (context, index) {
          final color = colors[index];
          return AppColorSwatch(color: color.color, name: color.name);
        },
      ),
    );
  }
}

class _PaletteSkeleton extends StatelessWidget {
  const _PaletteSkeleton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const ValueKey('palette-skeleton'),
      height: AppColorSwatch.extentFor(context, SwatchSize.md),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        padding: AppSpacing.screenPadding,
        itemCount: 6,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.gridGutter),
        itemBuilder: (_, _) => Column(
          children: [
            Skeleton.circle(size: SwatchSize.md.diameter + 10),
            const SizedBox(height: AppSpacing.s2),
            const Skeleton(width: 44, height: 12, radius: AppRadius.sm),
          ],
        ),
      ),
    );
  }
}

const inspirationQuery = LookQuery(perPage: 6);

class InspirationLooks extends ConsumerWidget {
  const InspirationLooks({super.key});

  static const _cardWidth = 156.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final looks = ref.watch(looksProvider(inspirationQuery));
    final lookupAsync = ref.watch(catalogLookupProvider);
    final lookup = lookupAsync.value;
    final colors = context.colors;
    final title = Padding(
      padding: AppSpacing.screenPadding,
      child: Text(context.l10n.homeInspiration, style: context.typo.title3.copyWith(color: colors.textPrimary)),
    );
    final Widget content = switch (looks) {
      AsyncValue(value: final page?, hasValue: true) when lookup != null => SizedBox(
          height: _cardWidth + MediaQuery.textScalerOf(context).scale(15) * 1.4 + AppSpacing.s4,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: AppSpacing.screenPadding,
            itemCount: page.data.length,
            separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.gridGutter),
            itemBuilder: (context, i) {
              final look = LookView.fromLook(page.data[i], lookup);
              return SizedBox(
                width: _cardWidth,
                child: LookCard(
                  key: ValueKey('inspiration-${look.outfitId}'),
                  variant: LookCardVariant.grid,
                  visual: LookVisual(look: look),
                  title: look.title,
                  semanticsLabel: look.semantics,
                  onTap: () => context.push(AppRoutes.lookById(look.outfitId!)),
                ),
              );
            },
          ),
        ),
      _ when looks.hasError || lookupAsync.hasError => ErrorState(
          onRetry: () {
            ref.invalidate(looksProvider(inspirationQuery));
            ref.invalidate(catalogLookupProvider);
          },
        ),
      _ => const Padding(
          padding: AppSpacing.screenPadding,
          child: Skeleton(height: _cardWidth),
        ),
    };
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.betweenSections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [title, const SizedBox(height: AppSpacing.titleToContent), content],
      ),
    );
  }
}

class RecentFavorites extends ConsumerWidget {
  const RecentFavorites({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider).value?.visible ?? const [];
    final lookup = ref.watch(catalogLookupProvider).value;
    if (favorites.isEmpty || lookup == null) return const SizedBox.shrink();
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.betweenSections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppSpacing.screenPadding,
            child: Row(
              children: [
                Expanded(
                  child: Text(context.l10n.homeRecentFavorites, style: context.typo.title3.copyWith(color: colors.textPrimary)),
                ),
                AppButton(
                  label: context.l10n.homeSeeAll,
                  variant: AppButtonVariant.ghost,
                  size: AppButtonSize.sm,
                  onPressed: () => context.go(AppRoutes.favorites),
                ),
              ],
            ),
          ),
          for (final f in favorites.take(3))
            Padding(
              padding: const EdgeInsets.fromLTRB(AppSpacing.screenHorizontal, 0, AppSpacing.screenHorizontal, AppSpacing.s3),
              child: Builder(builder: (context) {
                final look = favoriteToLook(f, lookup);
                return LookCard(
                  variant: LookCardVariant.compact,
                  visual: LookVisual(look: look),
                  title: look.title,
                  semanticsLabel: look.semantics,
                  swatches: swatchesOf(look),
                  onTap: () => context.push(AppRoutes.look, extra: look),
                );
              }),
            ),
        ],
      ),
    );
  }
}
