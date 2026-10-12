import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../application/catalog_providers.dart';
import '../domain/catalog_models.dart';

class ColorFamilyGrid extends ConsumerWidget {
  const ColorFamilyGrid({super.key, required this.selected, required this.onSelected, this.shrinkWrap = false});

  final CatalogColor? selected;
  final ValueChanged<CatalogColor> onSelected;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = ref.watch(colorsProvider);
    return switch (palette) {
      AsyncValue(:final value?, hasValue: true) => _grouped(context, value),
      AsyncValue(error: _?) => ErrorState(onRetry: () => ref.invalidate(colorsProvider)),
      _ => const Padding(
          padding: AppSpacing.screenPadding,
          child: Skeleton(height: 200),
        ),
    };
  }

  Widget _grouped(BuildContext context, List<CatalogColor> palette) {
    final families = <String, List<CatalogColor>>{};
    for (final color in palette) {
      families.putIfAbsent(color.colorFamily, () => []).add(color);
    }
    final colors = context.colors;
    return ListView(
      shrinkWrap: shrinkWrap,
      physics: shrinkWrap ? const NeverScrollableScrollPhysics() : null,
      padding: const EdgeInsets.only(bottom: AppSpacing.s4),
      children: [
        for (final entry in families.entries) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.screenHorizontal,
              AppSpacing.s3,
              AppSpacing.screenHorizontal,
              AppSpacing.s2,
            ),
            child: Text(
              context.l10n.colorFamily(entry.key).toUpperCase(),
              style: context.typo.overline.copyWith(color: colors.textTertiary),
            ),
          ),
          Padding(
            padding: AppSpacing.screenPadding,
            child: Wrap(
              spacing: AppSpacing.gridGutter,
              runSpacing: AppSpacing.gridGutter,
              children: [
                for (final c in entry.value)
                  AppColorSwatch(
                    key: ValueKey('swatch-${c.slug}'),
                    color: c.color,
                    name: c.name,
                    size: SwatchSize.lg,
                    selected: selected?.id == c.id,
                    onTap: () => onSelected(c),
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
