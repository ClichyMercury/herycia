import 'package:flutter/material.dart';

import '../theme/theme_context.dart';
import '../tokens/layout.dart';

enum AppBadgeVariant { neutral, brand, sun, fresh }

class AppBadge extends StatelessWidget {
  const AppBadge({super.key, required this.label, this.variant = AppBadgeVariant.neutral});

  static const height = 24.0;

  final String label;
  final AppBadgeVariant variant;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final (Color background, Color foreground) = switch (variant) {
      AppBadgeVariant.neutral => (colors.surfaceSunken, colors.textSecondary),
      AppBadgeVariant.brand => (colors.actionPrimarySoft, colors.actionPrimary),
      AppBadgeVariant.sun => (colors.badgeSunBg, colors.textPrimary),
      AppBadgeVariant.fresh => (colors.badgeFreshBg, colors.textPrimary),
    };
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Text(
        label.toUpperCase(),
        style: context.typo.overline.copyWith(color: foreground),
      ),
    );
  }
}
