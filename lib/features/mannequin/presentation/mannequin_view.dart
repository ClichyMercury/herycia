import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../application/silhouette_provider.dart';
import '../domain/body_silhouette.dart';
import '../domain/mannequin_outfit.dart';
import 'mannequin_painter.dart';

class MannequinView extends ImplicitlyAnimatedWidget {
  MannequinView({
    super.key,
    required this.outfit,
    required this.silhouette,
    required this.semanticsLabel,
  }) : super(duration: AppMotion.base.duration, curve: AppMotion.base.curve);

  final MannequinOutfit outfit;
  final BodySilhouette silhouette;
  final String semanticsLabel;

  @override
  AnimatedWidgetBaseState<MannequinView> createState() => _MannequinViewState();
}

class _MannequinOutfitTween extends Tween<MannequinOutfit> {
  _MannequinOutfitTween({super.begin});

  @override
  MannequinOutfit lerp(double t) => MannequinOutfit.lerp(begin!, end!, t);
}

class _MannequinViewState extends AnimatedWidgetBaseState<MannequinView> {
  _MannequinOutfitTween? _outfit;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _outfit = visitor(
      _outfit,
      widget.outfit,
      (value) => _MannequinOutfitTween(begin: value as MannequinOutfit),
    ) as _MannequinOutfitTween?;
  }

  @override
  void didUpdateWidget(MannequinView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (MediaQuery.maybeDisableAnimationsOf(context) ?? false) {
      controller.value = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Semantics(
      image: true,
      label: widget.semanticsLabel,
      child: CustomPaint(
        painter: MannequinPainter(
          silhouette: widget.silhouette,
          outfit: _outfit?.evaluate(animation) ?? widget.outfit,
          bodyColor: colors.mannequinBody,
          outlineColor: colors.mannequinOutline,
        ),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class MannequinPreview extends ConsumerWidget {
  const MannequinPreview({
    super.key,
    required this.outfit,
    required this.semanticsLabel,
    this.height = 300,
    this.showSilhouettePicker = true,
  });

  final MannequinOutfit outfit;
  final String semanticsLabel;
  final double height;
  final bool showSilhouettePicker;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final silhouette = ref.watch(silhouetteProvider);
    final colors = context.colors;
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: colors.border),
      ),
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.s4),
      child: Column(
        children: [
          SizedBox(
            height: height,
            child: MannequinView(
              outfit: outfit,
              silhouette: silhouette,
              semanticsLabel: semanticsLabel,
            ),
          ),
          if (showSilhouettePicker) ...[
            const SizedBox(height: AppSpacing.s3),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s4),
              child: Row(
                children: [
                  for (final s in BodySilhouette.values) ...[
                    if (s != BodySilhouette.values.first) const SizedBox(width: AppSpacing.s2),
                    AppChip(
                      key: ValueKey('silhouette-${s.name}'),
                      label: silhouetteLabel(context.l10n, s),
                      selected: s == silhouette,
                      onTap: () => ref.read(silhouetteProvider.notifier).select(s),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

String silhouetteLabel(AppLocalizations l10n, BodySilhouette silhouette) => switch (silhouette) {
      BodySilhouette.straight => l10n.silhouetteStraight,
      BodySilhouette.hourglass => l10n.silhouetteHourglass,
      BodySilhouette.broad => l10n.silhouetteBroad,
    };
