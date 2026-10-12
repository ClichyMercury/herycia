part of '../mock_backend.dart';

extension _WardrobeRoutes on MockBackend {
  static const silhouettes = {'straight', 'hourglass', 'broad'};
  static const languages = {'fr'};

  List<RequestItem> _snapshotItems(Validator v, Object? raw, String field) => [
        for (final piece in parseItems(v, raw, field))
          RequestItem(clothingTypeId: piece.type.id, colorId: piece.color.id, role: piece.role),
      ];

  String? _clientUuid(Validator v, Map<String, dynamic> body) {
    final value = body['client_uuid'];
    if (value is! String || !uuidPattern.hasMatch(value)) {
      v.add('client_uuid', 'client_uuid doit être un UUID généré par l\'application.');
      return null;
    }
    return value.toLowerCase();
  }

  DateTime? _optionalDate(Validator v, Map<String, dynamic> body, String field) {
    final value = body[field];
    if (value == null) return null;
    final parsed = value is String ? DateTime.tryParse(value) : null;
    if (parsed == null) v.add(field, 'Date invalide (format ISO 8601 attendu).');
    return parsed?.toUtc();
  }

  int _indexOf<T>(List<T> list, String key, String Function(T) id, String Function(T) uuid) =>
      list.indexWhere((e) => id(e) == key || uuid(e) == key.toLowerCase());

  List<MockRoute> get _wardrobeRoutes => [
        MockRoute('GET', '/me/favorites', (r, p) {
          final user = requireUser(r);
          final v = Validator();
          final since = r.query.containsKey('updated_since')
              ? _optionalDate(v, {'updated_since': r.query['updated_since']}, 'updated_since')
              : null;
          v.throwIfInvalid();
          final list = (favorites[user.id] ?? const <Favorite>[])
              .where((f) => since == null || f.updatedAt.isAfter(since));
          return MockResponse.ok({'data': sortedById(list, (f) => f.id, (f) => f.toJson())});
        }),
        MockRoute('POST', '/me/favorites', (r, p) {
          final user = requireUser(r);
          final body = r.bodyMap;
          final v = Validator();
          final uuid = _clientUuid(v, body);
          final outfitId = v.id(body, 'outfit_id', 'look', required: false);
          if (outfitId != null && publishedLook(outfitId) == null) {
            v.add('outfit_id', "Ce look n'existe pas ou n'est plus publié.");
          }
          final rawSnapshot = body['snapshot'];
          LookSnapshot? snapshot;
          if (rawSnapshot is! Map<String, dynamic>) {
            if (outfitId == null) v.add('snapshot', 'Un favori doit référencer un look ou contenir un instantané.');
          } else {
            final title = v.requiredString(rawSnapshot, 'title', 'titre', max: 120);
            final items = _snapshotItems(v, rawSnapshot['items'], 'snapshot.items');
            final occasion = occasionFromSlug(v, rawSnapshot['occasion_slug'], 'snapshot.occasion_slug');
            final style = styleFromSlug(v, rawSnapshot['style_slug'], 'snapshot.style_slug');
            final score = rawSnapshot['score'];
            if (score != null && (score is! int || score < 0 || score > 100)) {
              v.add('snapshot.score', 'Le score doit être un entier entre 0 et 100.');
            }
            final imageUrl = v.optionalString(rawSnapshot, 'image_url', 'image', max: 2048);
            final explanation = v.optionalString(rawSnapshot, 'explanation', 'explication', max: 300);
            if (title != null && !v.hasErrors) {
              snapshot = LookSnapshot(
                title: title,
                items: items,
                occasionSlug: occasion?.slug,
                styleSlug: style?.slug,
                score: score as int?,
                imageUrl: imageUrl,
                explanation: explanation,
              );
            }
          }
          v.throwIfInvalid();

          final list = favorites.putIfAbsent(user.id, () => []);
          final existing = list.where((f) => f.clientUuid == uuid).firstOrNull;
          if (existing != null) return MockResponse.ok({'data': existing.toJson()});

          final now = clock();
          final favorite = Favorite(
            id: nextId('favorite'),
            clientUuid: uuid!,
            outfitId: outfitId,
            snapshot: snapshot ?? snapshotOf(publishedLook(outfitId!)!),
            createdAt: now,
            updatedAt: now,
          );
          list.add(favorite);
          return MockResponse.created({'data': favorite.toJson()});
        }),
        MockRoute('DELETE', '/me/favorites/{id}', (r, p) {
          final user = requireUser(r);
          final list = favorites[user.id] ?? [];
          final i = _indexOf(list, p['id']!, (f) => f.id, (f) => f.clientUuid);
          if (i < 0) throw HttpError.notFound('Favori introuvable.');
          list.removeAt(i);
          return const MockResponse.noContent();
        }),
        MockRoute('GET', '/me/preferences', (r, p) {
          final user = requireUser(r);
          return MockResponse.ok({'data': (preferences[user.id] ?? const UserPreferences()).toJson()});
        }),
        MockRoute('PUT', '/me/preferences', (r, p) {
          final user = requireUser(r);
          final body = r.bodyMap;
          final v = Validator();
          List<String> slugs(String field, Set<String> allowed, String label) {
            final raw = body[field] ?? const [];
            if (raw is! List) {
              v.add(field, '$field doit être une liste.');
              return const [];
            }
            for (var i = 0; i < raw.length; i++) {
              if (!allowed.contains(raw[i])) v.add('$field.$i', "Ce $label n'existe pas.");
            }
            return [for (final s in raw) '$s'];
          }

          final styles = slugs('style_slugs', index.stylesBySlug.keys.toSet(), 'style');
          final occasions = slugs('occasion_slugs', index.occasionsBySlug.keys.toSet(), 'occasion');
          final language = body['language'] ?? 'fr';
          if (!languages.contains(language)) v.add('language', 'Langue non prise en charge.');
          final theme = ThemePreference.values
              .where((t) => t.name == (body['theme'] ?? 'system'))
              .firstOrNull;
          if (theme == null) v.add('theme', 'Le thème doit valoir system, light ou dark.');
          final silhouette = body['silhouette'] ?? 'straight';
          if (!silhouettes.contains(silhouette)) {
            v.add('silhouette', 'La silhouette doit valoir straight, hourglass ou broad.');
          }
          v.throwIfInvalid();
          final updated = UserPreferences(
            language: language as String,
            styleSlugs: styles,
            occasionSlugs: occasions,
            theme: theme!,
            silhouette: silhouette as String,
            updatedAt: clock(),
          );
          preferences[user.id] = updated;
          return MockResponse.ok({'data': updated.toJson()});
        }),
        MockRoute('GET', '/me/saved-outfits', (r, p) {
          final user = requireUser(r);
          return MockResponse.ok({
            'data': sortedById(savedOutfits[user.id] ?? const <SavedOutfit>[], (s) => s.id, (s) => s.toJson()),
          });
        }),
        MockRoute('POST', '/me/saved-outfits', (r, p) {
          final user = requireUser(r);
          final input = _savedOutfitInput(r.bodyMap);
          final list = savedOutfits.putIfAbsent(user.id, () => []);
          final existing = list.where((s) => s.clientUuid == input.uuid).firstOrNull;
          if (existing != null) return MockResponse.ok({'data': existing.toJson()});
          final now = clock();
          final saved = SavedOutfit(
            id: nextId('saved_outfit'),
            clientUuid: input.uuid,
            title: input.title,
            composition: input.composition,
            score: input.score,
            ruleVersion: index.rulesVersion,
            createdAt: now,
            updatedAt: now,
          );
          list.add(saved);
          return MockResponse.created({'data': saved.toJson()});
        }),
        MockRoute('PUT', '/me/saved-outfits/{id}', (r, p) {
          final user = requireUser(r);
          final list = savedOutfits[user.id] ?? [];
          final i = _indexOf(list, p['id']!, (s) => s.id, (s) => s.clientUuid);
          if (i < 0) throw HttpError.notFound('Composition introuvable.');
          final input = _savedOutfitInput(r.bodyMap, requireUuid: false);
          final current = list[i];
          if (input.baseUpdatedAt != null && current.updatedAt.isAfter(input.baseUpdatedAt!)) {
            throw HttpError(
              409,
              ApiErrorCode.conflict,
              'Cette composition a été modifiée sur un autre appareil.',
              const {},
              {'current': current.toJson()},
            );
          }
          final updated = current.copyWith(
            title: input.title,
            composition: input.composition,
            score: input.score,
            ruleVersion: index.rulesVersion,
            updatedAt: clock(),
          );
          list[i] = updated;
          return MockResponse.ok({'data': updated.toJson()});
        }),
        MockRoute('DELETE', '/me/saved-outfits/{id}', (r, p) {
          final user = requireUser(r);
          final list = savedOutfits[user.id] ?? [];
          final i = _indexOf(list, p['id']!, (s) => s.id, (s) => s.clientUuid);
          if (i < 0) throw HttpError.notFound('Composition introuvable.');
          list.removeAt(i);
          return const MockResponse.noContent();
        }),
      ];

  ({String uuid, String? title, CompositionPayload composition, int score, DateTime? baseUpdatedAt})
      _savedOutfitInput(Map<String, dynamic> body, {bool requireUuid = true}) {
    final v = Validator();
    final uuid = requireUuid ? _clientUuid(v, body) : '';
    final title = v.optionalString(body, 'title', 'titre', max: 120);
    final raw = body['composition'];
    var pieces = const <EnginePiece>[];
    Occasion? occasion;
    OutfitStyle? style;
    if (raw is! Map<String, dynamic>) {
      v.add('composition', 'La composition est obligatoire.');
    } else {
      pieces = parseItems(v, raw['items'], 'composition.items');
      occasion = occasionFromSlug(v, raw['occasion_slug'], 'composition.occasion_slug');
      style = styleFromSlug(v, raw['style_slug'], 'composition.style_slug');
    }
    final baseUpdatedAt = _optionalDate(v, body, 'base_updated_at');
    v.throwIfInvalid();
    return (
      uuid: uuid!,
      title: title,
      composition: CompositionPayload(
        items: [
          for (final piece in pieces)
            RequestItem(clothingTypeId: piece.type.id, colorId: piece.color.id, role: piece.role),
        ],
        occasionSlug: occasion?.slug,
        styleSlug: style?.slug,
      ),
      score: evaluator.evaluate(pieces, occasion: occasion, style: style).score,
      baseUpdatedAt: baseUpdatedAt,
    );
  }
}
