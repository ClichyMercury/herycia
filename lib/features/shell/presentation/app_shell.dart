import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/api/network_status.dart';
import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../account/application/session_controller.dart';
import '../../favorites/application/wardrobe_providers.dart';

class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    ref.watch(wardrobeSyncProvider);
    final offline = ref.watch(offlineProvider);
    final expired = ref.watch(sessionExpiredProvider);
    final colors = context.colors;
    return Scaffold(
      body: Column(
        children: [
          if (offline) const SafeArea(bottom: false, child: OfflineBanner()),
          if (!offline && expired)
            SafeArea(
              bottom: false,
              child: _SessionExpiredBanner(onDismiss: () => ref.read(sessionExpiredProvider.notifier).set(false)),
            ),
          Expanded(
            child: MediaQuery.removePadding(context: context, removeTop: offline || expired, child: navigationShell),
          ),
        ],
      ),
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: colors.border)),
        ),
        child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) => navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          ),
          destinations: [
            NavigationDestination(icon: const Icon(AppIcons.compose), label: l10n.navCompose),
            NavigationDestination(icon: const Icon(AppIcons.favorite), label: l10n.navFavorites),
            NavigationDestination(icon: const Icon(AppIcons.profile), label: l10n.navProfile),
          ],
        ),
      ),
    );
  }
}

class _SessionExpiredBanner extends StatelessWidget {
  const _SessionExpiredBanner({required this.onDismiss});

  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    return Semantics(
      liveRegion: true,
      child: Container(
        key: const ValueKey('session-expired-banner'),
        width: double.infinity,
        color: colors.surfaceSunken,
        padding: const EdgeInsets.fromLTRB(AppSpacing.screenHorizontal, AppSpacing.s2, AppSpacing.s1, AppSpacing.s2),
        child: Row(
          children: [
            Icon(AppIcons.info, size: 18, color: colors.textSecondary),
            const SizedBox(width: AppSpacing.s2),
            Expanded(
              child: Text(l10n.sessionExpiredBanner, style: context.typo.caption.copyWith(color: colors.textPrimary)),
            ),
            TextButton(
              onPressed: () {
                onDismiss();
                context.go('/profile/login');
              },
              child: Text(l10n.authLoginAction),
            ),
          ],
        ),
      ),
    );
  }
}
