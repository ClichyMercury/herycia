part of '../mock_backend.dart';

extension _WardrobeRoutes on MockBackend {
  List<MockRoute> get _wardrobeRoutes => [
        MockRoute('GET', '/me/favorites', (request, _) {
          final user = requireUser(request);
          final items = favoritesOf(user).values.where((r) => r.isActive).toList()
            ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
          return MockResponse.ok(paginate([for (final r in items) _favoriteJson(r)], request, '/me/favorites'));
        }),
        MockRoute('POST', '/me/favorites', _saveFavorite),
        MockRoute('DELETE', '/me/favorites/{id}', (request, params) {
          _tombstone(favoritesOf(requireUser(request)), params['id']!);
          return const MockResponse.noContent();
        }),
        MockRoute('GET', '/me/preferences', (request, _) {
          final user = requireUser(request);
          return MockResponse.ok({'data': _preferencesOf(user)});
        }),
        MockRoute('PUT', '/me/preferences', _putPreferences),
        MockRoute('GET', '/me/saved-outfits', (request, _) {
          final user = requireUser(request);
          final items = savedOutfitsOf(user).values.where((r) => r.isActive).toList()
            ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
          return MockResponse.ok(paginate([for (final r in items) _savedJson(r)], request, '/me/saved-outfits'));
        }),
        MockRoute('POST', '/me/saved-outfits', (request, _) => _writeSaved(request, null)),
        MockRoute('PUT', '/me/saved-outfits/{id}', (request, params) => _writeSaved(request, params['id'])),
        MockRoute('DELETE', '/me/saved-outfits/{id}', (request, params) {
          _tombstone(savedOutfitsOf(requireUser(request)), params['id']!);
          return const MockResponse.noContent();
        }),
        MockRoute('GET', '/me/sync', _sync),
      ];

  Json _favoriteJson(MockRecord r) => {
        'id': r.id,
        ...r.data,
        'created_at': isoMicros(r.createdAt),
        'updated_at': isoMicros(r.updatedAt),
      };

  Json _savedJson(MockRecord r) => {
        'id': r.id,
        ...r.data,
        'created_at': isoMicros(r.createdAt),
        'updated_at': isoMicros(r.updatedAt),
      };

  void _tombstone(Map<String, MockRecord> records, String id) {
    final record = records[id.toLowerCase()];
    if (record == null || !uuidPattern.hasMatch(id)) throw HttpError.notFound();
    if (record.isActive) {
      final now = tick();
      record
        ..deletedAt = now
        ..updatedAt = now;
    }
  }

  Json _snapshotFromOutfit(Json outfit) => {
        'schema_version': 1,
        'title': outfit['title'],
        if (outfit['style'] case final Json s) 'style': {'slug': s['slug'], 'name': s['name']},
        if (outfit['occasion'] case final Json o) 'occasion': {'slug': o['slug'], 'name': o['name']},
        'items': [
          for (final i in outfit['items'] as List<dynamic>)
            {
              'clothing_type': {'slug': (i as Json)['clothing_type']['slug'], 'name': i['clothing_type']['name']},
              'color': {'slug': i['color']['slug'], 'name': i['color']['name'], 'hex_code': i['color']['hex_code']},
              'role': i['role'],
              'is_required': i['is_required'],
            },
        ],
        if (outfit['image'] case final Json img)
          'image': {
            'url': img['url'],
            'thumbnail_url': img['thumbnail_url'],
            'alt_text': img['alt_text'],
            'credit': img['credit'],
            'license_type': img['license_type'],
          },
        'catalog_version': fixtures.version['catalog_version'],
      };

  MockResponse _saveFavorite(MockRequest request, Map<String, String> _) {
    final user = requireUser(request);
    final body = request.bodyMap;
    final v = Validator();
    final clientUuid = v.uuid(body, 'client_uuid');
    final outfitId = v.uuid(body, 'outfit_id', required: false);
    final snapshot = body['snapshot'];
    Json? outfit;
    if (outfitId != null) {
      outfit = fixtures.outfits.where((o) => o['id'] == outfitId).firstOrNull;
      if (outfit == null) v.add('outfit_id', "Ce look n'est plus disponible.");
    } else if (snapshot is! Json) {
      v.add('snapshot', "L'instantané est obligatoire pour une composition personnalisée.");
    } else {
      final items = snapshot['items'];
      if (snapshot['title'] is! String || items is! List || items.isEmpty || items.length > 12) {
        v.add('snapshot', "L'instantané est invalide.");
      }
    }
    v.throwIfInvalid();
    final records = favoritesOf(user);
    if (outfitId != null) {
      final active = records.values.where((r) => r.isActive && r.data['outfit_id'] == outfitId).firstOrNull;
      if (active != null) return MockResponse.ok({'data': _favoriteJson(active)});
    }
    final data = {
      'outfit_id': outfitId,
      'snapshot': outfit != null ? _snapshotFromOutfit(outfit) : snapshot,
    };
    final existing = records[clientUuid];
    if (existing != null && existing.isActive) return MockResponse.ok({'data': _favoriteJson(existing)});
    if (records.values.where((r) => r.isActive).length >= MockBackend.maxActivePerResource) {
      throw HttpError.field('client_uuid', 'Vous avez atteint le nombre maximal de favoris.');
    }
    final now = tick();
    if (existing != null) {
      existing
        ..data = data
        ..deletedAt = null
        ..updatedAt = now;
      return MockResponse.ok({'data': _favoriteJson(existing)});
    }
    final record = MockRecord(id: clientUuid!, data: data, createdAt: now, updatedAt: now);
    records[clientUuid] = record;
    return MockResponse.created({'data': _favoriteJson(record)});
  }

  Json _preferencesOf(MockUser user) =>
      preferences[user.id] ?? {'language': 'fr', 'style_ids': <String>[], 'occasion_ids': <String>[], 'updated_at': null};

  MockResponse _putPreferences(MockRequest request, Map<String, String> _) {
    final user = requireUser(request);
    final body = request.bodyMap;
    final v = Validator();
    List<String> ids(String field, List<Json> source, String label) {
      final value = body[field];
      if (value is! List) {
        v.add(field, 'Le champ $field est obligatoire.');
        return const [];
      }
      final known = {for (final s in source) s['id']};
      for (final (i, id) in value.indexed) {
        if (!known.contains(id)) v.add('$field.$i', "$label sélectionné n'est pas disponible.");
      }
      if (value.toSet().length != value.length) v.add(field, 'Les doublons ne sont pas autorisés.');
      return [for (final id in value) id as String];
    }

    final styleIds = ids('style_ids', fixtures.styles, 'Le style');
    final occasionIds = ids('occasion_ids', fixtures.occasions, "L'occasion");
    final language = body['language'] ?? 'fr';
    if (language != 'fr') v.add('language', "Cette langue n'est pas prise en charge.");
    v.throwIfInvalid();
    final prefs = {
      'language': language,
      'style_ids': styleIds,
      'occasion_ids': occasionIds,
      'updated_at': isoSeconds(tick()),
    };
    preferences[user.id] = prefs;
    return MockResponse.ok({'data': prefs});
  }

  Json _validComposition(Validator v, Object? composition) {
    if (composition is! Json || composition['items'] is! List) {
      v.add('composition', 'La composition est obligatoire.');
      return const {};
    }
    final items = composition['items'] as List<dynamic>;
    if (items.isEmpty || items.length > 10) v.add('composition.items', 'La composition doit contenir de 1 à 10 pièces.');
    for (final key in ['occasion_slug', 'style_slug']) {
      final slug = composition[key];
      if (slug != null && (slug is! String || !slugPattern.hasMatch(slug))) v.add('composition.$key', 'Slug invalide.');
    }
    return {
      'items': items,
      'occasion_slug': composition['occasion_slug'],
      'style_slug': composition['style_slug'],
    };
  }

  MockResponse _writeSaved(MockRequest request, String? pathId) {
    final user = requireUser(request);
    final body = request.bodyMap;
    final v = Validator();
    final clientUuid = pathId?.toLowerCase() ?? v.uuid(body, 'client_uuid');
    final composition = _validComposition(v, body['composition']);
    final ruleVersion = body['rule_version'];
    if (ruleVersion is! int || ruleVersion < 1) v.add('rule_version', 'La version de règles est obligatoire.');
    final title = v.string(body, 'title', required: false, max: 150);
    v.throwIfInvalid();
    final records = savedOutfitsOf(user);
    final existing = records[clientUuid];
    final data = {'title': title, 'composition': composition, 'score': body['score'], 'rule_version': ruleVersion};
    final now = tick();
    if (pathId != null) {
      if (existing == null || !existing.isActive) throw HttpError.notFound();
      existing
        ..data = data
        ..updatedAt = now;
      return MockResponse.ok({'data': _savedJson(existing)});
    }
    if (existing != null && existing.isActive) return MockResponse.ok({'data': _savedJson(existing)});
    if (existing != null) {
      existing
        ..data = data
        ..deletedAt = null
        ..updatedAt = now;
      return MockResponse.ok({'data': _savedJson(existing)});
    }
    final record = MockRecord(id: clientUuid!, data: data, createdAt: now, updatedAt: now);
    records[clientUuid] = record;
    return MockResponse.created({'data': _savedJson(record)});
  }

  MockResponse _sync(MockRequest request, Map<String, String> _) {
    final user = requireUser(request);
    final limit = int.tryParse(request.query['limit'] ?? '100') ?? 0;
    if (limit < 1 || limit > 200) throw HttpError.field('limit', 'La limite doit être comprise entre 1 et 200.');
    final cursor = request.query['cursor'];
    DateTime? after;
    String? afterId;
    if (cursor != null) {
      try {
        final parts = utf8.decode(base64Url.decode(cursor)).split('|');
        after = DateTime.fromMicrosecondsSinceEpoch(int.parse(parts[0]), isUtc: true);
        afterId = parts[1];
        final issued = DateTime.fromMicrosecondsSinceEpoch(int.parse(parts[2]), isUtc: true);
        if (clock().difference(issued) > MockBackend.tombstoneRetention) throw HttpError.cursorExpired();
      } on FormatException {
        throw HttpError.field('cursor', 'Le curseur est illisible.');
      }
    }
    final all = [
      for (final r in favoritesOf(user).values) ('favorite', r),
      for (final r in savedOutfitsOf(user).values) ('saved_outfit', r),
    ]..sort((a, b) {
        final byDate = a.$2.updatedAt.compareTo(b.$2.updatedAt);
        return byDate != 0 ? byDate : a.$2.id.compareTo(b.$2.id);
      });
    final pending = [
      for (final entry in all)
        if (cursor == null
            ? entry.$2.isActive
            : (entry.$2.updatedAt.isAfter(after!) ||
                (entry.$2.updatedAt == after && entry.$2.id.compareTo(afterId!) > 0)))
          entry,
    ];
    final page = pending.take(limit).toList();
    final last = page.isEmpty ? null : page.last.$2;
    final position = last == null ? (after ?? DateTime.utc(2000)) : last.updatedAt;
    final positionId = last?.id ?? afterId ?? '';
    final nextCursor = base64Url.encode(
      utf8.encode('${position.microsecondsSinceEpoch}|$positionId|${clock().microsecondsSinceEpoch}'),
    );
    return MockResponse.ok({
      'data': {
        'changes': [
          for (final (resource, r) in page)
            {
              'resource': resource,
              'op': r.isActive ? 'upsert' : 'delete',
              'id': r.id,
              'updated_at': isoMicros(r.updatedAt),
              if (!r.isActive) 'deleted_at': isoMicros(r.deletedAt!),
              if (r.isActive) 'data': resource == 'favorite' ? _favoriteJson(r) : _savedJson(r),
            },
        ],
        'cursor': nextCursor,
        'has_more': pending.length > page.length,
      },
    });
  }
}
