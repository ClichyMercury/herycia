import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import '../../l10n/l10n.dart';
import '../theme/theme_context.dart';
import '../tokens/app_icons.dart';
import '../tokens/layout.dart';
import '../tokens/motion.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
    this.onDeleted,
  });

  static const height = 36.0;

  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final VoidCallback? onDeleted;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final foreground = selected ? colors.actionPrimary : colors.textSecondary;

    final chip = AnimatedContainer(
      duration: AppMotion.fast.resolve(context),
      curve: AppMotion.fast.curve,
      height: height,
      padding: EdgeInsets.only(
        left: AppSpacing.s4,
        right: onDeleted == null ? AppSpacing.s4 : AppSpacing.s2,
      ),
      decoration: BoxDecoration(
        color: selected ? colors.actionPrimarySoft : colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: selected ? colors.actionPrimary : colors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            maxLines: 1,
            softWrap: false,
            style: context.typo.label.copyWith(
              color: foreground,
              fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
          if (onDeleted != null)
            GestureDetector(
              key: const ValueKey('chip-delete'),
              behavior: HitTestBehavior.opaque,
              onTap: onDeleted,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.s1,
                  vertical: AppSpacing.s2,
                ),
                child: Icon(AppIcons.close, size: 16, color: foreground),
              ),
            ),
        ],
      ),
    );

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      excludeSemantics: true,
      onTap: onTap,
      customSemanticsActions: onDeleted == null
          ? null
          : {CustomSemanticsAction(label: context.l10n.commonRemove): onDeleted!},
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: AppSizes.minTapTarget),
          child: Center(widthFactor: 1, heightFactor: 1, child: chip),
        ),
      ),
    );
  }
}

class ChipRow extends StatelessWidget {
  const ChipRow({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: AppSpacing.screenPadding,
      child: Row(
        children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0) const SizedBox(width: AppSpacing.s2),
            children[i],
          ],
        ],
      ),
    );
  }
}
