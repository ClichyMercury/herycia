import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../theme/theme_context.dart';
import '../tokens/app_icons.dart';
import '../tokens/contrast.dart';
import '../tokens/layout.dart';
import '../tokens/motion.dart';

enum SwatchSize {
  sm(24),
  md(40),
  lg(56),
  xl(72);

  const SwatchSize(this.diameter);

  final double diameter;

  bool get showsLabelByDefault => this != SwatchSize.sm;
}

class AppColorSwatch extends StatelessWidget {
  const AppColorSwatch({
    super.key,
    required this.color,
    required this.name,
    this.size = SwatchSize.md,
    this.selected = false,
    this.onTap,
    this.showLabel,
  });

  static const _ringWidth = 2.0;
  static const _ringGap = 3.0;

  static double extentFor(BuildContext context, SwatchSize size, {bool withLabel = true}) {
    final outer = size.diameter + 2 * (_ringWidth + _ringGap);
    if (!withLabel) return outer;
    final caption = context.typo.caption;
    final lineHeight = MediaQuery.textScalerOf(context).scale(caption.fontSize!) * caption.height!;
    return outer + AppSpacing.s1 + 2 * lineHeight + 2;
  }

  final Color color;
  final String name;
  final SwatchSize size;
  final bool selected;
  final VoidCallback? onTap;
  final bool? showLabel;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final diameter = size.diameter;
    final outer = diameter + 2 * (_ringWidth + _ringGap);
    final labelVisible = showLabel ?? size.showsLabelByDefault;

    final dot = Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: colors.swatchBorder),
        boxShadow: isVeryLight(color)
            ? const [
                BoxShadow(
                  color: Color(0x140E0E12),
                  blurRadius: 3,
                  spreadRadius: -1,
                  blurStyle: BlurStyle.inner,
                ),
              ]
            : null,
      ),
      child: selected && size != SwatchSize.sm
          ? Icon(AppIcons.check, size: diameter * 0.45, color: readableInkOn(color))
          : null,
    );

    final ring = AnimatedContainer(
      duration: AppMotion.fast.resolve(context),
      curve: AppMotion.fast.curve,
      width: outer,
      height: outer,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? colors.actionPrimary : Colors.transparent,
          width: _ringWidth,
        ),
      ),
      child: dot,
    );

    final state = selected ? context.l10n.swatchSelected : context.l10n.swatchNotSelected;

    Widget body = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ring,
        if (labelVisible) ...[
          const SizedBox(height: AppSpacing.s1),
          SizedBox(
            width: outer + AppSpacing.s4,
            child: Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.typo.caption.copyWith(
                color: selected ? colors.textPrimary : colors.textSecondary,
                fontWeight: selected ? FontWeight.w500 : null,
              ),
            ),
          ),
        ],
      ],
    );

    if (onTap != null) {
      body = GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: AppSizes.minTapTarget,
            minHeight: AppSizes.minTapTarget,
          ),
          child: Center(widthFactor: 1, heightFactor: 1, child: body),
        ),
      );
    }

    return Semantics(
      label: context.l10n.swatchSemantics(name, state),
      button: onTap != null,
      selected: selected,
      excludeSemantics: true,
      onTap: onTap,
      child: body,
    );
  }
}

class SwatchRow extends StatelessWidget {
  const SwatchRow({super.key, required this.swatches, this.max = 5});

  final List<({Color color, String name})> swatches;
  final int max;

  @override
  Widget build(BuildContext context) {
    final visible = swatches.take(max).toList();
    final hidden = swatches.length - visible.length;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final s in visible)
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.s1),
            child: AppColorSwatch(color: s.color, name: s.name, size: SwatchSize.sm),
          ),
        if (hidden > 0)
          Text(
            context.l10n.swatchMore(hidden),
            style: context.typo.caption.copyWith(color: context.colors.textSecondary),
          ),
      ],
    );
  }
}
