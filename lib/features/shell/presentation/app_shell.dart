import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/api/network_status.dart';
import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../recommendation/application/offline_engine.dart';

class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    ref.watch(offlineEngineProvider);
    final offline = ref.watch(offlineProvider);
    final colors = context.colors;
    return Scaffold(
      body: Column(
        children: [
          if (offline) const SafeArea(bottom: false, child: OfflineBanner()),
          Expanded(
            child: MediaQuery.removePadding(context: context, removeTop: offline, child: navigationShell),
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
