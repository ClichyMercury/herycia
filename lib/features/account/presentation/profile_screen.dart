import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/api/network_status.dart';
import '../../../core/config/app_version.dart';
import '../../../core/presentation/error_text.dart';
import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../favorites/application/wardrobe_providers.dart';
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
    final password = await _askFields(
      context,
      title: l10n.deleteConfirmTitle,
      message: l10n.deletePasswordPrompt,
      confirmKey: 'delete-confirm-2',
      confirmLabel: l10n.deleteAction,
      danger: true,
      fields: [(key: 'delete-password', label: l10n.authPassword, obscure: true)],
    );
    if (password == null) return;
    try {
      await ref.read(sessionProvider.notifier).deleteAccount(password.single);
      await ref.read(wardrobeSyncProvider.notifier).forgetLocalData();
      if (context.mounted) showAppToast(context, message: l10n.deleteDone);
    } catch (e) {
      if (context.mounted) showAppToast(context, message: errorText(e, l10n));
    }
  }

  Future<List<String>?> _askFields(
    BuildContext context, {
    required String title,
    required String confirmKey,
    required String confirmLabel,
    required List<({String key, String label, bool obscure})> fields,
    String? message,
    List<String> initial = const [],
    bool danger = false,
  }) async {
    return showDialog<List<String>>(
      context: context,
      builder: (context) => _FieldsDialog(
        title: title,
        message: message,
        confirmKey: confirmKey,
        confirmLabel: confirmLabel,
        fields: fields,
        initial: initial,
        danger: danger,
      ),
    );
  }

  Future<void> _editName(BuildContext context, WidgetRef ref, String current) async {
    final l10n = context.l10n;
    final values = await _askFields(
      context,
      title: l10n.profileEditName,
      confirmKey: 'edit-name-confirm',
      confirmLabel: l10n.commonSave,
      initial: [current],
      fields: [(key: 'edit-name', label: l10n.authName, obscure: false)],
    );
    if (values == null) return;
    try {
      await ref.read(sessionProvider.notifier).updateName(values.single);
      if (context.mounted) showAppToast(context, message: l10n.profileNameSaved);
    } catch (e) {
      if (context.mounted) showAppToast(context, message: errorText(e, l10n));
    }
  }

  Future<void> _changePassword(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final values = await _askFields(
      context,
      title: l10n.profileChangePassword,
      message: l10n.authPasswordRule,
      confirmKey: 'change-password-confirm',
      confirmLabel: l10n.commonSave,
      fields: [
        (key: 'current-password', label: l10n.profileCurrentPassword, obscure: true),
        (key: 'new-password', label: l10n.authResetNewPassword, obscure: true),
      ],
    );
    if (values == null) return;
    try {
      await ref.read(sessionProvider.notifier).changePassword(current: values[0], password: values[1]);
      if (context.mounted) showAppToast(context, message: l10n.profilePasswordChanged);
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
          _SettingsTile(key: const ValueKey('tile-saved'), label: l10n.profileSavedOutfits, onTap: () => context.go(AppRoutes.savedOutfits)),
          if (user != null) ...[
            _SettingsTile(
              key: const ValueKey('tile-edit-name'),
              label: l10n.profileEditName,
              onTap: () => _editName(context, ref, user.name),
            ),
            _SettingsTile(
              key: const ValueKey('tile-change-password'),
              label: l10n.profileChangePassword,
              onTap: () => _changePassword(context, ref),
            ),
          ],
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
              value: ref.watch(simulatedOfflineProvider),
              onChanged: ref.read(simulatedOfflineProvider.notifier).set,
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
          if (ref.watch(appVersionProvider).value case final version?)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.betweenSections),
              child: Text(
                l10n.profileVersion(version),
                key: const ValueKey('profile-version'),
                textAlign: TextAlign.center,
                style: context.typo.caption.copyWith(color: colors.textTertiary),
              ),
            ),
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

class _FieldsDialog extends StatefulWidget {
  const _FieldsDialog({
    required this.title,
    required this.confirmKey,
    required this.confirmLabel,
    required this.fields,
    required this.initial,
    required this.danger,
    this.message,
  });

  final String title;
  final String? message;
  final String confirmKey;
  final String confirmLabel;
  final List<({String key, String label, bool obscure})> fields;
  final List<String> initial;
  final bool danger;

  @override
  State<_FieldsDialog> createState() => _FieldsDialogState();
}

class _FieldsDialogState extends State<_FieldsDialog> {
  late final _controllers = [
    for (final (i, _) in widget.fields.indexed)
      TextEditingController(text: i < widget.initial.length ? widget.initial[i] : null),
  ];

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.message != null) ...[Text(widget.message!), const SizedBox(height: AppSpacing.s4)],
            for (final (i, f) in widget.fields.indexed) ...[
              AppTextField(key: ValueKey(f.key), label: f.label, controller: _controllers[i], obscure: f.obscure),
              const SizedBox(height: AppSpacing.s3),
            ],
          ],
        ),
      ),
      actions: [
        AppButton(
          label: l10n.commonCancel,
          variant: AppButtonVariant.ghost,
          size: AppButtonSize.md,
          onPressed: () => Navigator.of(context).pop(),
        ),
        AppButton(
          key: ValueKey(widget.confirmKey),
          label: widget.confirmLabel,
          variant: widget.danger ? AppButtonVariant.danger : AppButtonVariant.primary,
          size: AppButtonSize.md,
          onPressed: () {
            final values = [for (final c in _controllers) c.text];
            if (values.any((v) => v.trim().isEmpty)) return;
            Navigator.of(context).pop(values);
          },
        ),
      ],
    );
  }
}
