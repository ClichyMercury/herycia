import 'dart:math' as math;

import '../../../catalog/domain/catalog_models.dart';
import '../../../looks/domain/look_models.dart';
import '../recommendation_models.dart';
import 'catalog_index.dart';

class EnginePiece {
  const EnginePiece({required this.type, required this.color, required this.role});

  final ClothingType type;
  final CatalogColor color;
  final PieceRole role;

  bool get isAccessory => role == PieceRole.accessory;

  EnginePiece withColor(CatalogColor newColor) =>
      EnginePiece(type: type, color: newColor, role: role);

  String get signature => '${role.name}:${type.id}:${color.id}';
}

class EvaluationResult {
  const EvaluationResult({
    required this.breakdown,
    required this.explanation,
    required this.strengths,
    required this.warnings,
  });

  final ScoreBreakdown breakdown;
  final String explanation;
  final List<String> strengths;
  final List<Remark> warnings;

  int get score => breakdown.total;

  bool get hasStructuralIssue => warnings.any((w) => w.kind == RemarkKind.structural);
}

class OutfitEvaluator {
  OutfitEvaluator(this.index);

  final CatalogIndex index;

  static const sameColorScore = 0.78;
  static const unknownPairScore = 0.6;
  static const weakPairThreshold = 0.6;
  static const strongPairThreshold = 0.85;

  EvaluationResult evaluate(
    List<EnginePiece> pieces, {
    Occasion? occasion,
    OutfitStyle? style,
  }) {
    final warnings = <Remark>[];
    final strengths = <String>[];

    final structure = _structure(pieces, warnings);
    final structuralRatio = structure / ScoreBreakdown.maxStructure;
    final color = _color(pieces, warnings, strengths);
    final pairStrength = strengths.lastOrNull;
    final occasionPoints = _contextual(
      pieces,
      RecommendationRuleType.typeOccasion,
      'occasion_slug',
      occasion?.slug,
      ScoreBreakdown.maxOccasion,
      'occasion_mismatch',
      warnings,
    );
    final stylePoints = _contextual(
      pieces,
      RecommendationRuleType.typeStyle,
      'style_slug',
      style?.slug,
      ScoreBreakdown.maxStyle,
      'style_mismatch',
      warnings,
    );
    if (occasion != null && occasionPoints == ScoreBreakdown.maxOccasion && pieces.isNotEmpty) {
      strengths.add('Une tenue cohérente pour : ${occasion.name.toLowerCase()}.');
    }

    return EvaluationResult(
      breakdown: ScoreBreakdown(
        color: color,
        structure: structure,
        occasion: (occasionPoints * structuralRatio).round(),
        style: (stylePoints * structuralRatio).round(),
        completeness: _completeness(pieces),
      ),
      explanation: _explanation(pieces, pairStrength, warnings),
      strengths: strengths,
      warnings: warnings,
    );
  }

  int _structure(List<EnginePiece> pieces, List<Remark> warnings) {
    int count(PieceRole role) => pieces.where((p) => p.role == role).length;
    final hasOnePiece = count(PieceRole.onePiece) > 0;
    var points = ScoreBreakdown.maxStructure.toDouble();

    void remark(String code, String message, List<PieceRole> roles, double penalty) {
      warnings.add(Remark(kind: RemarkKind.structural, code: code, message: message, roles: roles));
      points -= penalty;
    }

    if (hasOnePiece && (count(PieceRole.top) > 0 || count(PieceRole.bottom) > 0)) {
      remark(
        'one_piece_conflict',
        'Une robe ou une combinaison remplace déjà le haut et le bas.',
        const [PieceRole.onePiece, PieceRole.top, PieceRole.bottom],
        10,
      );
    }
    if (!hasOnePiece && count(PieceRole.top) == 0) {
      remark('missing_top', 'Il manque un haut.', const [PieceRole.top], 8);
    }
    if (!hasOnePiece && count(PieceRole.bottom) == 0) {
      remark('missing_bottom', 'Il manque un bas.', const [PieceRole.bottom], 8);
    }
    if (count(PieceRole.shoes) == 0) {
      remark('missing_shoes', 'Il manque des chaussures.', const [PieceRole.shoes], 8);
    }
    for (final role in const [PieceRole.top, PieceRole.bottom, PieceRole.onePiece, PieceRole.shoes]) {
      if (count(role) > 1) {
        remark('duplicate_role', 'Deux pièces occupent la même place dans la tenue.', [role], 6);
      }
    }
    final accessoryTypes = <String>{};
    for (final p in pieces.where((p) => p.isAccessory)) {
      if (!accessoryTypes.add(p.type.id)) {
        remark('duplicate_accessory', 'Le même accessoire apparaît deux fois.', const [PieceRole.accessory], 3);
      }
    }
    return points.clamp(0, ScoreBreakdown.maxStructure.toDouble()).round();
  }

  double _pairScore(EnginePiece a, EnginePiece b) {
    if (a.color.id == b.color.id) return sameColorScore;
    return index.pairRule(a.color.id, b.color.id)?.compatibilityScore ?? unknownPairScore;
  }

  int _color(List<EnginePiece> pieces, List<Remark> warnings, List<String> strengths) {
    if (pieces.length < 2) return (ScoreBreakdown.maxColor / 2).round();

    var weighted = 0.0;
    var weights = 0.0;
    ColorPairingRule? best;
    ColorPairingRule? worst;
    for (var i = 0; i < pieces.length; i++) {
      for (var j = i + 1; j < pieces.length; j++) {
        final a = pieces[i];
        final b = pieces[j];
        final weight = switch ((a.isAccessory, b.isAccessory)) {
          (false, false) => 1.0,
          (true, true) => 0.25,
          _ => 0.5,
        };
        weighted += _pairScore(a, b) * weight;
        weights += weight;
        if (!a.isAccessory && !b.isAccessory && a.color.id != b.color.id) {
          final rule = index.pairRule(a.color.id, b.color.id);
          if (rule != null) {
            if (best == null || rule.compatibilityScore > best.compatibilityScore) best = rule;
            if (worst == null || rule.compatibilityScore < worst.compatibilityScore) worst = rule;
          }
        }
      }
    }
    var ratio = weighted / weights;

    final vivid = {
      for (final p in pieces)
        if (!p.color.isNeutral) p.color.colorFamily,
    };
    if (vivid.length > 2) ratio -= 0.08 * (vivid.length - 2);
    if (vivid.length > 3) {
      warnings.add(const Remark(
        kind: RemarkKind.style,
        code: 'many_accents',
        message: "Plus de trois couleurs vives : un neutre apaiserait l'ensemble.",
      ));
    }

    final main = pieces.where((p) => !p.isAccessory).toList();
    final distinct = {for (final p in main) p.color.id};
    if (main.length > 1 && distinct.length > 1) {
      final values = [for (final p in main) p.color.brightness ?? 0.5];
      if (values.reduce(math.max) - values.reduce(math.min) < 0.12) {
        warnings.add(const Remark(
          kind: RemarkKind.style,
          code: 'low_contrast',
          message: 'Contraste très faible : une pièce plus claire ou plus foncée donnerait du relief.',
        ));
      }
    }
    if (main.isNotEmpty && main.every((p) => p.color.isNeutral)) {
      strengths.add('Une base entièrement neutre, facile à accessoiriser.');
    }
    if (best != null && best.compatibilityScore >= strongPairThreshold) {
      strengths.add(best.explanation);
    }
    if (worst != null && worst.compatibilityScore < weakPairThreshold && worst != best) {
      warnings.add(Remark(kind: RemarkKind.style, code: 'bold_pair', message: worst.explanation));
    }

    return (ScoreBreakdown.maxColor * ratio.clamp(0.0, 1.0)).round();
  }

  int _contextual(
    List<EnginePiece> pieces,
    RecommendationRuleType type,
    String conditionKey,
    String? slug,
    int max,
    String code,
    List<Remark> warnings,
  ) {
    if (slug == null) return max;
    var suitability = 1.0;
    final typeSlugs = {for (final p in pieces) p.type.slug};
    for (final rule in index.recommendationRules) {
      if (rule.ruleType != type || rule.conditionsJson[conditionKey] != slug) continue;
      if (!typeSlugs.contains(rule.conditionsJson['type_slug'])) continue;
      suitability += rule.weight;
      warnings.add(Remark(kind: RemarkKind.style, code: code, message: rule.explanation));
    }
    return (max * suitability.clamp(0.0, 1.0)).round();
  }

  int _completeness(List<EnginePiece> pieces) {
    final roles = {for (final p in pieces) p.role};
    final required = roles.contains(PieceRole.onePiece)
        ? const [PieceRole.onePiece, PieceRole.shoes]
        : const [PieceRole.top, PieceRole.bottom, PieceRole.shoes];
    final filled = required.where(roles.contains).length;
    final base = 8 * filled / required.length;
    return (base + (roles.contains(PieceRole.accessory) ? 2 : 0)).round();
  }

  String _explanation(List<EnginePiece> pieces, String? pairStrength, List<Remark> warnings) {
    if (pieces.length < 2) return 'Ajoutez des pièces pour obtenir une évaluation complète.';
    final structural = warnings.where((w) => w.kind == RemarkKind.structural);
    if (structural.isNotEmpty) return structural.first.message;
    if (pairStrength != null) return pairStrength;
    final main = pieces.where((p) => !p.isAccessory).toList();
    if (main.length >= 2) {
      final rule = index.pairRule(main[0].color.id, main[1].color.id);
      if (rule != null) return rule.explanation;
    }
    return 'Une association à tester, selon vos envies.';
  }
}
