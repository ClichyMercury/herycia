import 'package:flutter/material.dart';

import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../domain/recommendation_models.dart';

class BreakdownSheet extends StatelessWidget {
  const BreakdownSheet({super.key, required this.breakdown});

  final ScoreBreakdown breakdown;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final rows = [
      (l10n.breakdownColor, breakdown.color.points, breakdown.color.max),
      (l10n.breakdownStructure, breakdown.structure.points, breakdown.structure.max),
      (l10n.breakdownOccasion, breakdown.occasion.points, breakdown.occasion.max),
      (l10n.breakdownStyle, breakdown.style.points, breakdown.style.max),
      (l10n.breakdownCompleteness, breakdown.completeness.points, breakdown.completeness.max),
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSpacing.screenHorizontal, 0, AppSpacing.screenHorizontal, AppSpacing.s8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.breakdownTitle, style: context.typo.title2.copyWith(color: colors.textPrimary)),
          const SizedBox(height: AppSpacing.s2),
          Text(l10n.breakdownIntro, style: context.typo.body.copyWith(color: colors.textSecondary)),
          const SizedBox(height: AppSpacing.s4),
          for (final (label, value, max) in rows) ...[
            Row(
              children: [
                Expanded(child: Text(label, style: context.typo.label.copyWith(color: colors.textPrimary))),
                Text(
                  l10n.breakdownValue(value, max),
                  style: context.typo.label.copyWith(
                    color: colors.textSecondary,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.s1),
            ExcludeSemantics(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.full),
                child: LinearProgressIndicator(
                  value: max == 0 ? 0 : value / max,
                  minHeight: 8,
                  backgroundColor: colors.surfaceSunken,
                  color: colors.actionPrimary,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.s3),
          ],
        ],
      ),
    );
  }
}
