import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/presentation/error_text.dart';
import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../account/application/session_controller.dart';
import '../../catalog/application/catalog_lookup.dart';
import '../../favorites/application/saved_outfits_providers.dart';
import '../../favorites/domain/wardrobe_models.dart';
import '../../mannequin/application/silhouette_provider.dart';
import '../../mannequin/presentation/mannequin_view.dart';
import '../../recommendation/application/recommendation_providers.dart';
import '../../recommendation/domain/recommendation_models.dart';
import '../../recommendation/presentation/breakdown_sheet.dart';
import '../../recommendation/presentation/feedback_sheet.dart';
import '../application/composition_controller.dart';
import '../domain/composition_to_mannequin.dart';
import '../domain/outfit_composition.dart';
import 'composition_labels.dart';

class PreviousScore extends Notifier<int?> {
  @override
  int? build() => null;

  void remember(int score) => state = score;
}

final previousScoreProvider = NotifierProvider.autoDispose<PreviousScore, int?>(PreviousScore.new);

class EvaluationScreen extends ConsumerWidget {
  const EvaluationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final composition = ref.watch(compositionProvider);
    final evaluation = ref.watch(evaluationProvider(composition.toRequest()));
    ref.watch(previousScoreProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.evaluationTitle)),
      body: switch (evaluation) {
        AsyncValue(:final value?, hasValue: true, isLoading: false) =>
          _EvaluationBody(composition: composition, evaluation: value),
        AsyncValue(:final error?, isLoading: false) => Center(
            child: ErrorState(
              message: errorText(error, l10n),
              onRetry: () => ref.invalidate(evaluationProvider(composition.toRequest())),
            ),
          ),
        _ => const _EvaluationSkeleton(),
      },
    );
  }
}

class _EvaluationSkeleton extends StatelessWidget {
  const _EvaluationSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const ValueKey('evaluation-loading'),
      padding: const EdgeInsets.all(AppSpacing.screenHorizontal),
      children: const [
        SlowLoadingHint(
          child: Row(
            children: [
              Skeleton.circle(size: 72),
              SizedBox(width: AppSpacing.s4),
              Expanded(child: Skeleton(height: 40)),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.s6),
        Skeleton(height: 80),
        SizedBox(height: AppSpacing.s4),
        Skeleton(height: 120),
      ],
    );
  }
}

class _EvaluationBody extends ConsumerWidget {
  const _EvaluationBody({required this.composition, required this.evaluation});

  final OutfitComposition composition;
  final EvaluationResponse evaluation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final colors = context.colors;
    final typo = context.typo;
    final previous = ref.watch(previousScoreProvider);
    final lookup = ref.watch(catalogLookupProvider).value;
    final improvements = ref.watch(improvementProvider(composition.toRequest()));
    final signedIn = ref.watch(isSignedInProvider);

    final structural = evaluation.warnings.where((w) => w.type == WarningType.structure).toList();
    final preferences = evaluation.warnings.where((w) => w.type == WarningType.preference).toList();

    Widget section(String title, List<Widget> children) => Padding(
          padding: const EdgeInsets.only(top: AppSpacing.betweenSections),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: typo.title3.copyWith(color: colors.textPrimary)),
              const SizedBox(height: AppSpacing.titleToContent),
              ...children,
            ],
          ),
        );

    Widget line(IconData icon, Color iconColor, String text, {String? tag}) => Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.s3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: AppSizes.iconInButton, color: iconColor),
              const SizedBox(width: AppSpacing.s3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (tag != null) Text(tag.toUpperCase(), style: typo.overline.copyWith(color: colors.textTertiary)),
                    Text(text, style: typo.body.copyWith(color: colors.textPrimary)),
                  ],
                ),
              ),
            ],
          ),
        );

    void apply(Improvement improvement) {
      if (lookup == null) return;
      ref.read(previousScoreProvider.notifier).remember(evaluation.score);
      ref.read(compositionProvider.notifier).restore(
            composition.applyChange(improvement.change, type: lookup.type, color: lookup.color),
          );
    }

    final actionable = improvements.value?.improvements ?? const <Improvement>[];
    final offline = evaluation.cachedAt != null;

    return ListView(
      padding: const EdgeInsets.fromLTRB(AppSpacing.screenHorizontal, 0, AppSpacing.screenHorizontal, AppSpacing.s8),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 96,
              height: 150,
              child: MannequinView(
                outfit: compositionToMannequin(composition),
                silhouette: ref.watch(silhouetteProvider),
                semanticsLabel: compositionDescription(l10n, composition),
              ),
            ),
            const SizedBox(width: AppSpacing.s4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScoreRing(
                    key: ValueKey('score-${evaluation.score}'),
                    score: evaluation.score,
                    onExplain: () => showModalBottomSheet<void>(
                      context: context,
                      useSafeArea: true,
                      builder: (_) => BreakdownSheet(breakdown: evaluation.scoreBreakdown),
                    ),
                  ),
                  if (previous != null && previous != evaluation.score)
                    Padding(
                      padding: const EdgeInsets.only(top: AppSpacing.s2),
                      child: AppBadge(
                        key: const ValueKey('before-after'),
                        label: l10n.evaluationBeforeAfter(previous, evaluation.score),
                        variant: evaluation.score > previous ? AppBadgeVariant.fresh : AppBadgeVariant.neutral,
                      ),
                    ),
                  if (offline)
                    Padding(
                      padding: const EdgeInsets.only(top: AppSpacing.s2),
                      child: AppBadge(
                        key: const ValueKey('cached-result'),
                        label: l10n.cachedResult(MaterialLocalizations.of(context).formatShortDate(evaluation.cachedAt!)),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.s4),
        Text(
          evaluation.isComplete ? l10n.evaluationComplete : l10n.evaluationIncomplete,
          style: typo.bodyStrong.copyWith(color: colors.textPrimary),
        ),
        Text(l10n.evaluationIndicative, style: typo.caption.copyWith(color: colors.textTertiary)),
        if (evaluation.strengths.isNotEmpty)
          section(l10n.evaluationStrengths, [
            for (final s in evaluation.strengths) line(AppIcons.check, colors.success, s.text),
          ]),
        if (structural.isNotEmpty)
          section(l10n.evaluationStructural, [
            for (final w in structural) line(AppIcons.warning, colors.warning, w.text, tag: l10n.warningStructure),
          ]),
        if (preferences.isNotEmpty)
          section(l10n.evaluationStyleRemarks, [
            for (final w in preferences) line(AppIcons.info, colors.info, w.text, tag: l10n.warningPreference),
          ]),
        section(l10n.evaluationSuggestions, [
          if (actionable.isNotEmpty)
            for (final (i, s) in actionable.indexed)
              _SuggestionTile(
                key: ValueKey('suggestion-$i'),
                suggestion: s,
                currentScore: improvements.value!.currentScore,
                composition: composition,
                onApply: () => apply(s),
              )
          else if (evaluation.suggestions.isNotEmpty)
            for (final s in evaluation.suggestions) line(AppIcons.fromItem, colors.textSecondary, s.text)
          else
            Text(l10n.evaluationNoSuggestion, style: typo.body.copyWith(color: colors.textSecondary)),
        ]),
        const SizedBox(height: AppSpacing.betweenSections),
        if (signedIn && !offline) FeedbackPrompt(requestId: evaluation.requestId),
        const SizedBox(height: AppSpacing.s4),
        AppButton(
          key: const ValueKey('evaluation-save'),
          label: l10n.evaluationSave,
          onPressed: () => _save(context, ref, evaluation),
        ),
        AppButton(
          label: l10n.evaluationEditOutfit,
          variant: AppButtonVariant.secondary,
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ],
    );
  }
}

Future<void> _save(BuildContext context, WidgetRef ref, EvaluationResponse evaluation) async {
  final l10n = context.l10n;
  final composition = ref.read(compositionProvider);
  final request = composition.toRequest();
  final today = MaterialLocalizations.of(context).formatShortDate(DateTime.now());
  try {
    await ref.read(savedOutfitsProvider.notifier).create(
          title: l10n.savedOutfitDefaultTitle(today),
          composition: CompositionPayload(
            items: request.items,
            occasionSlug: request.occasionSlug,
            styleSlug: request.styleSlug,
          ),
          score: evaluation.score,
          ruleVersion: evaluation.rulesVersion,
        );
    if (context.mounted) showAppToast(context, message: l10n.savedOutfitSaved);
  } catch (e) {
    if (context.mounted) showAppToast(context, message: errorText(e, l10n));
  }
}

class _SuggestionTile extends ConsumerWidget {
  const _SuggestionTile({
    super.key,
    required this.suggestion,
    required this.currentScore,
    required this.composition,
    required this.onApply,
  });

  final Improvement suggestion;
  final int currentScore;
  final OutfitComposition composition;
  final VoidCallback onApply;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lookup = ref.watch(catalogLookupProvider).value;
    final change = suggestion.change;
    final index = change.itemIndex;
    final pieces = composition.rolePieces;
    final from = index != null && index < pieces.length ? pieces[index].$2.color : null;
    final to = change.item == null ? null : lookup?.color(change.item!.colorId);
    final colors = context.colors;
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.s3),
      padding: const EdgeInsets.all(AppSpacing.s3),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: colors.border),
      ),
      child: Row(
        children: [
          if (from != null) ...[
            AppColorSwatch(color: from.color, name: from.name, size: SwatchSize.sm),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s1),
              child: Icon(AppIcons.chevronRight, size: 16, color: colors.textTertiary),
            ),
          ],
          if (to != null) AppColorSwatch(color: to.color, name: to.name, size: SwatchSize.sm),
          const SizedBox(width: AppSpacing.s3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(suggestion.text, style: context.typo.body.copyWith(color: colors.textPrimary)),
                Text(
                  context.l10n.evaluationGain(suggestion.resultingScore - currentScore),
                  style: context.typo.caption.copyWith(color: colors.textSecondary),
                ),
              ],
            ),
          ),
          AppButton(
            label: context.l10n.evaluationTry,
            variant: AppButtonVariant.ghost,
            size: AppButtonSize.sm,
            onPressed: onApply,
          ),
        ],
      ),
    );
  }
}
