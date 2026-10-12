import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/presentation/error_text.dart';
import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
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
        (AsyncValue(value: final data?), AsyncValue(value: final catalog?)) =>
          _Results(response: data, lookup: catalog, request: request),
        (AsyncValue(:final error?), _) || (_, AsyncValue(:final error?)) => Center(
            child: ErrorState(
              message: errorText(error, l10n),
              onRetry: () => ref.invalidate(fromItemProvider(request)),
            ),
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

class _Results extends StatelessWidget {
  const _Results({required this.response, required this.lookup, required this.request});

  final FromItemResponse response;
  final CatalogLookup lookup;
  final FromItemRequest request;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final occasion = lookup.occasionBySlug(request.occasionSlug);
    final style = lookup.styleBySlug(request.styleSlug);
    final looks = [
      for (final r in response.results)
        LookView.fromRecommendation(r, lookup, requestId: response.requestId, occasion: occasion, style: style),
    ];
    final anchorType = lookup.type(request.clothingTypeId);
    final anchorColor = lookup.color(request.colorId);

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
        if (anchorType != null && anchorColor != null)
          Container(
            padding: const EdgeInsets.all(AppSpacing.s3),
            decoration: BoxDecoration(
              color: colors.actionPrimarySoft,
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
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
        Row(
          children: [
            Text(l10n.resultsCount(looks.length), style: context.typo.caption.copyWith(color: colors.textSecondary)),
            if (response.computedOffline) ...[
              const SizedBox(width: AppSpacing.s2),
              AppBadge(key: const ValueKey('computed-offline'), label: l10n.offlineComputed),
            ],
          ],
        ),
        if (response.broadened.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.s3),
          Container(
            key: const ValueKey('broadened'),
            padding: const EdgeInsets.all(AppSpacing.s3),
            decoration: BoxDecoration(
              color: colors.infoBg,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(AppIcons.info, size: AppSizes.iconInButton, color: colors.textPrimary),
                const SizedBox(width: AppSpacing.s2),
                Expanded(
                  child: Text(
                    l10n.resultsBroadened(response.broadened.map((b) => b.message.toLowerCase()).join(', ')),
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
        if (!response.computedOffline) FeedbackPrompt(requestId: response.requestId),
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
