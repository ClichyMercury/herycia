import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../mannequin/application/silhouette_provider.dart';
import '../../mannequin/presentation/mannequin_view.dart';
import 'look_view.dart';

class LookVisual extends ConsumerWidget {
  const LookVisual({super.key, required this.look, this.preferMannequin = false});

  final LookView look;
  final bool preferMannequin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mannequin = Padding(
      padding: const EdgeInsets.all(12),
      child: MannequinView(
        outfit: look.toMannequin(),
        silhouette: ref.watch(silhouetteProvider),
        semanticsLabel: look.semantics,
      ),
    );
    final image = look.image;
    if (preferMannequin || image == null) return mannequin;
    return Image.network(
      image.thumbnailUrl ?? image.url,
      fit: BoxFit.cover,
      semanticLabel: image.altText,
      errorBuilder: (_, _, _) => mannequin,
      loadingBuilder: (context, child, progress) => progress == null ? child : mannequin,
    );
  }
}

String? creditFor(LookView look) {
  final image = look.image;
  if (image == null || !image.requiresCredit) return null;
  return image.attribution ?? image.sourceName;
}

List<({Color color, String name})> swatchesOf(LookView look) => [
      for (final p in look.pieces) (color: p.color.color, name: p.color.name),
    ];
