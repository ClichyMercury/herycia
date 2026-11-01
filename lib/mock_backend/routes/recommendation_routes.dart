part of '../mock_backend.dart';

extension _RecommendationRoutes on MockBackend {
  List<MockRoute> get _recommendationRoutes => [
        MockRoute('POST', '/recommendations/from-item', _fromItem),
        MockRoute('POST', '/recommendations/evaluate-outfit', _evaluate),
        MockRoute('POST', '/recommendations/improve-outfit', _improve),
        MockRoute('POST', '/recommendations/{requestId}/feedback', _feedback),
      ];

  int get _catalogVersion => fixtures.version['catalog_version'] as int;

  int get _rulesVersion => fixtures.version['rules_version'] as int;

  String _requestId(MockRequest request) => 'rq1.mock.${nextUuid()}.${optionalUser(request)?.id ?? 'guest'}';

  void _validateSlugs(Validator v, Json body) {
    final occasion = body['occasion_slug'];
    if (occasion != null && !fixtures.occasions.any((o) => o['slug'] == occasion)) {
      v.add('occasion_slug', "L'occasion sélectionnée n'est pas disponible.");
    }
    final style = body['style_slug'];
    if (style != null && !fixtures.styles.any((s) => s['slug'] == style)) {
      v.add('style_slug', "Le style sélectionné n'est pas disponible.");
    }
  }

  List<EnginePiece> _requestPieces(Validator v, Json body) {
    final items = body['items'];
    if (items is! List || items.isEmpty || items.length > 10) {
      v.add('items', 'La tenue doit contenir de 1 à 10 pièces.');
      return const [];
    }
    const roles = {'top', 'bottom', 'one_piece', 'footwear', 'accessory', 'outerwear'};
    final pieces = <EnginePiece>[];
    for (final (i, raw) in items.indexed) {
      final item = raw is Json ? raw : const <String, dynamic>{};
      final type = engine.typesById[item['clothing_type_id']];
      final color = engine.colorsById[item['color_id']];
      if (type == null) v.add('items.$i.clothing_type_id', "Le type de vêtement sélectionné n'est pas disponible.");
      if (color == null) v.add('items.$i.color_id', "La couleur sélectionnée n'est pas disponible.");
      if (!roles.contains(item['role'])) v.add('items.$i.role', "Le rôle de la pièce n'est pas valide.");
      if (type != null && color != null && roles.contains(item['role'])) {
        pieces.add(EnginePiece(type: type, color: color, role: item['role'] as String));
      }
    }
    return pieces;
  }

  MockResponse _fromItem(MockRequest request, Map<String, String> _) {
    final body = request.bodyMap;
    final v = Validator();
    final type = engine.typesById[body['clothing_type_id']];
    final color = engine.colorsById[body['color_id']];
    if (type == null) v.add('clothing_type_id', "Le type de vêtement sélectionné n'est pas disponible.");
    if (color == null) v.add('color_id', "La couleur sélectionnée n'est pas disponible.");
    final limit = body['limit'] ?? 5;
    if (limit is! int || limit < 1 || limit > 5) v.add('limit', 'La limite doit être comprise entre 1 et 5.');
    _validateSlugs(v, body);
    v.throwIfInvalid();
    final anchor = EnginePiece(type: type!, color: color!, role: engine.groupOf(type['id'] as String));
    String? occasion = body['occasion_slug'] as String?;
    String? style = body['style_slug'] as String?;
    final steps = <String>[];

    List<Json> run() {
      final results = <(int, Json)>[];
      for (final outfit in fixtures.outfits) {
        if (occasion != null && (outfit['occasion'] as Json?)?['slug'] != occasion) continue;
        if (style != null && (outfit['style'] as Json?)?['slug'] != style) continue;
        final adapted = engine.adapt(engine.piecesOfOutfit(outfit), anchor);
        if (adapted == null) continue;
        final scored = engine.score(adapted, occasion: occasion, style: style);
        if (scored.score < 60) continue;
        results.add((
          scored.score,
          {
            'outfit_id': outfit['id'],
            'title': outfit['title'],
            'score': scored.score,
            'score_breakdown': scored.breakdown,
            'explanation': 'Le ${(anchor.color['name'] as String).toLowerCase()} s’accorde avec les autres pièces de ce look.',
            'items': [
              for (final p in adapted)
                {
                  'clothing_type': p.typeRef,
                  'color': p.colorRef,
                  'role': p.role,
                  'is_required': p.isRequired,
                  'is_starting_item': identical(p, anchor),
                },
            ],
            'image': outfit['image'],
          },
        ));
      }
      results.sort((a, b) => b.$1.compareTo(a.$1));
      return [for (final r in results.take(limit as int)) r.$2];
    }

    var results = run();
    final wanted = (limit as int) < 3 ? limit : 3;
    if (results.length < wanted && style != null) {
      style = null;
      steps.add('style');
      results = run();
    }
    if (results.length < wanted && occasion != null) {
      occasion = null;
      steps.add('occasion');
      results = run();
    }
    final advice = <Json>[];
    if (results.isEmpty) {
      steps.add('neutral_advice');
      final partners = [
        for (final c in fixtures.colors)
          if (c['is_neutral'] == true && c['id'] != anchor.colorId) c['id'],
      ].take(3).toList();
      advice.add({'text': 'Associez cette pièce à des neutres pour une tenue facile à porter.', 'color_ids': partners});
    }
    return MockResponse.ok({
      'data': {
        'request_id': _requestId(request),
        'catalog_version': _catalogVersion,
        'rules_version': _rulesVersion,
        'starting_item': {'clothing_type': anchor.typeRef, 'color': anchor.colorRef, 'role': anchor.role},
        'filters': {'occasion_slug': occasion, 'style_slug': style},
        'broadened': {'applied': steps.isNotEmpty, 'steps': steps},
        'results': results,
        'advice': advice,
      },
    });
  }

  ({List<EnginePiece> pieces, String? occasion, String? style}) _outfitInput(MockRequest request) {
    final body = request.bodyMap;
    final v = Validator();
    final pieces = _requestPieces(v, body);
    _validateSlugs(v, body);
    v.throwIfInvalid();
    return (pieces: pieces, occasion: body['occasion_slug'] as String?, style: body['style_slug'] as String?);
  }

  List<(String, List<EnginePiece>)> _candidates(List<EnginePiece> pieces) {
    final issues = engine.structuralIssues(pieces);
    final result = <(String, List<EnginePiece>)>[];
    for (final group in ['footwear', 'top', 'bottom']) {
      if (!issues.contains(group)) continue;
      final type = engine.defaultTypeFor(group);
      if (type == null) continue;
      final probe = EnginePiece(type: type, color: engine.colorsById.values.first, role: group);
      final color = engine.bestColorFor(probe, pieces)!;
      result.add(('add:${type['name']}:${color['name']}', [...pieces, probe.withColor(color)]));
    }
    for (final (i, p) in pieces.indexed) {
      final others = [...pieces]..removeAt(i);
      final color = engine.bestColorFor(p, others);
      if (color == null || color['id'] == p.colorId) continue;
      result.add(('replace:$i:${p.type['name']}:${color['name']}', [...pieces]..[i] = p.withColor(color)));
    }
    return result;
  }

  Json _change(String key, List<EnginePiece> before, List<EnginePiece> after) {
    final parts = key.split(':');
    if (parts.first == 'add') {
      return {'action': 'add_item', 'item_index': null, 'item': after.last.requestItem};
    }
    final index = int.parse(parts[1]);
    return {'action': 'replace_item', 'item_index': index, 'item': after[index].requestItem};
  }

  String _changeText(String key) {
    final parts = key.split(':');
    return parts.first == 'add'
        ? 'Ajoutez « ${parts[1]} » en ${parts[2].toLowerCase()}.'
        : 'Passez « ${parts[2]} » en ${parts[3].toLowerCase()}.';
  }

  List<Json> _improvements(List<EnginePiece> pieces, String? occasion, String? style) {
    final current = engine.score(pieces, occasion: occasion, style: style).score;
    final ranked = [
      for (final (key, after) in _candidates(pieces))
        if (engine.score(after, occasion: occasion, style: style).score case final s when s > current)
          {'text': _changeText(key), 'change': _change(key, pieces, after), 'resulting_score': s},
    ]..sort((a, b) => (b['resulting_score'] as int).compareTo(a['resulting_score'] as int));
    return ranked.take(5).toList();
  }

  MockResponse _evaluate(MockRequest request, Map<String, String> _) {
    final input = _outfitInput(request);
    final scored = engine.score(input.pieces, occasion: input.occasion, style: input.style);
    final issues = engine.structuralIssues(input.pieces);
    const labels = {'top': 'un haut', 'bottom': 'un bas', 'footwear': 'des chaussures'};
    return MockResponse.ok({
      'data': {
        'request_id': _requestId(request),
        'catalog_version': _catalogVersion,
        'rules_version': _rulesVersion,
        'score': scored.score,
        'score_breakdown': scored.breakdown,
        'is_complete': !issues.any(labels.containsKey),
        'strengths': [
          if ((scored.breakdown['color'] as Json)['points'] as int >= 30) {'text': 'Les couleurs s’accordent bien entre elles.'},
          if (input.occasion != null && (scored.breakdown['occasion'] as Json)['points'] == 15)
            {'text': "Les pièces conviennent bien à l'occasion choisie."},
        ],
        'warnings': [
          for (final issue in issues)
            if (labels[issue] case final label?)
              {'type': 'structure', 'text': 'Il manque $label pour compléter la tenue.', 'item_indexes': <int>[]}
            else
              {'type': 'structure', 'text': 'Certaines pièces se contredisent ou font doublon.', 'item_indexes': <int>[]},
        ],
        'suggestions': [
          for (final i in _improvements(input.pieces, input.occasion, input.style).take(3)) {'text': i['text']},
        ],
      },
    });
  }

  MockResponse _improve(MockRequest request, Map<String, String> _) {
    final input = _outfitInput(request);
    return MockResponse.ok({
      'data': {
        'request_id': _requestId(request),
        'catalog_version': _catalogVersion,
        'rules_version': _rulesVersion,
        'current_score': engine.score(input.pieces, occasion: input.occasion, style: input.style).score,
        'improvements': _improvements(input.pieces, input.occasion, input.style),
      },
    });
  }

  MockResponse _feedback(MockRequest request, Map<String, String> params) {
    final user = requireUser(request);
    final requestId = params['requestId']!;
    final body = request.bodyMap;
    final v = Validator();
    final owner = requestId.split('.').last;
    if (!requestId.startsWith('rq1.mock.') || (owner != 'guest' && owner != user.id)) {
      v.add('request_id', "Cette recommandation n'est plus valide pour un retour.");
    }
    final rating = body['rating'];
    final helpful = body['is_helpful'];
    if (rating == null && helpful == null) v.add('is_helpful', 'Indiquez au moins un avis.');
    if (rating != null && (rating is! int || rating < 1 || rating > 5)) v.add('rating', 'La note doit être comprise entre 1 et 5.');
    final outfitId = body['outfit_id'];
    if (outfitId != null && !fixtures.outfits.any((o) => o['id'] == outfitId)) {
      v.add('outfit_id', "Ce look n'est plus disponible.");
    }
    v.string(body, 'comment', required: false, max: 500);
    v.throwIfInvalid();
    final data = {
      'request_id': requestId,
      'outfit_id': outfitId,
      'rating': rating,
      'is_helpful': helpful,
      'comment': body['comment'],
      'created_at': isoSeconds(clock()),
    };
    final existing = feedbacks
        .where((f) => f.userId == user.id && f.requestId == requestId && f.outfitId == outfitId)
        .firstOrNull;
    if (existing != null) {
      existing.data = data;
      return MockResponse.ok({'data': data});
    }
    feedbacks.add(MockFeedback(userId: user.id, requestId: requestId, outfitId: outfitId as String?, data: data));
    return MockResponse.created({'data': data});
  }
}
