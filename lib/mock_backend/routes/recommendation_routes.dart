part of '../mock_backend.dart';

extension _RecommendationRoutes on MockBackend {
  List<MockRoute> get _recommendationRoutes => [
        MockRoute('POST', '/recommendations/from-item', (r, p) {
          final body = r.bodyMap;
          final v = Validator();
          final typeId = v.id(body, 'clothing_type_id', 'type de vêtement');
          final colorId = v.id(body, 'color_id', 'couleur');
          final type = typeId == null ? null : index.typesById[typeId];
          final color = colorId == null ? null : index.colorsById[colorId];
          if (typeId != null && type == null) {
            v.add('clothing_type_id', "Ce type de vêtement n'existe pas ou n'est plus disponible.");
          }
          if (colorId != null && color == null) {
            v.add('color_id', "La couleur sélectionnée n'est pas disponible.");
          }
          final occasion = occasionFromSlug(v, body['occasion_slug'], 'occasion_slug');
          final style = styleFromSlug(v, body['style_slug'], 'style_slug');
          final limit = body['limit'] ?? 5;
          if (limit is! int || limit < 1 || limit > 5) v.add('limit', 'limit doit être compris entre 1 et 5.');
          v.throwIfInvalid();

          final outcome = recommender.fromItem(
            anchorType: type!,
            anchorColor: color!,
            looks: fixtures.looks,
            occasion: occasion,
            style: style,
            limit: limit as int,
          );
          return MockResponse.ok({
            'data': FromItemResponse(
              requestId: nextRequestId(),
              catalogVersion: index.catalogVersion,
              rulesVersion: index.rulesVersion,
              broadened: outcome.broadened,
              results: outcome.results,
            ).toJson(),
          });
        }),
        MockRoute('POST', '/recommendations/evaluate-outfit', (r, p) {
          final (pieces, occasion, style) = _parseOutfit(r.bodyMap);
          final result = evaluator.evaluate(pieces, occasion: occasion, style: style);
          return MockResponse.ok({
            'data': EvaluationResponse(
              requestId: nextRequestId(),
              rulesVersion: index.rulesVersion,
              score: result.score,
              breakdown: result.breakdown,
              explanation: result.explanation,
              strengths: result.strengths,
              warnings: result.warnings,
              suggestions: result.hasStructuralIssue
                  ? const []
                  : improver.improve(pieces, occasion: occasion, style: style, limit: 3),
            ).toJson(),
          });
        }),
        MockRoute('POST', '/recommendations/improve-outfit', (r, p) {
          final (pieces, occasion, style) = _parseOutfit(r.bodyMap);
          return MockResponse.ok({
            'data': ImprovementResponse(
              requestId: nextRequestId(),
              rulesVersion: index.rulesVersion,
              currentScore: evaluator.evaluate(pieces, occasion: occasion, style: style).score,
              improvements: improver.improve(pieces, occasion: occasion, style: style),
            ).toJson(),
          });
        }),
        MockRoute('POST', '/recommendations/{id}/feedback', (r, p) {
          final requestId = p['id']!;
          if (!issuedRequestIds.contains(requestId)) {
            throw HttpError.notFound('Recommandation introuvable.');
          }
          final body = r.bodyMap;
          final v = Validator();
          final isHelpful = body['is_helpful'];
          if (isHelpful is! bool) v.add('is_helpful', 'Indiquez si la suggestion était utile.');
          final comment = v.optionalString(body, 'comment', 'commentaire', max: FeedbackRequest.maxCommentLength);
          final outfitId = v.id(body, 'outfit_id', 'look', required: false);
          if (outfitId != null && publishedLook(outfitId) == null) {
            v.add('outfit_id', "Ce look n'existe pas.");
          }
          v.throwIfInvalid();
          final entry = MockFeedback(
            id: nextId('feedback'),
            requestId: requestId,
            userId: userFor(r)?.id,
            outfitId: outfitId,
            isHelpful: isHelpful! as bool,
            comment: comment,
            createdAt: clock(),
          );
          feedback.add(entry);
          return MockResponse.created({
            'data': FeedbackReceipt(id: entry.id, requestId: requestId, createdAt: entry.createdAt).toJson(),
          });
        }),
      ];

  (List<EnginePiece>, Occasion?, OutfitStyle?) _parseOutfit(Map<String, dynamic> body) {
    final v = Validator();
    final pieces = parseItems(v, body['items'], 'items');
    final occasion = occasionFromSlug(v, body['occasion_slug'], 'occasion_slug');
    final style = styleFromSlug(v, body['style_slug'], 'style_slug');
    v.throwIfInvalid();
    return (pieces, occasion, style);
  }
}
