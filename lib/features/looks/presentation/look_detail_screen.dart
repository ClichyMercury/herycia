import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../../app/router.dart';
import '../../../core/presentation/error_text.dart';
import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../catalog/application/catalog_lookup.dart';
import '../../compose_from_item/application/from_item_controller.dart';
import '../../compose_outfit/application/composition_controller.dart';
import '../../compose_outfit/domain/outfit_composition.dart';
import '../../favorites/presentation/favorite_button.dart';
import '../../recommendation/presentation/breakdown_sheet.dart';
import '../../recommendation/presentation/feedback_sheet.dart';
import '../application/looks_providers.dart';
import '../domain/look_models.dart';
import 'look_view.dart';
import 'look_visual.dart';

class LookByIdScreen extends ConsumerWidget {
  const LookByIdScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final look = ref.watch(lookProvider(id));
    final lookup = ref.watch(catalogLookupProvider);
    return switch ((look, lookup)) {
      (AsyncValue(value: final data?), AsyncValue(value: final catalog?)) =>
        LookDetailScreen(look: LookView.fromLook(data, catalog)),
      (AsyncValue(:final error?), _) || (_, AsyncValue(:final error?)) => Scaffold(
          appBar: AppBar(title: Text(l10n.lookTitle)),
          body: Center(
            child: ErrorState(
              message: errorText(error, l10n),
              onRetry: () => ref.invalidate(lookProvider(id)),
            ),
          ),
        ),
      _ => Scaffold(
          appBar: AppBar(title: Text(l10n.lookTitle)),
          body: const Padding(padding: AppSpacing.screenPadding, child: Skeleton(height: 420)),
        ),
    };
  }
}

class LookDetailScreen extends ConsumerWidget {
  const LookDetailScreen({super.key, required this.look});

  final LookView look;

  Future<void> _share(BuildContext context) async {
    final l10n = context.l10n;
    final pieces = look.pieces.map((p) => '${p.type.name.toLowerCase()} ${p.color.name.toLowerCase()}').join(', ');
    final image = look.image;
    await SharePlus.instance.share(ShareParams(
      text: l10n.shareText(look.title, pieces),
      subject: look.title,
      uri: image != null && image.usageApproved ? Uri.tryParse(image.url) : null,
    ));
  }

  void _useAsBase(BuildContext context, WidgetRef ref) {
    var composition = OutfitComposition.empty.withContext(
      occasionSlug: look.occasion?.slug,
      styleSlug: look.style?.slug,
    );
    for (final p in look.pieces) {
      composition = composition.withPiece(
        CompositionRole.fromPieceRole(p.role),
        ComposedPiece(type: p.type, color: p.color),
      );
    }
    ref.read(compositionProvider.notifier).restore(composition);
    context.go(AppRoutes.composeOutfit);
  }

  void _variants(BuildContext context, WidgetRef ref, CatalogLookup lookup) {
    final anchor = look.pieces.where((p) => p.isAnchor).firstOrNull ??
        look.pieces.firstWhere((p) => p.role != PieceRole.accessory, orElse: () => look.pieces.first);
    final group = lookup.groupOf(anchor.type.id);
    final category = group == null ? null : lookup.categoryOf(group);
    if (category == null) return;
    final controller = ref.read(fromItemDraftProvider.notifier)
      ..reset()
      ..selectCategory(category)
      ..selectType(anchor.type)
      ..selectColor(anchor.color);
    if (look.occasion != null) controller.setOccasion(look.occasion!.slug);
    context.go(AppRoutes.fromItemResults);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final colors = context.colors;
    final typo = context.typo;
    final lookup = ref.watch(catalogLookupProvider).value;
    final credit = creditFor(look);

    Widget section(String title, Widget child) => Padding(
          padding: const EdgeInsets.only(top: AppSpacing.betweenSections),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: typo.title3.copyWith(color: colors.textPrimary)),
              const SizedBox(height: AppSpacing.titleToContent),
              child,
            ],
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.lookTitle),
        actions: [
          IconButton(
            key: const ValueKey('look-share'),
            tooltip: l10n.lookShare,
            onPressed: () => _share(context),
            icon: const Icon(AppIcons.share),
          ),
          FavoriteButton(look: look, onSurface: true),
          const SizedBox(width: AppSpacing.s2),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(AppSpacing.screenHorizontal, 0, AppSpacing.screenHorizontal, AppSpacing.s8),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.xl),
            child: AspectRatio(
              aspectRatio: 4 / 5,
              child: ColoredBox(color: colors.surfaceSunken, child: LookVisual(look: look)),
            ),
          ),
          if (credit != null) ...[
            const SizedBox(height: AppSpacing.s1),
            Text(l10n.lookCredit(credit), style: typo.caption.copyWith(color: colors.textTertiary)),
          ] else if (look.image == null && look.outfitId != null) ...[
            const SizedBox(height: AppSpacing.s1),
            Text(l10n.lookIllustration, style: typo.caption.copyWith(color: colors.textTertiary)),
          ],
          const SizedBox(height: AppSpacing.s4),
          Text(look.title, style: typo.title1.copyWith(color: colors.textPrimary)),
          if (look.description != null) ...[
            const SizedBox(height: AppSpacing.s2),
            Text(look.description!, style: typo.body.copyWith(color: colors.textSecondary)),
          ],
          if (look.score != null) ...[
            const SizedBox(height: AppSpacing.s4),
            ScoreRing(
              score: look.score!,
              onExplain: look.breakdown == null
                  ? null
                  : () => showModalBottomSheet<void>(
                        context: context,
                        useSafeArea: true,
                        builder: (_) => BreakdownSheet(breakdown: look.breakdown!),
                      ),
            ),
          ],
          if (look.explanation != null)
            section(l10n.lookWhy, Text(look.explanation!, style: typo.body.copyWith(color: colors.textPrimary))),
          section(
            l10n.lookPieces,
            Column(
              children: [
                for (final p in look.pieces)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.s3),
                    child: Row(
                      children: [
                        AppColorSwatch(color: p.color.color, name: p.color.name, showLabel: false),
                        const SizedBox(width: AppSpacing.s3),
                        Expanded(
                          child: Text(
                            '${p.type.name} · ${p.color.name}',
                            style: typo.bodyStrong.copyWith(color: colors.textPrimary),
                          ),
                        ),
                        if (p.isAnchor) AppBadge(label: l10n.lookAnchorBadge, variant: AppBadgeVariant.brand),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          if (look.occasion != null || look.style != null)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.s4),
              child: Wrap(
                spacing: AppSpacing.s2,
                runSpacing: AppSpacing.s2,
                children: [
                  if (look.occasion != null) AppBadge(label: '${l10n.lookOccasion} : ${look.occasion!.name}'),
                  if (look.style != null) AppBadge(label: '${l10n.lookStyle} : ${look.style!.name}'),
                ],
              ),
            ),
          const SizedBox(height: AppSpacing.betweenSections),
          AppButton(
            key: const ValueKey('look-use-as-base'),
            label: l10n.lookUseAsBase,
            onPressed: () => _useAsBase(context, ref),
          ),
          if (lookup != null && look.pieces.isNotEmpty)
            AppButton(
              key: const ValueKey('look-variants'),
              label: l10n.lookVariants,
              variant: AppButtonVariant.ghost,
              onPressed: () => _variants(context, ref, lookup),
            ),
          if (look.requestId != null && !look.requestId!.startsWith('offline_')) ...[
            const SizedBox(height: AppSpacing.s4),
            FeedbackPrompt(requestId: look.requestId!, outfitId: look.outfitId),
          ],
        ],
      ),
    );
  }
}
