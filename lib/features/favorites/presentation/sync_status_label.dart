import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../application/favorites_controller.dart';

class SyncStatusLabel extends ConsumerWidget {
  const SyncStatusLabel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final colors = context.colors;
    final status = ref.watch(favoritesProvider).value?.status ?? FavoritesSyncStatus.localOnly;
    final (IconData icon, Color color, String text) = switch (status) {
      FavoritesSyncStatus.synced => (AppIcons.check, colors.success, l10n.syncSynced),
      FavoritesSyncStatus.pending => (AppIcons.retry, colors.textTertiary, l10n.syncPending),
      FavoritesSyncStatus.failed => (AppIcons.warning, colors.warning, l10n.syncFailed),
      FavoritesSyncStatus.localOnly => (AppIcons.info, colors.textTertiary, l10n.syncLocalOnly),
    };
    final label = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: AppSpacing.s1),
        Flexible(
          child: Text(text, key: ValueKey('sync-${status.name}'), style: context.typo.caption.copyWith(color: colors.textSecondary)),
        ),
      ],
    );
    if (status != FavoritesSyncStatus.failed && status != FavoritesSyncStatus.pending) return label;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => ref.read(favoritesProvider.notifier).sync(),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: AppSizes.minTapTarget),
        child: Align(alignment: Alignment.centerLeft, child: label),
      ),
    );
  }
}
