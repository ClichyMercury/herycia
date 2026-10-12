import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../catalog/application/catalog_providers.dart';

class ContextFilters extends ConsumerWidget {
  const ContextFilters({
    super.key,
    required this.occasionSlug,
    required this.styleSlug,
    required this.onOccasion,
    required this.onStyle,
    this.horizontalPadding = true,
  });

  final String? occasionSlug;
  final String? styleSlug;
  final ValueChanged<String?> onOccasion;
  final ValueChanged<String?> onStyle;
  final bool horizontalPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final occasions = ref.watch(occasionsProvider).value ?? const [];
    final styles = ref.watch(stylesProvider).value ?? const [];
    final labelStyle = context.typo.label.copyWith(color: context.colors.textSecondary);
    final pad = horizontalPadding ? AppSpacing.screenPadding : EdgeInsets.zero;

    Widget row(List<({String slug, String name})> items, String? selected, ValueChanged<String?> onChanged, String key) =>
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: pad,
          child: Row(
            children: [
              for (final (i, item) in items.indexed) ...[
                if (i > 0) const SizedBox(width: AppSpacing.s2),
                AppChip(
                  key: ValueKey('$key-${item.slug}'),
                  label: item.name,
                  selected: item.slug == selected,
                  onTap: () => onChanged(item.slug == selected ? null : item.slug),
                ),
              ],
            ],
          ),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: pad, child: Text(l10n.filtersOccasion, style: labelStyle)),
        row([for (final o in occasions) (slug: o.slug, name: o.name)], occasionSlug, onOccasion, 'occasion'),
        const SizedBox(height: AppSpacing.s3),
        Padding(padding: pad, child: Text(l10n.filtersStyle, style: labelStyle)),
        row([for (final s in styles) (slug: s.slug, name: s.name)], styleSlug, onStyle, 'style'),
      ],
    );
  }
}
