import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/presentation/error_text.dart';
import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../catalog/application/catalog_lookup.dart';
import '../../catalog/application/catalog_providers.dart';
import '../../catalog/domain/catalog_models.dart';
import '../../compose_from_item/application/from_item_controller.dart';

Widget _asyncBody<T>(
  BuildContext context,
  AsyncValue<T> value,
  VoidCallback retry,
  Widget Function(T data) builder,
) =>
    switch (value) {
      AsyncValue(value: final data?, hasValue: true) => builder(data),
      AsyncValue(:final error?) => Center(child: ErrorState(message: errorText(error, context.l10n), onRetry: retry)),
      _ => const Padding(padding: AppSpacing.screenPadding, child: Skeleton(height: 320)),
    };

class ColorGuideScreen extends ConsumerWidget {
  const ColorGuideScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final guide = ref.watch(colorGuideProvider);
    final lookup = ref.watch(catalogLookupProvider);
    final colors = context.colors;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.guideTitle)),
      body: _asyncBody(
        context,
        guide.whenData((g) => (g, lookup.value)),
        () => ref.invalidate(colorGuideProvider),
        (data) {
          final (guide, catalog) = data;
          return ListView(
            padding: const EdgeInsets.fromLTRB(AppSpacing.screenHorizontal, 0, AppSpacing.screenHorizontal, AppSpacing.s8),
            children: [
              Text(l10n.guideIntro, style: context.typo.body.copyWith(color: colors.textSecondary)),
              const SizedBox(height: AppSpacing.s4),
              _GuideTile(
                key: const ValueKey('guide-principles'),
                title: l10n.guidePrinciples,
                subtitle: l10n.guidePrinciplesSubtitle,
                onTap: () => context.go(AppRoutes.colorGuidePrinciples),
              ),
              const SizedBox(height: AppSpacing.s4),
              for (final family in guide.families)
                Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.s3),
                  child: _GuideTile(
                    key: ValueKey('family-${family.slug}'),
                    title: family.name,
                    subtitle: l10n.guideFamilyCount(family.colorIds.length),
                    badge: guide.isNeutralFamily(family) ? l10n.guideNeutralBadge : null,
                    swatches: [
                      for (final id in family.colorIds)
                        if (catalog?.color(id) case final c?) (color: c.color, name: c.name),
                    ],
                    onTap: () => context.go(AppRoutes.colorFamily(family.slug)),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _GuideTile extends StatelessWidget {
  const _GuideTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.badge,
    this.swatches = const [],
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final String? badge;
  final List<({Color color, String name})> swatches;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Semantics(
      button: true,
      label: '$title. $subtitle',
      excludeSemantics: true,
      onTap: onTap,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.cardPadding),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: colors.border),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(child: Text(title, style: context.typo.bodyStrong.copyWith(color: colors.textPrimary))),
                        if (badge != null) ...[
                          const SizedBox(width: AppSpacing.s2),
                          AppBadge(label: badge!),
                        ],
                      ],
                    ),
                    const SizedBox(height: AppSpacing.s1),
                    Text(subtitle, style: context.typo.caption.copyWith(color: colors.textSecondary)),
                    if (swatches.isNotEmpty) ...[
                      const SizedBox(height: AppSpacing.s2),
                      SwatchRow(swatches: swatches),
                    ],
                  ],
                ),
              ),
              Icon(AppIcons.chevronRight, color: colors.textTertiary),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorFamilyScreen extends ConsumerStatefulWidget {
  const ColorFamilyScreen({super.key, required this.slug});

  final String slug;

  @override
  ConsumerState<ColorFamilyScreen> createState() => _ColorFamilyScreenState();
}

class _ColorFamilyScreenState extends ConsumerState<ColorFamilyScreen> {
  String? _selectedId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final guide = ref.watch(colorGuideProvider).value;
    final lookup = ref.watch(catalogLookupProvider).value;
    final family = guide?.families.where((f) => f.slug == widget.slug).firstOrNull;
    final familyColors = family == null || lookup == null ? const <CatalogColor>[] : [for (final id in family.colorIds) ?lookup.color(id)];

    if (guide == null || family == null || lookup == null || familyColors.isEmpty) {
      return Scaffold(
        appBar: AppBar(),
        body: const Padding(padding: AppSpacing.screenPadding, child: Skeleton(height: 320)),
      );
    }
    final selected = lookup.color(_selectedId ?? familyColors.first.id) ?? familyColors.first;
    final harmony = guide.harmonyFor(selected.id);
    final groups = [
      (HarmonyKind.harmonious, l10n.guideHarmonious),
      (HarmonyKind.contrast, l10n.guideContrast),
      (HarmonyKind.neutralPairing, l10n.guideNeutralPairing),
      (HarmonyKind.caution, l10n.guideCaution),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(family.name)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(AppSpacing.screenHorizontal, 0, AppSpacing.screenHorizontal, AppSpacing.s8),
        children: [
          Wrap(
            spacing: AppSpacing.gridGutter,
            runSpacing: AppSpacing.gridGutter,
            children: [
              for (final c in familyColors)
                AppColorSwatch(
                  key: ValueKey('guide-swatch-${c.slug}'),
                  color: c.color,
                  name: c.name,
                  size: SwatchSize.xl,
                  selected: c.id == selected.id,
                  onTap: () => setState(() => _selectedId = c.id),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.s2),
          Text(l10n.guidePickColor, style: context.typo.caption.copyWith(color: colors.textTertiary)),
          const SizedBox(height: AppSpacing.betweenSections),
          Text(
            l10n.guideSuggestedPairs(selected.name.toLowerCase()),
            style: context.typo.title3.copyWith(color: colors.textPrimary),
          ),
          if (harmony == null)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.titleToContent),
              child: Text(l10n.guideNoPairs, style: context.typo.body.copyWith(color: colors.textSecondary)),
            ),
          for (final (kind, label) in groups)
            if (harmony?.of(kind) case final partners? when partners.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.s4),
              Text(
                label.toUpperCase(),
                key: ValueKey('guide-group-${kind.name}'),
                style: context.typo.overline.copyWith(color: colors.textTertiary),
              ),
              const SizedBox(height: AppSpacing.s2),
              for (final partner in partners)
                if (lookup.color(partner.colorId) case final other?)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.s3),
                    child: Row(
                      children: [
                        AppColorSwatch(color: selected.color, name: selected.name, size: SwatchSize.sm),
                        const SizedBox(width: AppSpacing.s1),
                        AppColorSwatch(color: other.color, name: other.name, size: SwatchSize.sm),
                        const SizedBox(width: AppSpacing.s3),
                        Expanded(
                          child: Text(partner.explanation, style: context.typo.body.copyWith(color: colors.textPrimary)),
                        ),
                      ],
                    ),
                  ),
            ],
          const SizedBox(height: AppSpacing.betweenSections),
          AppButton(
            key: const ValueKey('guide-compose'),
            label: l10n.guideComposeWith,
            onPressed: () {
              ref.read(fromItemDraftProvider.notifier)
                ..reset()
                ..presetColor(selected);
              context.go(AppRoutes.fromItem);
            },
          ),
        ],
      ),
    );
  }
}

class PrinciplesScreen extends StatelessWidget {
  const PrinciplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final principles = [
      (l10n.principleNeutralTitle, l10n.principleNeutralBody),
      (l10n.principleHarmonyTitle, l10n.principleHarmonyBody),
      (l10n.principleContrastTitle, l10n.principleContrastBody),
      (l10n.principleCautionTitle, l10n.principleCautionBody),
    ];
    return Scaffold(
      appBar: AppBar(title: Text(l10n.guidePrinciples)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(AppSpacing.screenHorizontal, 0, AppSpacing.screenHorizontal, AppSpacing.s8),
        children: [
          for (final (title, body) in principles)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.betweenSections),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: context.typo.title3.copyWith(color: colors.textPrimary)),
                  const SizedBox(height: AppSpacing.s2),
                  Text(body, style: context.typo.body.copyWith(color: colors.textSecondary)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
