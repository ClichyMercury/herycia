import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/api/network_status.dart';
import '../../../core/presentation/error_text.dart';
import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../favorites/application/favorites_controller.dart';
import '../../favorites/presentation/sync_status_label.dart';
import '../application/session_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key, this.showDevTools = false});

  final bool showDevTools;

  Future<void> _deleteAccount(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    Future<bool> confirm(String title, String body, String key) async =>
        await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(body),
            actions: [
              AppButton(
                label: l10n.commonCancel,
                variant: AppButtonVariant.ghost,
                size: AppButtonSize.md,
                onPressed: () => Navigator.of(context).pop(false),
              ),
              AppButton(
                key: ValueKey(key),
                label: l10n.deleteAction,
                variant: AppButtonVariant.danger,
                size: AppButtonSize.md,
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        ) ??
        false;

    if (!await confirm(l10n.deleteTitle, l10n.deleteBody, 'delete-confirm-1')) return;
    if (!context.mounted) return;
    if (!await confirm(l10n.deleteConfirmTitle, l10n.deleteConfirmBody, 'delete-confirm-2')) return;
    try {
      await ref.read(sessionProvider.notifier).deleteAccount();
      await ref.read(favoritesProvider.notifier).clearLocal();
      if (context.mounted) showAppToast(context, message: l10n.deleteDone);
    } catch (e) {
      if (context.mounted) showAppToast(context, message: errorText(e, l10n));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final colors = context.colors;
    final user = ref.watch(sessionProvider).value;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.profileTitle)),
      body: ListView(
        padding: const EdgeInsets.only(bottom: AppSpacing.s6),
        children: [
          Padding(
            padding: AppSpacing.screenPadding,
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.s5),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: colors.border),
              ),
              child: user == null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l10n.profileSignInPitch, style: context.typo.body.copyWith(color: colors.textPrimary)),
                        const SizedBox(height: AppSpacing.s4),
                        AppButton(
                          key: const ValueKey('profile-sign-in'),
                          label: l10n.profileSignIn,
                          onPressed: () => context.go(AppRoutes.login),
                          size: AppButtonSize.md,
                          expand: true,
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.name, key: const ValueKey('profile-name'), style: context.typo.title2.copyWith(color: colors.textPrimary)),
                        if (user.email != null)
                          Text(l10n.profileSignedInAs(user.email!), style: context.typo.caption.copyWith(color: colors.textSecondary)),
                        const SizedBox(height: AppSpacing.s3),
                        const SyncStatusLabel(),
                      ],
                    ),
            ),
          ),
          const SizedBox(height: AppSpacing.betweenSections),
          _SettingsTile(key: const ValueKey('tile-preferences'), label: l10n.profilePreferences, onTap: () => context.go(AppRoutes.preferences)),
          if (user != null)
            _SettingsTile(key: const ValueKey('tile-saved'), label: l10n.profileSavedOutfits, onTap: () => context.go(AppRoutes.savedOutfits)),
          _SettingsTile(label: l10n.profilePrivacy, onTap: () => context.go(AppRoutes.privacy)),
          _SettingsTile(label: l10n.profileAbout, onTap: () => context.go(AppRoutes.about)),
          if (showDevTools) ...[
            _SettingsTile(
              key: const ValueKey('design-system-tile'),
              label: l10n.profileDesignSystem,
              icon: AppIcons.gallery,
              onTap: () => context.go(AppRoutes.designSystem),
            ),
            SwitchListTile(
              key: const ValueKey('simulate-offline'),
              contentPadding: AppSpacing.screenPadding,
              title: Text(l10n.devSimulateOffline, style: context.typo.body.copyWith(color: colors.textPrimary)),
              value: ref.watch(offlineProvider),
              onChanged: ref.read(offlineProvider.notifier).set,
            ),
          ],
          if (user != null) ...[
            const SizedBox(height: AppSpacing.betweenSections),
            Padding(
              padding: AppSpacing.screenPadding,
              child: Column(
                children: [
                  AppButton(
                    key: const ValueKey('profile-logout'),
                    label: l10n.profileLogout,
                    variant: AppButtonVariant.secondary,
                    onPressed: () async {
                      await ref.read(sessionProvider.notifier).logout();
                      if (context.mounted) showAppToast(context, message: l10n.profileLoggedOut);
                    },
                  ),
                  AppButton(
                    key: const ValueKey('profile-delete'),
                    label: l10n.profileDeleteAccount,
                    variant: AppButtonVariant.ghost,
                    onPressed: () => _deleteAccount(context, ref),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({super.key, required this.label, required this.onTap, this.icon});

  final String label;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Semantics(
      button: true,
      label: label,
      excludeSemantics: true,
      onTap: onTap,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minHeight: 56),
          padding: AppSpacing.screenPadding,
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: colors.border))),
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: AppSizes.iconInButton, color: colors.textSecondary),
                const SizedBox(width: AppSpacing.s3),
              ],
              Expanded(child: Text(label, style: context.typo.body.copyWith(color: colors.textPrimary))),
              Icon(AppIcons.chevronRight, color: colors.textTertiary),
            ],
          ),
        ),
      ),
    );
  }
}
