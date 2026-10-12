import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/presentation/error_text.dart';
import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../catalog/application/catalog_providers.dart';
import '../../catalog/domain/catalog_models.dart';
import '../../catalog/presentation/color_family_grid.dart';
import '../../recommendation/presentation/context_filters.dart';
import '../application/from_item_controller.dart';

class FromItemScreen extends ConsumerWidget {
  const FromItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final draft = ref.watch(fromItemDraftProvider);
    final controller = ref.read(fromItemDraftProvider.notifier);

    final (title, body) = switch (draft.step) {
      FromItemStep.category => (l10n.fromItemStepCategory, const _CategoryStep()),
      FromItemStep.type => (l10n.fromItemStepType, _TypeStep(category: draft.category!)),
      FromItemStep.color => (
          l10n.fromItemStepColor,
          ColorFamilyGrid(selected: draft.color, onSelected: controller.selectColor),
        ),
      FromItemStep.filters => (
          l10n.fromItemStepFilters,
          ListView(
            children: [
              ContextFilters(
                occasionSlug: draft.occasionSlug,
                styleSlug: draft.styleSlug,
                onOccasion: controller.setOccasion,
                onStyle: controller.setStyle,
              ),
            ],
          ),
        ),
    };

    return PopScope(
      canPop: draft.step == FromItemStep.category,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) controller.back();
      },
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.fromItemTitle)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: AppSpacing.screenPadding,
              child: Text(title, style: context.typo.title2.copyWith(color: context.colors.textPrimary)),
            ),
            if (draft.type != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.screenHorizontal,
                  AppSpacing.s2,
                  AppSpacing.screenHorizontal,
                  0,
                ),
                child: _PieceRecap(draft: draft),
              ),
            const SizedBox(height: AppSpacing.s4),
            Expanded(
              child: AnimatedSwitcher(
                duration: AppMotion.base.resolve(context),
                child: KeyedSubtree(key: ValueKey(draft.step), child: body),
              ),
            ),
          ],
        ),
        bottomNavigationBar: draft.step == FromItemStep.filters ? _ShowLooksBar(draft: draft) : null,
      ),
    );
  }
}

class _PieceRecap extends ConsumerWidget {
  const _PieceRecap({required this.draft});

  final FromItemDraft draft;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    return Row(
      children: [
        if (draft.color != null) ...[
          AppColorSwatch(color: draft.color!.color, name: draft.color!.name, size: SwatchSize.sm),
          const SizedBox(width: AppSpacing.s2),
        ],
        Expanded(
          child: Text(
            [draft.type!.name, if (draft.color != null) draft.color!.name.toLowerCase()].join(' '),
            style: context.typo.bodyStrong.copyWith(color: colors.textSecondary),
          ),
        ),
        AppButton(
          key: const ValueKey('from-item-change'),
          label: context.l10n.fromItemChange,
          variant: AppButtonVariant.ghost,
          size: AppButtonSize.sm,
          onPressed: ref.read(fromItemDraftProvider.notifier).back,
        ),
      ],
    );
  }
}

class _CategoryStep extends ConsumerWidget {
  const _CategoryStep();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);
    return switch (categories) {
      AsyncValue(:final value?, hasValue: true) => GridView.count(
          crossAxisCount: 2,
          padding: AppSpacing.screenPadding,
          mainAxisSpacing: AppSpacing.gridGutter,
          crossAxisSpacing: AppSpacing.gridGutter,
          childAspectRatio: 1.6,
          children: [
            for (final c in value)
              _ChoiceTile(
                key: ValueKey('category-${c.slug}'),
                label: c.name,
                onTap: () => ref.read(fromItemDraftProvider.notifier).selectCategory(c),
              ),
          ],
        ),
      AsyncValue(:final error?) => ErrorState(
          message: errorText(error, context.l10n),
          onRetry: () => ref.invalidate(categoriesProvider),
        ),
      _ => const Padding(padding: AppSpacing.screenPadding, child: Skeleton(height: 220)),
    };
  }
}

class _TypeStep extends ConsumerWidget {
  const _TypeStep({required this.category});

  final ClothingCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final types = ref.watch(typesByCategoryProvider(category.id));
    return switch (types) {
      AsyncValue(:final value?, hasValue: true) => ListView(
          padding: AppSpacing.screenPadding,
          children: [
            for (final t in value)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.s2),
                child: _ChoiceTile(
                  key: ValueKey('type-${t.slug}'),
                  label: t.name,
                  onTap: () => ref.read(fromItemDraftProvider.notifier).selectType(t),
                ),
              ),
          ],
        ),
      AsyncValue(:final error?) => ErrorState(
          message: errorText(error, context.l10n),
          onRetry: () => ref.invalidate(typesByCategoryProvider(category.id)),
        ),
      _ => const Padding(padding: AppSpacing.screenPadding, child: Skeleton(height: 220)),
    };
  }
}

class _ChoiceTile extends StatelessWidget {
  const _ChoiceTile({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Semantics(
      button: true,
      label: label,
      excludeSemantics: true,
      onTap: onTap,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minHeight: 56),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s4, vertical: AppSpacing.s3),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: colors.border),
          ),
          child: Row(
            children: [
              Expanded(child: Text(label, style: context.typo.bodyStrong.copyWith(color: colors.textPrimary))),
              Icon(AppIcons.chevronRight, color: colors.textTertiary),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShowLooksBar extends ConsumerWidget {
  const _ShowLooksBar({required this.draft});

  final FromItemDraft draft;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final colors = context.colors;
    final occasions = ref.watch(occasionsProvider).value ?? const <Occasion>[];
    final styles = ref.watch(stylesProvider).value ?? const <OutfitStyle>[];
    final contextNames = [
      for (final o in occasions)
        if (o.slug == draft.occasionSlug) o.name,
      for (final s in styles)
        if (s.slug == draft.styleSlug) s.name,
    ];
    final summary = [
      '${draft.type!.name} ${draft.color!.name.toLowerCase()}',
      ...contextNames,
    ].join(' · ');

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(top: BorderSide(color: colors.border)),
        boxShadow: AppElevation.of(context.brightness, AppElevation.level2),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(AppSpacing.screenHorizontal, AppSpacing.s3, AppSpacing.screenHorizontal, AppSpacing.s3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                summary,
                key: const ValueKey('from-item-summary'),
                textAlign: TextAlign.center,
                style: context.typo.caption.copyWith(color: colors.textSecondary),
              ),
              const SizedBox(height: AppSpacing.s2),
              AppButton(
                key: const ValueKey('from-item-show'),
                label: l10n.fromItemShowLooks,
                onPressed: () => context.go(AppRoutes.fromItemResults),
              ),
              if (draft.occasionSlug != null || draft.styleSlug != null)
                AppButton(
                  label: l10n.fromItemNoFilter,
                  variant: AppButtonVariant.ghost,
                  size: AppButtonSize.sm,
                  onPressed: ref.read(fromItemDraftProvider.notifier).clearFilters,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
