import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../theme/theme_context.dart';
import '../tokens/app_icons.dart';
import '../tokens/layout.dart';
import 'app_color_swatch.dart';

sealed class PieceSlotState {
  const PieceSlotState();
}

class PieceSlotEmpty extends PieceSlotState {
  const PieceSlotEmpty();
}

class PieceSlotFilled extends PieceSlotState {
  const PieceSlotFilled({
    required this.typeName,
    required this.colorName,
    required this.color,
  });

  final String typeName;
  final String colorName;
  final Color color;
}

class PieceSlotReplaced extends PieceSlotState {
  const PieceSlotReplaced({required this.replacedBy});

  final String replacedBy;
}

class PieceSlot extends StatelessWidget {
  const PieceSlot({
    super.key,
    required this.roleLabel,
    required this.state,
    this.isOptional = false,
    this.onTap,
  });

  static const minHeight = 72.0;

  final String roleLabel;
  final PieceSlotState state;
  final bool isOptional;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typo = context.typo;
    final l10n = context.l10n;

    return switch (state) {
      PieceSlotEmpty() => _Frame(
          dashed: true,
          onTap: onTap,
          semanticsLabel: l10n.pieceSlotAdd(roleLabel.toLowerCase()),
          child: Row(
            children: [
              Icon(AppIcons.add, color: colors.actionPrimary),
              const SizedBox(width: AppSpacing.s3),
              Expanded(
                child: Text(roleLabel, style: typo.bodyStrong.copyWith(color: colors.textPrimary)),
              ),
              if (isOptional)
                Text(l10n.commonOptional, style: typo.caption.copyWith(color: colors.textTertiary)),
            ],
          ),
        ),
      PieceSlotFilled(:final typeName, :final colorName, :final color) => _Frame(
          onTap: onTap,
          semanticsLabel: l10n.pieceSlotFilledSemantics(roleLabel, l10n.pieceLabel(typeName, colorName)),
          child: Row(
            children: [
              AppColorSwatch(color: color, name: colorName, showLabel: false),
              const SizedBox(width: AppSpacing.s3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(roleLabel, style: typo.caption.copyWith(color: colors.textTertiary)),
                    Text(
                      '$typeName · $colorName',
                      style: typo.bodyStrong.copyWith(color: colors.textPrimary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(AppIcons.edit, size: AppSizes.iconInButton, color: colors.textSecondary),
            ],
          ),
        ),
      PieceSlotReplaced(:final replacedBy) => _Frame(
          disabled: true,
          semanticsLabel: '$roleLabel, ${l10n.pieceSlotReplacedBy(replacedBy)}',
          child: Row(
            children: [
              Expanded(
                child: Text(roleLabel, style: typo.bodyStrong.copyWith(color: colors.textTertiary)),
              ),
              Text(
                l10n.pieceSlotReplacedBy(replacedBy),
                style: typo.caption.copyWith(color: colors.textTertiary),
              ),
            ],
          ),
        ),
    };
  }
}

class _Frame extends StatelessWidget {
  const _Frame({
    required this.child,
    required this.semanticsLabel,
    this.onTap,
    this.dashed = false,
    this.disabled = false,
  });

  final Widget child;
  final String semanticsLabel;
  final VoidCallback? onTap;
  final bool dashed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = BorderRadius.circular(AppRadius.lg);

    final content = ConstrainedBox(
      constraints: const BoxConstraints(minHeight: PieceSlot.minHeight),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s4, vertical: AppSpacing.s3),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: disabled ? colors.surfaceSunken : (dashed ? null : colors.surface),
          borderRadius: radius,
          border: dashed ? null : Border.all(color: colors.border),
        ),
        child: child,
      ),
    );

    return Semantics(
      button: onTap != null,
      enabled: !disabled,
      label: semanticsLabel,
      excludeSemantics: true,
      onTap: disabled ? null : onTap,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: disabled ? null : onTap,
        child: dashed
            ? CustomPaint(
                painter: _DashedBorderPainter(color: colors.borderStrong, radius: AppRadius.lg),
                child: content,
              )
            : content,
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  _DashedBorderPainter({required this.color, required this.radius});

  final Color color;
  final double radius;

  static const _dash = 6.0;
  static const _gap = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        (Offset.zero & size).deflate(0.75),
        Radius.circular(radius),
      ));
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        canvas.drawPath(metric.extractPath(distance, distance + _dash), paint);
        distance += _dash + _gap;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedBorderPainter old) => old.color != color || old.radius != radius;
}
