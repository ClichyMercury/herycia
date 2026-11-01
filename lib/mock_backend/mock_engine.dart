import 'mock_fixtures.dart';

class EnginePiece {
  const EnginePiece({required this.type, required this.color, required this.role, this.isRequired = true});

  final Json type;
  final Json color;
  final String role;
  final bool isRequired;

  String get typeId => type['id'] as String;

  String get colorId => color['id'] as String;

  Json get typeRef => {'id': type['id'], 'slug': type['slug'], 'name': type['name']};

  Json get colorRef => {'id': color['id'], 'slug': color['slug'], 'name': color['name'], 'hex_code': color['hex_code']};

  Json get requestItem => {'clothing_type_id': typeId, 'color_id': colorId, 'role': role};

  EnginePiece withColor(Json other) => EnginePiece(type: type, color: other, role: role, isRequired: isRequired);
}

class Scored {
  const Scored(this.score, this.breakdown);

  final int score;
  final Json breakdown;
}

class MockEngine {
  MockEngine(this.fixtures)
      : typesById = {for (final t in fixtures.types) t['id'] as String: t},
        colorsById = {for (final c in fixtures.colors) c['id'] as String: c},
        _groupByCategory = {for (final c in fixtures.categories) c['id'] as String: c['group_type'] as String} {
    for (final h in (fixtures.colorGuide['harmonies'] as List<dynamic>).cast<Json>()) {
      for (final kind in ['harmonious', 'contrast', 'neutral_pairing', 'caution']) {
        for (final p in (h[kind] as List<dynamic>).cast<Json>()) {
          _pairs[_key(h['color_id'] as String, p['color_id'] as String)] = p['score'] as int;
        }
      }
    }
  }

  final MockFixtures fixtures;
  final Map<String, Json> typesById;
  final Map<String, Json> colorsById;
  final Map<String, String> _groupByCategory;
  final Map<String, int> _pairs = {};

  static const _max = {'color': 40, 'structure': 25, 'occasion': 15, 'style': 10, 'completeness': 10};

  static String _key(String a, String b) => a.compareTo(b) < 0 ? '$a|$b' : '$b|$a';

  String groupOf(String typeId) => _groupByCategory[typesById[typeId]?['category_id']] ?? 'accessory';

  int pairScore(Json a, Json b) {
    if (a['id'] == b['id']) return 70;
    final known = _pairs[_key(a['id'] as String, b['id'] as String)];
    if (known != null) return known;
    if (a['is_neutral'] == true || b['is_neutral'] == true) return 78;
    if (a['color_family'] == b['color_family']) return 72;
    return 55;
  }

  Set<String> _typesIn({String? occasion, String? style}) => {
        for (final o in fixtures.outfits)
          if ((occasion == null || (o['occasion'] as Json?)?['slug'] == occasion) &&
              (style == null || (o['style'] as Json?)?['slug'] == style))
            for (final i in (o['items'] as List<dynamic>).cast<Json>()) (i['clothing_type'] as Json)['id'] as String,
      };

  List<String> structuralIssues(List<EnginePiece> pieces) {
    final roles = [for (final p in pieces) p.role];
    final onePiece = roles.contains('one_piece');
    return [
      if (!onePiece && !roles.contains('top')) 'top',
      if (!onePiece && !roles.contains('bottom')) 'bottom',
      if (!roles.contains('footwear')) 'footwear',
      if (onePiece && (roles.contains('top') || roles.contains('bottom'))) 'contradiction',
      for (final role in ['top', 'bottom', 'one_piece', 'footwear', 'outerwear'])
        if (roles.where((r) => r == role).length > 1) 'duplicate:$role',
    ];
  }

  Scored score(List<EnginePiece> pieces, {String? occasion, String? style}) {
    final main = pieces.where((p) => p.role != 'accessory').toList();
    final pairs = <int>[
      for (var i = 0; i < main.length; i++)
        for (var j = i + 1; j < main.length; j++) pairScore(main[i].color, main[j].color),
    ];
    final colorAvg = pairs.isEmpty ? 70 : pairs.reduce((a, b) => a + b) / pairs.length;
    final issues = structuralIssues(pieces);
    final structure = (25 - issues.length * 8).clamp(0, 25);
    int share(Set<String> allowed, int max) =>
        pieces.isEmpty ? 0 : (max * pieces.where((p) => allowed.contains(p.typeId)).length / pieces.length).round();
    final occasionPoints = occasion == null ? 15 : share(_typesIn(occasion: occasion), 15);
    final stylePoints = style == null ? 10 : share(_typesIn(style: style), 10);
    final accessories = pieces.where((p) => p.role == 'accessory').length.clamp(0, 2);
    final completeness = (issues.any((i) => !i.startsWith('duplicate') && i != 'contradiction') ? 4 : 6) + accessories * 2;
    final points = {
      'color': (40 * colorAvg / 100).round().clamp(0, 40),
      'structure': structure,
      'occasion': occasionPoints,
      'style': stylePoints,
      'completeness': completeness.clamp(0, 10),
    };
    return Scored(
      points.values.reduce((a, b) => a + b),
      {for (final e in points.entries) e.key: {'points': e.value, 'max': _max[e.key]}},
    );
  }

  List<EnginePiece> piecesOfOutfit(Json outfit) => [
        for (final i in (outfit['items'] as List<dynamic>).cast<Json>())
          if (typesById[(i['clothing_type'] as Json)['id']] case final type?)
            if (colorsById[(i['color'] as Json)['id']] case final color?)
              EnginePiece(type: type, color: color, role: i['role'] as String, isRequired: i['is_required'] as bool),
      ];

  List<EnginePiece>? adapt(List<EnginePiece> look, EnginePiece anchor) {
    final hasOnePiece = look.any((p) => p.role == 'one_piece');
    if (anchor.role == 'one_piece') {
      return [anchor, ...look.where((p) => !{'top', 'bottom', 'one_piece'}.contains(p.role))];
    }
    if (hasOnePiece && (anchor.role == 'top' || anchor.role == 'bottom')) return null;
    final index = look.indexWhere((p) => p.role == anchor.role);
    if (index < 0) return [anchor, ...look];
    return [...look]..[index] = anchor;
  }

  Json? bestColorFor(EnginePiece piece, List<EnginePiece> others) {
    Json? best;
    var bestScore = -1;
    for (final c in fixtures.colors) {
      final s = others.isEmpty ? 0 : others.map((o) => pairScore(c, o.color)).reduce((a, b) => a + b);
      if (s > bestScore) {
        bestScore = s;
        best = c;
      }
    }
    return best;
  }

  Json? defaultTypeFor(String group) =>
      fixtures.types.where((t) => groupOf(t['id'] as String) == group).firstOrNull;
}
