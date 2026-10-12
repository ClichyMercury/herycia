import '../../../../core/json/id_converter.dart';
import '../../../catalog/domain/catalog_models.dart';
import '../../../looks/domain/look_models.dart';
import '../recommendation_models.dart';
import 'catalog_index.dart';
import 'outfit_evaluator.dart';

class Improver {
  Improver(this.evaluator);

  final OutfitEvaluator evaluator;

  static const minGain = 3;

  List<Improvement> improve(
    List<EnginePiece> pieces, {
    Occasion? occasion,
    OutfitStyle? style,
    int limit = 5,
  }) {
    final current = evaluator.evaluate(pieces, occasion: occasion, style: style).score;
    final candidates = <({int piece, Improvement improvement})>[];
    for (var i = 0; i < pieces.length; i++) {
      final piece = pieces[i];
      for (final color in evaluator.index.colors) {
        if (color.id == piece.color.id) continue;
        final candidate = [...pieces]..[i] = piece.withColor(color);
        final score = evaluator.evaluate(candidate, occasion: occasion, style: style).score;
        final gain = score - current;
        if (gain < minGain) continue;
        candidates.add((
          piece: i,
          improvement: Improvement(
            role: piece.role,
            clothingTypeId: piece.type.id,
            fromColorId: piece.color.id,
            toColorId: color.id,
            newScore: score,
            gain: gain,
            explanation:
                '${piece.type.name} en ${color.name.toLowerCase()} plutôt qu\'en ${piece.color.name.toLowerCase()} : +$gain points.',
          ),
        ));
      }
    }
    candidates.sort((a, b) {
      final byGain = b.improvement.gain.compareTo(a.improvement.gain);
      if (byGain != 0) return byGain;
      final byPiece = a.piece.compareTo(b.piece);
      return byPiece != 0 ? byPiece : compareIds(a.improvement.toColorId, b.improvement.toColorId);
    });
    final usedPieces = <int>{};
    final usedColors = <String>{};
    final picked = <Improvement>[];
    for (final c in candidates) {
      if (picked.length >= limit) break;
      if (usedPieces.contains(c.piece) || usedColors.contains(c.improvement.toColorId)) continue;
      usedPieces.add(c.piece);
      usedColors.add(c.improvement.toColorId);
      picked.add(c.improvement);
    }
    return picked;
  }
}

class RecommendationOutcome {
  const RecommendationOutcome({required this.results, required this.broadened});

  final List<RecommendedLook> results;
  final List<BroadeningStep> broadened;
}

class Recommender {
  Recommender(this.evaluator);

  final OutfitEvaluator evaluator;

  CatalogIndex get index => evaluator.index;

  static const goodScore = 65;
  static const relaxedScore = 55;
  static const minResults = 3;
  static const maxAccessories = 4;

  RecommendationOutcome fromItem({
    required ClothingType anchorType,
    required CatalogColor anchorColor,
    required List<Look> looks,
    Occasion? occasion,
    OutfitStyle? style,
    int limit = 5,
  }) {
    final group = index.groupOf(anchorType.id)!;
    final anchor = EnginePiece(type: anchorType, color: anchorColor, role: roleForGroup(group));
    final published = looks.where((l) => l.status == LookStatus.published).toList()
      ..sort((a, b) => compareIds(a.id, b.id));

    final broadened = <BroadeningStep>[];
    var styleFilter = style;
    var occasionFilter = occasion;
    var threshold = goodScore;

    List<RecommendedLook> run() => _dedupe([
          for (final look in published)
            if ((styleFilter == null || look.styleId == styleFilter.id) &&
                (occasionFilter == null || look.occasionId == occasionFilter.id))
              ?_adapt(look, anchor, occasion: occasion, style: style),
        ]).where((r) => r.score >= threshold).toList();

    var results = run();
    if (results.length < minResults && styleFilter != null) {
      styleFilter = null;
      broadened.add(const BroadeningStep(
        criterion: BroadeningCriterion.style,
        message: 'En élargissant à tous les styles',
      ));
      results = run();
    }
    if (results.length < minResults && occasionFilter != null) {
      occasionFilter = null;
      broadened.add(const BroadeningStep(
        criterion: BroadeningCriterion.occasion,
        message: 'En élargissant à toutes les occasions',
      ));
      results = run();
    }
    if (results.length < minResults) {
      threshold = relaxedScore;
      broadened.add(const BroadeningStep(
        criterion: BroadeningCriterion.neighborShades,
        message: 'En acceptant des associations plus audacieuses',
      ));
      results = run();
    }
    if (results.length < minResults) {
      broadened.add(const BroadeningStep(
        criterion: BroadeningCriterion.neutralAdvice,
        message: 'Avec des propositions à base de neutres',
      ));
      results = _dedupe([...results, ..._neutralAdvice(anchor, occasion: occasion, style: style)]);
    }

    results.sort(_byScore);
    return RecommendationOutcome(results: results.take(limit).toList(), broadened: broadened);
  }

  static int _byScore(RecommendedLook a, RecommendedLook b) {
    final byScore = b.score.compareTo(a.score);
    if (byScore != 0) return byScore;
    if (a.outfitId != null && b.outfitId != null) return compareIds(a.outfitId!, b.outfitId!);
    if (a.outfitId != null) return -1;
    if (b.outfitId != null) return 1;
    return a.title.compareTo(b.title);
  }

  List<RecommendedLook> _dedupe(List<RecommendedLook> looks) {
    final best = <String, RecommendedLook>{};
    for (final look in looks) {
      final key = ([
        for (final i in look.items)
          if (i.role != PieceRole.accessory) '${i.clothingTypeId}:${i.colorId}',
      ]..sort())
          .join('|');
      final existing = best[key];
      if (existing == null || _byScore(look, existing) < 0) best[key] = look;
    }
    return best.values.toList();
  }

  List<EnginePiece>? _piecesOf(Look look) {
    final pieces = <EnginePiece>[];
    for (final item in look.items) {
      final type = index.typesById[item.clothingTypeId];
      final color = index.colorsById[item.colorId];
      if (type == null || color == null) return null;
      pieces.add(EnginePiece(type: type, color: color, role: item.role));
    }
    return pieces;
  }

  RecommendedLook? _adapt(Look look, EnginePiece anchor, {Occasion? occasion, OutfitStyle? style}) {
    final original = _piecesOf(look);
    if (original == null) return null;
    final roles = {for (final p in original) p.role};

    final List<EnginePiece> pieces;
    switch (anchor.role) {
      case PieceRole.onePiece:
        if (!roles.contains(PieceRole.onePiece)) return null;
        pieces = [for (final p in original) p.role == PieceRole.onePiece ? anchor : p];
      case PieceRole.top || PieceRole.bottom:
        if (roles.contains(PieceRole.onePiece) || !roles.contains(anchor.role)) return null;
        pieces = [for (final p in original) p.role == anchor.role ? anchor : p];
      case PieceRole.shoes:
        if (!roles.contains(PieceRole.shoes)) return null;
        pieces = [for (final p in original) p.role == PieceRole.shoes ? anchor : p];
      case PieceRole.accessory:
        final sameType = original.indexWhere((p) => p.type.id == anchor.type.id);
        if (sameType >= 0) {
          pieces = [...original]..[sameType] = anchor;
        } else if (original.where((p) => p.isAccessory).length < maxAccessories) {
          pieces = [...original, anchor];
        } else {
          return null;
        }
    }

    final evaluation = evaluator.evaluate(pieces, occasion: occasion, style: style);
    if (evaluation.hasStructuralIssue) return null;
    final unchanged = original.any((p) => p.signature == anchor.signature);
    final image = look.primaryImage;

    return RecommendedLook(
      outfitId: look.id,
      title: unchanged ? look.title : 'Inspiré de « ${look.title} »',
      score: evaluation.score,
      breakdown: evaluation.breakdown,
      explanation: _anchorExplanation(anchor, pieces) ?? evaluation.explanation,
      items: [
        for (final p in pieces)
          RecommendedItem(
            clothingTypeId: p.type.id,
            colorId: p.color.id,
            role: p.role,
            isAnchor: identical(p, anchor),
          ),
      ],
      image: unchanged && image != null && image.usageApproved ? image : null,
    );
  }

  String? _anchorExplanation(EnginePiece anchor, List<EnginePiece> pieces) {
    ColorPairingRule? best;
    for (final p in pieces) {
      if (identical(p, anchor) || p.isAccessory || p.color.id == anchor.color.id) continue;
      final rule = index.pairRule(anchor.color.id, p.color.id);
      if (rule != null && (best == null || rule.compatibilityScore > best.compatibilityScore)) {
        best = rule;
      }
    }
    return best?.explanation;
  }

  List<RecommendedLook> _neutralAdvice(
    EnginePiece anchor, {
    Occasion? occasion,
    OutfitStyle? style,
  }) {
    const palettes = [
      ['navy', 'white', 'white'],
      ['black', 'off-white', 'black'],
      ['beige', 'white', 'camel'],
    ];
    const slugs = {
      PieceRole.top: 'shirt',
      PieceRole.bottom: 'trousers',
      PieceRole.shoes: 'sneakers',
    };
    final results = <RecommendedLook>[];
    for (final palette in palettes) {
      final colorFor = {
        PieceRole.bottom: index.colorBySlug(palette[0]),
        PieceRole.top: index.colorBySlug(palette[1]),
        PieceRole.shoes: index.colorBySlug(palette[2]),
      };
      final needed = switch (anchor.role) {
        PieceRole.onePiece => const [PieceRole.shoes],
        PieceRole.top => const [PieceRole.bottom, PieceRole.shoes],
        PieceRole.bottom => const [PieceRole.top, PieceRole.shoes],
        PieceRole.shoes => const [PieceRole.top, PieceRole.bottom],
        PieceRole.accessory => const [PieceRole.top, PieceRole.bottom, PieceRole.shoes],
      };
      final pieces = <EnginePiece>[anchor];
      for (final role in needed) {
        final type = index.typeBySlug(slugs[role]!) ??
            index.firstTypeOf(switch (role) {
              PieceRole.top => CategoryGroup.top,
              PieceRole.bottom => CategoryGroup.bottom,
              _ => CategoryGroup.shoes,
            });
        final color = colorFor[role];
        if (type == null || color == null) continue;
        pieces.add(EnginePiece(type: type, color: color, role: role));
      }
      final evaluation = evaluator.evaluate(pieces, occasion: occasion, style: style);
      results.add(RecommendedLook(
        title: 'Base neutre : ${palette.map((s) => index.colorBySlug(s)?.name.toLowerCase()).toSet().join(', ')}',
        score: evaluation.score,
        breakdown: evaluation.breakdown,
        explanation:
            'Une base neutre laisse toute la place à votre ${anchor.type.name.toLowerCase()} ${anchor.color.name.toLowerCase()}.',
        items: [
          for (final p in pieces)
            RecommendedItem(
              clothingTypeId: p.type.id,
              colorId: p.color.id,
              role: p.role,
              isAnchor: identical(p, anchor),
            ),
        ],
      ));
    }
    return results;
  }
}
