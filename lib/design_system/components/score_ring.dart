import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../theme/theme_context.dart';
import '../tokens/app_colors.dart';
import '../tokens/layout.dart';
import '../tokens/motion.dart';
import 'app_button.dart';

enum ScoreTone {
  high,
  medium,
  low;

  static ScoreTone of(int score) {
    if (score > 75) return ScoreTone.high;
    if (score >= 50) return ScoreTone.medium;
    return ScoreTone.low;
  }

  Color color(AppColors colors) => switch (this) {
        ScoreTone.high => colors.scoreHigh,
        ScoreTone.medium => colors.scoreMedium,
        ScoreTone.low => colors.scoreLow,
      };

  String label(AppLocalizations l10n) => switch (this) {
        ScoreTone.high => l10n.scoreLabelHigh,
        ScoreTone.medium => l10n.scoreLabelMedium,
        ScoreTone.low => l10n.scoreLabelLow,
      };
}

class ScoreRing extends StatelessWidget {
  const ScoreRing({
    super.key,
    required this.score,
    this.label,
    this.onExplain,
    this.animate = true,
  });

  static const diameter = 72.0;
  static const strokeWidth = 6.0;

  final int score;
  final String? label;
  final VoidCallback? onExplain;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    final clamped = score.clamp(0, 100);
    final tone = ScoreTone.of(clamped);
    final colors = context.colors;
    final text = label ?? tone.label(context.l10n);
    final duration = animate ? AppMotion.score.resolve(context) : Duration.zero;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Semantics(
          label: context.l10n.scoreSemantics(clamped, text),
          excludeSemantics: true,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: clamped / 100),
                duration: duration,
                curve: AppMotion.score.curve,
                builder: (context, progress, _) => CustomPaint(
                  size: const Size.square(diameter),
                  painter: _RingPainter(
                    progress: progress,
                    track: colors.surfaceSunken,
                    fill: tone.color(colors),
                  ),
                  child: SizedBox.square(
                    dimension: diameter,
                    child: Center(
                      child: Text(
                        '$clamped',
                        style: context.typo.numeric.copyWith(color: colors.textPrimary),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.s4),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(text, style: context.typo.title3.copyWith(color: colors.textPrimary)),
                    Text(
                      context.l10n.scoreOutOf,
                      style: context.typo.caption.copyWith(color: colors.textSecondary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (onExplain != null)
          AppButton(
            label: context.l10n.scoreHowComputed,
            onPressed: onExplain,
            variant: AppButtonVariant.ghost,
            size: AppButtonSize.sm,
          ),
      ],
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({required this.progress, required this.track, required this.fill});

  final double progress;
  final Color track;
  final Color fill;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final arcRect = rect.deflate(ScoreRing.strokeWidth / 2);
    final base = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = ScoreRing.strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(arcRect, 0, 2 * math.pi, false, base..color = track);
    if (progress > 0) {
      canvas.drawArc(
        arcRect,
        -math.pi / 2,
        2 * math.pi * progress,
        false,
        base..color = fill,
      );
    }
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.progress != progress || old.track != track || old.fill != fill;
}
