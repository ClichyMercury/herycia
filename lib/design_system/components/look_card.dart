import 'package:flutter/material.dart';

import '../theme/theme_context.dart';
import '../tokens/layout.dart';
import 'app_badge.dart';
import 'app_color_swatch.dart';
import 'score_ring.dart';

enum LookCardVariant { list, grid, compact }

class LookCard extends StatelessWidget {
  const LookCard({
    super.key,
    required this.visual,
    required this.title,
    required this.semanticsLabel,
    this.swatches = const [],
    this.explanation,
    this.score,
    this.badge,
    this.credit,
    this.action,
    this.onTap,
    this.variant = LookCardVariant.list,
  });

  final Widget visual;
  final String title;
  final String semanticsLabel;
  final List<({Color color, String name})> swatches;
  final String? explanation;
  final int? score;
  final String? badge;
  final String? credit;
  final Widget? action;
  final VoidCallback? onTap;
  final LookCardVariant variant;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typo = context.typo;

    Widget framedVisual(double aspect, double radius) => ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: AspectRatio(
            aspectRatio: aspect,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ColoredBox(color: colors.surfaceSunken, child: visual),
                if (action != null) Positioned(top: AppSpacing.s2, right: AppSpacing.s2, child: action!),
                if (badge != null)
                  Positioned(left: AppSpacing.s2, top: AppSpacing.s2, child: AppBadge(label: badge!, variant: AppBadgeVariant.sun)),
              ],
            ),
          ),
        );

    final Widget content = switch (variant) {
      LookCardVariant.compact => Row(
          children: [
            SizedBox(width: 88, child: framedVisual(1, AppRadius.md)),
            const SizedBox(width: AppSpacing.s3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, style: typo.bodyStrong.copyWith(color: colors.textPrimary)),
                  const SizedBox(height: AppSpacing.s1),
                  SwatchRow(swatches: swatches),
                ],
              ),
            ),
          ],
        ),
      LookCardVariant.grid => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            framedVisual(1, AppRadius.lg),
            const SizedBox(height: AppSpacing.s2),
            Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: typo.label.copyWith(color: colors.textPrimary)),
          ],
        ),
      LookCardVariant.list => Container(
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: colors.border),
          ),
          padding: const EdgeInsets.all(AppSpacing.cardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              framedVisual(4 / 5, AppRadius.md),
              if (credit != null) ...[
                const SizedBox(height: AppSpacing.s1),
                Text(credit!, style: typo.caption.copyWith(color: colors.textTertiary)),
              ],
              const SizedBox(height: AppSpacing.s3),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text(title, style: typo.title3.copyWith(color: colors.textPrimary))),
                  if (score != null) ...[
                    const SizedBox(width: AppSpacing.s3),
                    _ScorePill(score: score!),
                  ],
                ],
              ),
              const SizedBox(height: AppSpacing.s2),
              SwatchRow(swatches: swatches),
              if (explanation != null) ...[
                const SizedBox(height: AppSpacing.s2),
                Text(explanation!, style: typo.body.copyWith(color: colors.textSecondary)),
              ],
            ],
          ),
        ),
    };

    return Semantics(
      button: onTap != null,
      label: semanticsLabel,
      child: GestureDetector(behavior: HitTestBehavior.opaque, onTap: onTap, child: content),
    );
  }
}

class _ScorePill extends StatelessWidget {
  const _ScorePill({required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    final tone = ScoreTone.of(score);
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s2, vertical: AppSpacing.s1),
      decoration: BoxDecoration(
        color: tone.color(colors).withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Text(
        '$score',
        style: context.typo.label.copyWith(
          color: colors.textPrimary,
          fontFeatures: const [FontFeature.tabularFigures()],
        ),
      ),
    );
  }
}
