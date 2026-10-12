import 'package:flutter/material.dart';

import '../theme/theme_context.dart';
import '../tokens/layout.dart';
import '../tokens/motion.dart';
import 'herycia_loader.dart';

enum AppButtonVariant { primary, secondary, ghost, danger, onAccent }

enum AppButtonSize {
  lg(56),
  md(48),
  sm(40);

  const AppButtonSize(this.height);

  final double height;
}

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.lg,
    this.icon,
    this.isLoading = false,
    this.expand,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final IconData? icon;
  final bool isLoading;
  final bool? expand;

  bool get isEnabled => onPressed != null && !isLoading;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (!widget.isEnabled || _pressed == value) return;
    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typo = context.typo;

    final (Color background, Color foreground, Color? border) = switch (widget.variant) {
      AppButtonVariant.primary => (
          _pressed ? colors.actionPrimaryPressed : colors.actionPrimary,
          colors.textOnBrand,
          null,
        ),
      AppButtonVariant.secondary => (
          _pressed ? colors.surfaceSunken : colors.actionSecondaryBg,
          colors.textPrimary,
          colors.actionSecondaryBorder,
        ),
      AppButtonVariant.ghost => (
          _pressed ? colors.actionPrimarySoft : Colors.transparent,
          colors.actionPrimary,
          null,
        ),
      AppButtonVariant.danger => (
          _pressed ? Color.lerp(colors.danger, Colors.black, 0.12)! : colors.danger,
          colors.textOnBrand,
          null,
        ),
      AppButtonVariant.onAccent => (
          _pressed ? Color.lerp(colors.accent, Colors.black, 0.08)! : colors.accent,
          colors.textOnAccent,
          null,
        ),
    };

    final textStyle = (widget.size == AppButtonSize.sm ? typo.caption : typo.label)
        .copyWith(
          color: foreground,
          fontWeight: FontWeight.w500,
          fontSize: widget.size == AppButtonSize.lg ? 16 : null,
        );

    final expand = widget.expand ?? widget.size == AppButtonSize.lg;

    final content = widget.isLoading
        ? HeryciaLoader(size: LoaderSize.sm, color: foreground)
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: AppSizes.iconInButton, color: foreground),
                const SizedBox(width: AppSpacing.s2),
              ],
              Flexible(
                child: Text(
                  widget.label,
                  style: textStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );

    final visual = AnimatedContainer(
      duration: AppMotion.instant.duration,
      curve: AppMotion.instant.curve,
      height: widget.size.height,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s5),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: border == null ? null : Border.all(color: border),
      ),
      alignment: Alignment.center,
      child: content,
    );

    return Semantics(
      button: true,
      enabled: widget.isEnabled,
      label: widget.label,
      excludeSemantics: true,
      onTap: widget.isEnabled ? widget.onPressed : null,
      child: Opacity(
        opacity: widget.onPressed == null ? 0.4 : 1,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: (_) => _setPressed(true),
          onTapUp: (_) => _setPressed(false),
          onTapCancel: () => _setPressed(false),
          onTap: widget.isEnabled ? widget.onPressed : null,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: AppSizes.minTapTarget),
            child: Align(
              widthFactor: expand ? null : 1,
              heightFactor: 1,
              child: AnimatedScale(
                scale: _pressed ? 0.98 : 1,
                duration: AppMotion.instant.duration,
                curve: AppMotion.instant.curve,
                child: expand
                    ? SizedBox(width: double.infinity, child: visual)
                    : visual,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
