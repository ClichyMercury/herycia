import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../catalog/application/catalog_providers.dart';
import '../../catalog/presentation/color_family_grid.dart';
import '../../catalog/domain/catalog_models.dart';
import '../../mannequin/presentation/mannequin_view.dart';
import '../domain/composition_to_mannequin.dart';
import '../domain/outfit_composition.dart';
import 'composition_labels.dart';

sealed class PiecePickerResult {
  const PiecePickerResult();
}

class PiecePicked extends PiecePickerResult {
  const PiecePicked(this.piece);

  final ComposedPiece piece;
}

class PieceRemoved extends PiecePickerResult {
  const PieceRemoved();
}

Future<PiecePickerResult?> showPiecePicker(
  BuildContext context, {
  required CompositionRole role,
  required OutfitComposition composition,
  ComposedPiece? initial,
}) {
  return showModalBottomSheet<PiecePickerResult>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => FractionallySizedBox(
      heightFactor: 0.94,
      child: PiecePickerSheet(role: role, composition: composition, initial: initial),
    ),
  );
}

class PiecePickerSheet extends ConsumerStatefulWidget {
  const PiecePickerSheet({
    super.key,
    required this.role,
    required this.composition,
    this.initial,
  });

  final CompositionRole role;
  final OutfitComposition composition;
  final ComposedPiece? initial;

  @override
  ConsumerState<PiecePickerSheet> createState() => _PiecePickerSheetState();
}

class _PiecePickerSheetState extends ConsumerState<PiecePickerSheet> {
  late ClothingType? _type = widget.initial?.type;
  late CatalogColor? _color = widget.initial?.color;

  ComposedPiece? get _candidate =>
      _type != null && _color != null ? ComposedPiece(type: _type!, color: _color!) : null;

  OutfitComposition get _preview {
    final candidate = _candidate;
    if (candidate == null) return widget.composition;
    var base = widget.composition;
    if (widget.role == CompositionRole.accessory && widget.initial != null) {
      base = base.withoutAccessory(widget.initial!.type.id);
    }
    return base.withPiece(widget.role, candidate);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final choosingColor = _type != null;
    final preview = _preview;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: AppSpacing.screenPadding,
          child: Row(
            children: [
              if (choosingColor)
                IconButton(
                  key: const ValueKey('picker-back'),
                  tooltip: l10n.pickerBack,
                  onPressed: () => setState(() {
                    _type = null;
                    _color = null;
                  }),
                  icon: const Icon(AppIcons.back),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roleLabel(l10n, widget.role).toUpperCase(),
                      style: context.typo.overline.copyWith(color: colors.textTertiary),
                    ),
                    Text(
                      choosingColor ? l10n.pickerChooseColor : l10n.pickerChooseType,
                      style: context.typo.title2.copyWith(color: colors.textPrimary),
                    ),
                  ],
                ),
              ),
              if (widget.initial != null)
                AppButton(
                  key: const ValueKey('picker-remove'),
                  label: l10n.composeRemovePiece,
                  variant: AppButtonVariant.ghost,
                  size: AppButtonSize.sm,
                  onPressed: () => Navigator.of(context).pop(const PieceRemoved()),
                ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.s3),
        Padding(
          padding: AppSpacing.screenPadding,
          child: MannequinPreview(
            outfit: compositionToMannequin(preview),
            semanticsLabel: compositionDescription(l10n, preview),
            height: 170,
            showSilhouettePicker: false,
          ),
        ),
        const SizedBox(height: AppSpacing.s4),
        Expanded(
          child: AnimatedSwitcher(
            duration: AppMotion.base.resolve(context),
            child: choosingColor
                ? ColorFamilyGrid(
                    key: const ValueKey('color-step'),
                    selected: _color,
                    onSelected: (c) => setState(() => _color = c),
                  )
                : _TypeList(
                    key: const ValueKey('type-step'),
                    group: widget.role.group,
                    onSelected: (t) => setState(() {
                      _type = t;
                      if (widget.initial?.type.id != t.id) _color = null;
                    }),
                  ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: colors.surface,
            border: Border(top: BorderSide(color: colors.border)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.screenHorizontal,
              AppSpacing.s3,
              AppSpacing.screenHorizontal,
              AppSpacing.s3,
            ),
            child: AppButton(
              key: const ValueKey('picker-confirm'),
              label: _candidate == null ? l10n.pickerConfirm : '${l10n.pickerConfirm} · ${pieceLabel(l10n, _candidate!)}',
              onPressed: _candidate == null
                  ? null
                  : () => Navigator.of(context).pop(PiecePicked(_candidate!)),
            ),
          ),
        ),
      ],
    );
  }
}

class _TypeList extends ConsumerWidget {
  const _TypeList({super.key, required this.group, required this.onSelected});

  final CategoryGroup group;
  final ValueChanged<ClothingType> onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);
    return switch (categories) {
      AsyncValue(:final value?, hasValue: true) => _typesFor(
          context,
          ref,
          value.where((c) => c.groupType == group).firstOrNull,
        ),
      AsyncValue(error: _?) => ErrorState(onRetry: () => ref.invalidate(categoriesProvider)),
      _ => const _ListSkeleton(),
    };
  }

  Widget _typesFor(BuildContext context, WidgetRef ref, ClothingCategory? category) {
    if (category == null) {
      return ErrorState(onRetry: () => ref.invalidate(categoriesProvider));
    }
    final types = ref.watch(typesByCategoryProvider(category.id));
    final colors = context.colors;
    return switch (types) {
      AsyncValue(:final value?, hasValue: true) => ListView.separated(
          padding: AppSpacing.screenPadding,
          itemCount: value.length,
          separatorBuilder: (_, _) => Divider(color: colors.border),
          itemBuilder: (context, index) {
            final type = value[index];
            return Semantics(
              button: true,
              label: type.name,
              excludeSemantics: true,
              onTap: () => onSelected(type),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onSelected(type),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 52),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(type.name, style: context.typo.body.copyWith(color: colors.textPrimary)),
                      ),
                      Icon(AppIcons.chevronRight, color: colors.textTertiary),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      AsyncValue(error: _?) =>
        ErrorState(onRetry: () => ref.invalidate(typesByCategoryProvider(category.id))),
      _ => const _ListSkeleton(),
    };
  }
}

class _ListSkeleton extends StatelessWidget {
  const _ListSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSpacing.screenPadding,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (var i = 0; i < 5; i++)
          const Padding(
            padding: EdgeInsets.only(bottom: AppSpacing.s3),
            child: Skeleton(height: 40, radius: AppRadius.md),
          ),
      ],
    );
  }
}
