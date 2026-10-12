import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../design_system.dart';

class DesignSystemGallery extends StatefulWidget {
  const DesignSystemGallery({super.key});

  @override
  State<DesignSystemGallery> createState() => _DesignSystemGalleryState();
}

class _DesignSystemGalleryState extends State<DesignSystemGallery> {
  final Set<String> _chips = {'Travail'};
  String _swatch = 'Bleu marine';
  bool _loading = false;
  bool _onePiece = false;

  static const _demoColors = [
    (name: 'Noir', color: Color(0xFF111111)),
    (name: 'Blanc', color: Color(0xFFFFFFFF)),
    (name: 'Beige', color: Color(0xFFD9C3A5)),
    (name: 'Bleu marine', color: Color(0xFF1F2A44)),
    (name: 'Bordeaux', color: Color(0xFF6D1A2B)),
    (name: 'Jaune pâle', color: Color(0xFFF6E7A1)),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typo = context.typo;

    Widget section(String title, List<Widget> children) => Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.betweenSections),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppSpacing.screenPadding,
                child: Text(title.toUpperCase(), style: typo.overline.copyWith(color: colors.textTertiary)),
              ),
              const SizedBox(height: AppSpacing.titleToContent),
              ...children,
            ],
          ),
        );

    Widget padded(Widget child) => Padding(padding: AppSpacing.screenPadding, child: child);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.galleryTitle)),
      body: ListView(
        children: [
          section('Typographie', [
            padded(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final (name, style) in [
                  ('display', typo.display),
                  ('title1', typo.title1),
                  ('title2', typo.title2),
                  ('title3', typo.title3),
                  ('body', typo.body),
                  ('label', typo.label),
                  ('caption', typo.caption),
                ])
                  Text(name, style: style.copyWith(color: colors.textPrimary)),
                Text('82', style: typo.numeric.copyWith(color: colors.textPrimary)),
              ],
            )),
          ]),
          section('Boutons', [
            padded(Column(
              children: [
                AppButton(
                  label: 'Voir les tenues',
                  isLoading: _loading,
                  onPressed: () async {
                    setState(() => _loading = true);
                    await Future<void>.delayed(const Duration(seconds: 2));
                    if (mounted) setState(() => _loading = false);
                  },
                ),
                const SizedBox(height: AppSpacing.s3),
                AppButton(label: 'Modifier les filtres', variant: AppButtonVariant.secondary, onPressed: () {}),
                AppButton(label: 'Plus tard', variant: AppButtonVariant.ghost, onPressed: () {}),
                const SizedBox(height: AppSpacing.s3),
                Wrap(
                  spacing: AppSpacing.s2,
                  runSpacing: AppSpacing.s2,
                  children: [
                    AppButton(label: 'Supprimer', variant: AppButtonVariant.danger, size: AppButtonSize.md, onPressed: () {}),
                    AppButton(label: 'Partager', variant: AppButtonVariant.onAccent, size: AppButtonSize.md, onPressed: () {}),
                    const AppButton(label: 'Désactivé', size: AppButtonSize.sm, onPressed: null),
                  ],
                ),
              ],
            )),
          ]),
          section('Pastilles', [
            SizedBox(
              height: AppColorSwatch.extentFor(context, SwatchSize.lg),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: AppSpacing.screenPadding,
                children: [
                  for (final c in _demoColors)
                    Padding(
                      padding: const EdgeInsets.only(right: AppSpacing.gridGutter),
                      child: AppColorSwatch(
                        color: c.color,
                        name: c.name,
                        size: SwatchSize.lg,
                        selected: _swatch == c.name,
                        onTap: () => setState(() => _swatch = c.name),
                      ),
                    ),
                ],
              ),
            ),
            padded(SwatchRow(swatches: [for (final c in _demoColors) (color: c.color, name: c.name)])),
          ]),
          section('Puces', [
            ChipRow(children: [
              for (final label in ['Quotidien', 'Travail', 'Sortie', 'Cérémonie', 'Soirée'])
                AppChip(
                  label: label,
                  selected: _chips.contains(label),
                  onTap: () => setState(
                    () => _chips.contains(label) ? _chips.remove(label) : _chips.add(label),
                  ),
                ),
            ]),
          ]),
          section('Loader', [
            padded(const Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HeryciaLoader(size: LoaderSize.lg),
                SizedBox(width: AppSpacing.s6),
                HeryciaLoader(),
                SizedBox(width: AppSpacing.s6),
                HeryciaLoader(size: LoaderSize.sm),
              ],
            )),
          ]),
          section('Score', [
            padded(Wrap(
              spacing: AppSpacing.s6,
              runSpacing: AppSpacing.s4,
              children: [
                ScoreRing(score: 82, onExplain: () {}),
                const ScoreRing(score: 64),
                const ScoreRing(score: 38),
              ],
            )),
          ]),
          section('Emplacements de pièce', [
            padded(Column(
              children: [
                PieceSlot(
                  roleLabel: 'Haut',
                  state: _onePiece
                      ? const PieceSlotReplaced(replacedBy: 'la robe')
                      : const PieceSlotFilled(typeName: 'Chemise', colorName: 'Bleu ciel', color: Color(0xFF9CC7E8)),
                  onTap: () {},
                ),
                const SizedBox(height: AppSpacing.s3),
                PieceSlot(
                  roleLabel: 'Bas',
                  state: _onePiece ? const PieceSlotReplaced(replacedBy: 'la robe') : const PieceSlotEmpty(),
                  onTap: () {},
                ),
                const SizedBox(height: AppSpacing.s3),
                PieceSlot(roleLabel: 'Accessoires', state: const PieceSlotEmpty(), isOptional: true, onTap: () {}),
                AppButton(
                  label: _onePiece ? 'Retirer la robe' : 'Choisir une robe',
                  variant: AppButtonVariant.ghost,
                  size: AppButtonSize.sm,
                  onPressed: () => setState(() => _onePiece = !_onePiece),
                ),
              ],
            )),
          ]),
          section('Champs', [
            padded(const Column(
              children: [
                AppTextField(label: 'Adresse e-mail', hint: 'vous@exemple.fr'),
                SizedBox(height: AppSpacing.s4),
                AppTextField(label: 'Mot de passe', obscure: true, errorText: 'Utilisez au moins 8 caractères'),
              ],
            )),
          ]),
          section('Badges', [
            padded(const Wrap(
              spacing: AppSpacing.s2,
              children: [
                AppBadge(label: 'Neutre'),
                AppBadge(label: 'Styliste', variant: AppBadgeVariant.brand),
                AppBadge(label: 'Nouveau', variant: AppBadgeVariant.sun),
                AppBadge(label: 'Validé', variant: AppBadgeVariant.fresh),
              ],
            )),
          ]),
          section('États', [
            const OfflineBanner(),
            ContentState.empty(
              title: 'Aucune tenue avec ces filtres',
              message: "Essayez sans filtrer l'occasion",
              actionLabel: 'Élargir la recherche',
              onAction: () {},
            ),
            ErrorState(onRetry: () {}),
            const Padding(
              padding: AppSpacing.screenPadding,
              child: Skeleton(height: 120),
            ),
            const SizedBox(height: AppSpacing.s4),
            padded(AppButton(
              label: 'Afficher un toast',
              variant: AppButtonVariant.secondary,
              onPressed: () => showAppToast(
                context,
                message: 'Favori supprimé',
                actionLabel: 'Annuler',
                onAction: () {},
              ),
            )),
          ]),
        ],
      ),
    );
  }
}
