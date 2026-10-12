import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../mannequin/presentation/mannequin_view.dart';
import '../../recommendation/presentation/context_filters.dart';
import '../application/composition_controller.dart';
import '../domain/composition_to_mannequin.dart';
import '../domain/outfit_composition.dart';
import 'composition_labels.dart';
import 'piece_picker_sheet.dart';

class ComposeOutfitScreen extends ConsumerWidget {
  const ComposeOutfitScreen({super.key});

  Future<void> _edit(
    BuildContext context,
    WidgetRef ref,
    CompositionRole role, {
    ComposedPiece? current,
  }) async {
    final controller = ref.read(compositionProvider.notifier);
    final before = ref.read(compositionProvider);
    final result = await showPiecePicker(
      context,
      role: role,
      composition: before,
      initial: current,
    );
    if (!context.mounted) return;
    switch (result) {
      case PiecePicked(:final piece):
        if (role == CompositionRole.accessory && current != null) {
          controller.removeAccessory(current.type.id);
        }
        controller.setPiece(role, piece);
      case PieceRemoved():
        if (role == CompositionRole.accessory && current != null) {
          controller.removeAccessory(current.type.id);
        } else {
          controller.removeRole(role);
        }
        showAppToast(
          context,
          message: context.l10n.composePieceRemoved,
          actionLabel: context.l10n.commonCancel,
          onAction: () => controller.restore(before),
        );
      case null:
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final colors = context.colors;
    final composition = ref.watch(compositionProvider);

    PieceSlotState stateFor(CompositionRole role) {
      if ((role == CompositionRole.top || role == CompositionRole.bottom) &&
          composition.onePiece != null) {
        return PieceSlotReplaced(replacedBy: composition.onePiece!.type.name.toLowerCase());
      }
      final piece = composition.pieceFor(role);
      return piece == null
          ? const PieceSlotEmpty()
          : PieceSlotFilled(
              typeName: piece.type.name,
              colorName: piece.color.name,
              color: piece.color.color,
            );
    }

    Widget slot(CompositionRole role, {bool optional = false}) => Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.s3),
          child: PieceSlot(
            key: ValueKey('slot-${role.name}'),
            roleLabel: roleLabel(l10n, role),
            state: stateFor(role),
            isOptional: optional,
            onTap: () => _edit(context, ref, role, current: composition.pieceFor(role)),
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.composeTitle),
        actions: [
          if (!composition.isEmpty)
            Padding(
              padding: const EdgeInsets.only(right: AppSpacing.s2),
              child: AppButton(
                key: const ValueKey('compose-reset'),
                label: l10n.composeReset,
                variant: AppButtonVariant.ghost,
                size: AppButtonSize.sm,
                onPressed: () {
                  final before = composition;
                  ref.read(compositionProvider.notifier).reset();
                  showAppToast(
                    context,
                    message: l10n.composeReset,
                    actionLabel: l10n.commonCancel,
                    onAction: () => ref.read(compositionProvider.notifier).restore(before),
                  );
                },
              ),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.screenHorizontal,
          0,
          AppSpacing.screenHorizontal,
          AppSpacing.s6,
        ),
        children: [
          MannequinPreview(
            outfit: compositionToMannequin(composition),
            semanticsLabel: compositionDescription(l10n, composition),
            height: 260,
          ),
          const SizedBox(height: AppSpacing.betweenSections),
          slot(CompositionRole.top),
          slot(CompositionRole.bottom),
          slot(CompositionRole.onePiece, optional: true),
          slot(CompositionRole.shoes),
          const SizedBox(height: AppSpacing.s3),
          Text(
            l10n.composeRoleAccessories,
            style: context.typo.title3.copyWith(color: colors.textPrimary),
          ),
          const SizedBox(height: AppSpacing.titleToContent),
          for (final accessory in composition.accessories)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.s3),
              child: PieceSlot(
                key: ValueKey('accessory-${accessory.type.id}'),
                roleLabel: accessory.type.name,
                state: PieceSlotFilled(
                  typeName: accessory.type.name,
                  colorName: accessory.color.name,
                  color: accessory.color.color,
                ),
                onTap: () => _edit(context, ref, CompositionRole.accessory, current: accessory),
              ),
            ),
          if (composition.canAddAccessory)
            PieceSlot(
              key: const ValueKey('slot-accessory-add'),
              roleLabel: l10n.composeAddAccessory,
              state: const PieceSlotEmpty(),
              isOptional: true,
              onTap: () => _edit(context, ref, CompositionRole.accessory),
            )
          else
            Text(
              l10n.composeAccessoriesLimit(OutfitComposition.maxAccessories),
              style: context.typo.caption.copyWith(color: colors.textTertiary),
            ),
          const SizedBox(height: AppSpacing.betweenSections),
          Text(l10n.filtersTitle, style: context.typo.title3.copyWith(color: colors.textPrimary)),
          const SizedBox(height: AppSpacing.s1),
          Text(l10n.filtersOptional, style: context.typo.caption.copyWith(color: colors.textSecondary)),
          const SizedBox(height: AppSpacing.titleToContent),
          ContextFilters(
            horizontalPadding: false,
            occasionSlug: composition.occasionSlug,
            styleSlug: composition.styleSlug,
            onOccasion: ref.read(compositionProvider.notifier).setOccasion,
            onStyle: ref.read(compositionProvider.notifier).setStyle,
          ),
        ],
      ),
      bottomNavigationBar: _EvaluateBar(composition: composition),
    );
  }
}

class _EvaluateBar extends StatelessWidget {
  const _EvaluateBar({required this.composition});

  final OutfitComposition composition;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(top: BorderSide(color: colors.border)),
        boxShadow: AppElevation.of(context.brightness, AppElevation.level2),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.screenHorizontal,
            AppSpacing.s3,
            AppSpacing.screenHorizontal,
            AppSpacing.s3,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                compositionStatus(l10n, composition),
                key: const ValueKey('compose-status'),
                textAlign: TextAlign.center,
                style: context.typo.caption.copyWith(color: colors.textSecondary),
              ),
              const SizedBox(height: AppSpacing.s2),
              AppButton(
                key: const ValueKey('compose-evaluate'),
                label: l10n.composeEvaluate,
                onPressed: composition.isComplete ? () => context.go(AppRoutes.evaluation) : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
