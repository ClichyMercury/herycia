import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/presentation/error_text.dart';
import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../account/application/session_controller.dart';
import '../../catalog/application/catalog_lookup.dart';
import '../../favorites/presentation/favorite_button.dart';
import '../../looks/presentation/look_view.dart';
import '../../looks/presentation/look_visual.dart';
import '../../recommendation/application/recommendation_providers.dart';
import '../../recommendation/domain/recommendation_models.dart';
import '../../recommendation/presentation/feedback_sheet.dart';
import '../application/from_item_controller.dart';

class FromItemResultsScreen extends ConsumerWidget {
  const FromItemResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final request = ref.watch(fromItemDraftProvider).toRequest();
    if (request == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.resultsTitle)),
        body: Center(
          child: ContentState.empty(
            title: l10n.resultsEmptyTitle,
            actionLabel: l10n.resultsEmptyAction,
            onAction: () => context.go(AppRoutes.fromItem),
          ),
        ),
      );
    }
    final response = ref.watch(fromItemProvider(request));
    final lookup = ref.watch(catalogLookupProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.resultsTitle)),
      body: switch ((response, lookup)) {
        (AsyncValue(value: final data?), AsyncValue(value: final catalog?)) => _Results(
          response: data,
          lookup: catalog,
          request: request,
        ),
        (AsyncValue(error: NetworkUnavailableException()), _) => _OfflineHints(colorId: request.colorId),
        (AsyncValue(:final error?), _) || (_, AsyncValue(:final error?)) => Center(
          child: ErrorState(message: errorText(error, l10n), onRetry: () => ref.invalidate(fromItemProvider(request))),
        ),
        _ => ListView(
          key: const ValueKey('results-loading'),
          padding: AppSpacing.screenPadding,
          children: const [
            SlowLoadingHint(child: Skeleton(height: 420)),
            SizedBox(height: AppSpacing.betweenCards),
            Skeleton(height: 420),
          ],
        ),
      },
    );
  }
}

class _Results extends ConsumerWidget {
  const _Results({required this.response, required this.lookup, required this.request});

  final FromItemResponse response;
  final CatalogLookup lookup;
  final FromItemRequest request;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final colors = context.colors;
    final occasion = lookup.occasionBySlug(response.filters.occasionSlug);
    final style = lookup.styleBySlug(response.filters.styleSlug);
    final looks = [
      for (final r in response.results)
        LookView.fromRecommendation(
          r,
          lookup,
          requestId: response.requestId,
          rulesVersion: response.rulesVersion,
          occasion: occasion,
          style: style,
        ),
    ];
    final anchorType = lookup.typeOf(response.startingItem.clothingType);
    final anchorColor = lookup.colorOf(response.startingItem.color);
    final cached = response.cachedAt;
    final showFeedback = cached == null && ref.watch(isSignedInProvider);

    if (looks.isEmpty && response.advice.isNotEmpty) {
      return ListView(
        key: const ValueKey('neutral-advice'),
        padding: const EdgeInsets.fromLTRB(AppSpacing.screenHorizontal, 0, AppSpacing.screenHorizontal, AppSpacing.s8),
        children: [
          Text(l10n.resultsAdviceTitle, style: context.typo.title3.copyWith(color: colors.textPrimary)),
          const SizedBox(height: AppSpacing.s2),
          Text(l10n.resultsAdviceIntro, style: context.typo.body.copyWith(color: colors.textSecondary)),
          const SizedBox(height: AppSpacing.s4),
          for (final advice in response.advice)
            _AdviceTile(
              text: advice.text,
              swatches: [
                for (final id in advice.colorIds)
                  if (lookup.color(id) case final c?) (color: c.color, name: c.name),
              ],
            ),
        ],
      );
    }

    if (looks.isEmpty) {
      return Center(
        child: ContentState.empty(
          title: l10n.resultsEmptyTitle,
          message: l10n.resultsEmptyMessage,
          actionLabel: l10n.resultsEmptyAction,
          onAction: () => context.go(AppRoutes.fromItem),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(AppSpacing.screenHorizontal, 0, AppSpacing.screenHorizontal, AppSpacing.s8),
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.s3),
          decoration: BoxDecoration(color: colors.actionPrimarySoft, borderRadius: BorderRadius.circular(AppRadius.lg)),
          child: Row(
            children: [
              AppColorSwatch(color: anchorColor.color, name: anchorColor.name, size: SwatchSize.sm),
              const SizedBox(width: AppSpacing.s3),
              Expanded(
                child: Text(
                  '${l10n.fromItemYourPiece} : ${anchorType.name} ${anchorColor.name.toLowerCase()}',
                  style: context.typo.bodyStrong.copyWith(color: colors.textPrimary),
                ),
              ),
              AppButton(
                label: l10n.fromItemChange,
                variant: AppButtonVariant.ghost,
                size: AppButtonSize.sm,
                onPressed: () => context.go(AppRoutes.fromItem),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.s3),
        Wrap(
          spacing: AppSpacing.s2,
          runSpacing: AppSpacing.s1,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(l10n.resultsCount(looks.length), style: context.typo.caption.copyWith(color: colors.textSecondary)),
            if (cached != null)
              AppBadge(
                key: const ValueKey('cached-result'),
                label: l10n.cachedResult(MaterialLocalizations.of(context).formatShortDate(cached)),
              ),
          ],
        ),
        if (response.broadened.applied && response.broadened.steps.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.s3),
          Container(
            key: const ValueKey('broadened'),
            padding: const EdgeInsets.all(AppSpacing.s3),
            decoration: BoxDecoration(color: colors.infoBg, borderRadius: BorderRadius.circular(AppRadius.md)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(AppIcons.info, size: AppSizes.iconInButton, color: colors.textPrimary),
                const SizedBox(width: AppSpacing.s2),
                Expanded(
                  child: Text(
                    l10n.resultsBroadened(response.broadened.steps.map((s) => broadeningLabel(l10n, s)).join(', ')),
                    style: context.typo.body.copyWith(color: colors.textPrimary),
                  ),
                ),
              ],
            ),
          ),
        ],
        const SizedBox(height: AppSpacing.s4),
        for (final (i, look) in looks.indexed)
          _Cascade(
            index: i,
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.betweenCards),
              child: LookCard(
                key: ValueKey('result-$i'),
                visual: LookVisual(look: look),
                title: look.title,
                semanticsLabel: look.semantics,
                swatches: swatchesOf(look),
                explanation: look.explanation,
                score: look.score,
                credit: creditFor(look) == null ? null : l10n.lookCredit(creditFor(look)!),
                action: FavoriteButton(look: look),
                onTap: () => context.push(AppRoutes.look, extra: look),
              ),
            ),
          ),
        if (showFeedback) FeedbackPrompt(requestId: response.requestId),
      ],
    );
  }
}

String broadeningLabel(AppLocalizations l10n, BroadeningCriterion step) => switch (step) {
  BroadeningCriterion.style => l10n.broadenedStyle,
  BroadeningCriterion.occasion => l10n.broadenedOccasion,
  BroadeningCriterion.neighborShades => l10n.broadenedShades,
  BroadeningCriterion.neutralAdvice => l10n.broadenedNeutral,
};

class _AdviceTile extends StatelessWidget {
  const _AdviceTile({required this.text, required this.swatches});

  final String text;
  final List<({Color color, String name})> swatches;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.s3),
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: context.typo.body.copyWith(color: colors.textPrimary)),
          if (swatches.isNotEmpty) ...[const SizedBox(height: AppSpacing.s2), SwatchRow(swatches: swatches)],
        ],
      ),
    );
  }
}

class _OfflineHints extends ConsumerWidget {
  const _OfflineHints({required this.colorId});

  final String colorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final colors = context.colors;
    final hints = ref.watch(colorHintsProvider(colorId)).value ?? const [];
    final anchor = ref.watch(catalogLookupProvider).value?.color(colorId);
    if (hints.isEmpty || anchor == null) {
      return Center(
        child: ErrorState(message: l10n.errorOffline, onRetry: () => ref.invalidate(fromItemProvider)),
      );
    }
    return ListView(
      key: const ValueKey('offline-hints'),
      padding: const EdgeInsets.fromLTRB(AppSpacing.screenHorizontal, 0, AppSpacing.screenHorizontal, AppSpacing.s8),
      children: [
        AppBadge(label: l10n.offlineGuideBadge),
        const SizedBox(height: AppSpacing.s3),
        Text(
          l10n.offlineGuideTitle(anchor.name.toLowerCase()),
          style: context.typo.title3.copyWith(color: colors.textPrimary),
        ),
        const SizedBox(height: AppSpacing.s2),
        Text(l10n.offlineGuideIntro, style: context.typo.body.copyWith(color: colors.textSecondary)),
        const SizedBox(height: AppSpacing.s4),
        for (final (color, partner) in hints)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.s3),
            child: Row(
              children: [
                AppColorSwatch(color: anchor.color, name: anchor.name, size: SwatchSize.sm),
                const SizedBox(width: AppSpacing.s1),
                AppColorSwatch(color: color.color, name: color.name, size: SwatchSize.sm),
                const SizedBox(width: AppSpacing.s3),
                Expanded(
                  child: Text(partner.explanation, style: context.typo.body.copyWith(color: colors.textPrimary)),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _Cascade extends StatelessWidget {
  const _Cascade({required this.index, required this.child});

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final delay = AppMotion.cascadeDelay(context, index);
    final duration = AppMotion.slow.resolve(context);
    if (duration == Duration.zero) return child;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: duration + delay,
      curve: Interval(delay.inMilliseconds / (duration + delay).inMilliseconds, 1, curve: AppMotion.slow.curve),
      builder: (context, t, child) => Opacity(
        opacity: t,
        child: Transform.translate(offset: Offset(0, (1 - t) * 16), child: child),
      ),
      child: child,
    );
  }
}
