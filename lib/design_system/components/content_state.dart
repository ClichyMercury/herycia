import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../theme/theme_context.dart';
import '../tokens/app_icons.dart';
import '../tokens/layout.dart';
import 'app_button.dart';

class ContentState extends StatelessWidget {
  const ContentState({
    super.key,
    required this.icon,
    required this.title,
    this.message,
    this.actionLabel,
    this.onAction,
    this.actionVariant = AppButtonVariant.primary,
  });

  factory ContentState.empty({
    Key? key,
    required String title,
    String? message,
    String? actionLabel,
    VoidCallback? onAction,
  }) =>
      ContentState(
        key: key,
        icon: AppIcons.empty,
        title: title,
        message: message,
        actionLabel: actionLabel,
        onAction: onAction,
      );

  final IconData icon;
  final String title;
  final String? message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final AppButtonVariant actionVariant;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
        vertical: AppSpacing.s8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: AppSizes.iconInEmptyState, color: colors.textTertiary),
          const SizedBox(height: AppSpacing.s4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.typo.title3.copyWith(color: colors.textPrimary),
          ),
          if (message != null) ...[
            const SizedBox(height: AppSpacing.s2),
            Text(
              message!,
              textAlign: TextAlign.center,
              style: context.typo.body.copyWith(color: colors.textSecondary),
            ),
          ],
          if (actionLabel != null && onAction != null) ...[
            const SizedBox(height: AppSpacing.s6),
            AppButton(
              label: actionLabel!,
              onPressed: onAction,
              variant: actionVariant,
              size: AppButtonSize.md,
            ),
          ],
        ],
      ),
    );
  }
}

class ErrorState extends StatelessWidget {
  const ErrorState({super.key, required this.onRetry, this.title, this.message});

  final VoidCallback onRetry;
  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ContentState(
      icon: AppIcons.error,
      title: title ?? l10n.commonErrorTitle,
      message: message ?? l10n.commonErrorMessage,
      actionLabel: l10n.commonRetry,
      onAction: onRetry,
      actionVariant: AppButtonVariant.secondary,
    );
  }
}
