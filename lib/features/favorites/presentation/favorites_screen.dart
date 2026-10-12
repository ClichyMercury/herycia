import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../catalog/application/catalog_lookup.dart';
import '../../looks/presentation/look_visual.dart';
import '../application/favorites_controller.dart';
import 'favorite_look.dart';
import 'sync_status_label.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  String? _occasion;
  String? _style;

  Future<void> _remove(LocalFavorite favorite) async {
    final l10n = context.l10n;
    final controller = ref.read(favoritesProvider.notifier);
    await controller.remove(favorite.clientUuid);
    if (!mounted) return;
    showAppToast(
      context,
      message: l10n.favoriteRemoved,
      actionLabel: l10n.commonCancel,
      onAction: () => controller.restore(favorite),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final state = ref.watch(favoritesProvider).value;
    final lookup = ref.watch(catalogLookupProvider).value;
    final favorites = state?.visible ?? const <LocalFavorite>[];

    if (state == null || lookup == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.favoritesTitle)),
        body: const Padding(padding: AppSpacing.screenPadding, child: Skeleton(height: 240)),
      );
    }

    if (favorites.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.favoritesTitle)),
        body: Center(
          child: ContentState(
            icon: AppIcons.favorite,
            title: l10n.favoritesEmptyTitle,
            message: l10n.favoritesEmptyMessage,
            actionLabel: l10n.favoritesEmptyAction,
            onAction: () => context.go(AppRoutes.composeOutfit),
          ),
        ),
      );
    }

    final occasionSlugs = {for (final f in favorites) ?f.snapshot.occasionSlug};
    final styleSlugs = {for (final f in favorites) ?f.snapshot.styleSlug};
    final filtered = favorites
        .where((f) => (_occasion == null || f.snapshot.occasionSlug == _occasion) && (_style == null || f.snapshot.styleSlug == _style))
        .toList();

    Widget filterRow(String keyPrefix, Set<String> slugs, String? selected, String Function(String) name, ValueChanged<String?> onChanged) =>
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: AppSpacing.screenPadding,
          child: Row(
            children: [
              AppChip(label: l10n.favoritesAll, selected: selected == null, onTap: () => onChanged(null)),
              for (final slug in slugs) ...[
                const SizedBox(width: AppSpacing.s2),
                AppChip(
                  key: ValueKey('$keyPrefix-$slug'),
                  label: name(slug),
                  selected: selected == slug,
                  onTap: () => onChanged(selected == slug ? null : slug),
                ),
              ],
            ],
          ),
        );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.favoritesTitle)),
      body: RefreshIndicator(
        onRefresh: () => ref.read(favoritesProvider.notifier).sync(),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(padding: AppSpacing.screenPadding, child: SyncStatusLabel()),
            ),
            if (occasionSlugs.isNotEmpty)
              SliverToBoxAdapter(
                child: filterRow('fav-occasion', occasionSlugs, _occasion,
                    (s) => lookup.occasionBySlug(s)?.name ?? s, (v) => setState(() => _occasion = v)),
              ),
            if (styleSlugs.isNotEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.s1),
                  child: filterRow('fav-style', styleSlugs, _style,
                      (s) => lookup.styleBySlug(s)?.name ?? s, (v) => setState(() => _style = v)),
                ),
              ),
            const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s4)),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(AppSpacing.screenHorizontal, 0, AppSpacing.screenHorizontal, AppSpacing.s8),
              sliver: SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppSpacing.gridGutter,
                  mainAxisSpacing: AppSpacing.s4,
                  mainAxisExtent: (MediaQuery.sizeOf(context).width - 2 * AppSpacing.screenHorizontal - AppSpacing.gridGutter) / 2 +
                      MediaQuery.textScalerOf(context).scale(15) * 1.4 +
                      AppSpacing.s3,
                ),
                itemCount: filtered.length,
                itemBuilder: (context, i) {
                  final favorite = filtered[i];
                  final look = favoriteToLook(favorite, lookup);
                  return LookCard(
                    key: ValueKey('favorite-card-${favorite.clientUuid}'),
                    variant: LookCardVariant.grid,
                    visual: LookVisual(look: look),
                    title: look.title,
                    semanticsLabel: look.semantics,
                    action: Material(
                      color: colors.surface.withValues(alpha: 0.88),
                      shape: const CircleBorder(),
                      child: IconButton(
                        key: ValueKey('favorite-remove-${favorite.clientUuid}'),
                        tooltip: l10n.favoriteRemove,
                        onPressed: () => _remove(favorite),
                        icon: Icon(AppIcons.favoriteFilled, color: colors.favorite),
                      ),
                    ),
                    onTap: () => context.push(AppRoutes.look, extra: look),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
