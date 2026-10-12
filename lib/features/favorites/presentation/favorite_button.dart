import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../looks/presentation/look_view.dart';
import '../application/favorites_controller.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({super.key, required this.look, this.onSurface = false});

  final LookView look;
  final bool onSurface;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final colors = context.colors;
    final isFavorite = ref.watch(favoritesProvider).value?.contains(look) ?? false;
    return Semantics(
      button: true,
      toggled: isFavorite,
      label: isFavorite ? l10n.favoriteRemove : l10n.favoriteAdd,
      excludeSemantics: true,
      child: Material(
        color: onSurface ? Colors.transparent : colors.surface.withValues(alpha: 0.88),
        shape: const CircleBorder(),
        child: InkWell(
          key: ValueKey('favorite-${lookSignature(look)}'),
          customBorder: const CircleBorder(),
          onTap: () => ref.read(favoritesProvider.notifier).toggle(look),
          child: SizedBox.square(
            dimension: AppSizes.minTapTarget,
            child: AnimatedSwitcher(
              duration: AppMotion.fast.resolve(context),
              child: Icon(
                isFavorite ? AppIcons.favoriteFilled : AppIcons.favorite,
                key: ValueKey(isFavorite),
                color: isFavorite ? colors.favorite : colors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
