import '../../../l10n/l10n.dart';
import '../domain/outfit_composition.dart';

String roleLabel(AppLocalizations l10n, CompositionRole role) => switch (role) {
      CompositionRole.top => l10n.composeRoleTop,
      CompositionRole.bottom => l10n.composeRoleBottom,
      CompositionRole.onePiece => l10n.composeRoleOnePiece,
      CompositionRole.shoes => l10n.composeRoleShoes,
      CompositionRole.accessory => l10n.composeRoleAccessories,
    };

String pieceLabel(AppLocalizations l10n, ComposedPiece piece) =>
    l10n.pieceLabel(piece.type.name, piece.color.name.toLowerCase());

String compositionDescription(AppLocalizations l10n, OutfitComposition composition) {
  final pieces = composition.pieces;
  if (pieces.isEmpty) return l10n.mannequinEmpty;
  return l10n.mannequinSemantics(pieces.map((p) => pieceLabel(l10n, p)).join(', '));
}

String compositionStatus(AppLocalizations l10n, OutfitComposition composition) {
  final missing = composition.missingRequired;
  if (missing.isEmpty) return l10n.composeReady;
  return l10n.composeMissing(
    missing.map((r) => roleLabel(l10n, r).toLowerCase()).join(', '),
  );
}
