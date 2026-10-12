import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/presentation/error_text.dart';
import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../catalog/application/catalog_lookup.dart';
import '../../compose_outfit/application/composition_controller.dart';
import '../../compose_outfit/domain/outfit_composition.dart';
import '../../looks/presentation/look_view.dart';
import '../../looks/presentation/look_visual.dart';
import '../application/saved_outfits_providers.dart';
import '../application/wardrobe_providers.dart';
import '../domain/wardrobe_models.dart';

LookView savedOutfitToLook(SavedOutfit outfit, CatalogLookup lookup, String fallbackTitle) => LookView(
      title: outfit.title ?? fallbackTitle,
      score: outfit.score,
      occasion: lookup.occasionBySlug(outfit.composition.occasionSlug),
      style: lookup.styleBySlug(outfit.composition.styleSlug),
      pieces: [
        for (final i in outfit.composition.items)
          if (lookup.type(i.clothingTypeId) case final type?)
            if (lookup.color(i.colorId) case final color?) LookPiece(type: type, color: color, role: i.role),
      ],
    );

class SavedOutfitsScreen extends ConsumerWidget {
  const SavedOutfitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final saved = ref.watch(savedOutfitsProvider);
    final lookup = ref.watch(catalogLookupProvider).value;

    void open(LookView look) {
      var composition = OutfitComposition.empty.withContext(occasionSlug: look.occasion?.slug, styleSlug: look.style?.slug);
      for (final p in look.pieces) {
        composition = composition.withPiece(CompositionRole.fromPieceRole(p.role), ComposedPiece(type: p.type, color: p.color));
      }
      ref.read(compositionProvider.notifier).restore(composition);
      context.go(AppRoutes.composeOutfit);
    }

    Future<void> delete(SavedOutfit outfit) async {
      final repo = ref.read(savedOutfitsRepositoryProvider);
      await repo.delete(outfit.clientUuid);
      ref.invalidate(savedOutfitsProvider);
      if (!context.mounted) return;
      showAppToast(
        context,
        message: l10n.savedOutfitDeleted,
        actionLabel: l10n.commonCancel,
        onAction: () async {
          await repo.create(SavedOutfitInput(
            clientUuid: outfit.clientUuid,
            title: outfit.title,
            composition: outfit.composition,
          ));
          ref.invalidate(savedOutfitsProvider);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.savedOutfitsTitle)),
      body: switch (saved) {
        AsyncValue(value: final list?, hasValue: true) when lookup != null => list.isEmpty
            ? Center(child: ContentState.empty(title: l10n.savedOutfitsEmpty, message: l10n.savedOutfitsEmptyMessage))
            : ListView(
                padding: AppSpacing.screenPadding,
                children: [
                  for (final outfit in list)
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.s3),
                      child: Row(
                        children: [
                          Expanded(
                            child: Builder(builder: (context) {
                              final look = savedOutfitToLook(outfit, lookup, l10n.savedOutfitsTitle);
                              return LookCard(
                                key: ValueKey('saved-${outfit.clientUuid}'),
                                variant: LookCardVariant.compact,
                                visual: LookVisual(look: look),
                                title: look.score == null ? look.title : '${look.title} · ${look.score}',
                                semanticsLabel: look.semantics,
                                swatches: swatchesOf(look),
                                onTap: () => open(look),
                              );
                            }),
                          ),
                          IconButton(
                            key: ValueKey('saved-delete-${outfit.clientUuid}'),
                            tooltip: l10n.commonRemove,
                            onPressed: () => delete(outfit),
                            icon: Icon(AppIcons.trash, color: context.colors.textSecondary),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
        AsyncValue(:final error?) => Center(
            child: ErrorState(message: errorText(error, l10n), onRetry: () => ref.invalidate(savedOutfitsProvider)),
          ),
        _ => const Padding(padding: AppSpacing.screenPadding, child: Skeleton(height: 240)),
      },
    );
  }
}
