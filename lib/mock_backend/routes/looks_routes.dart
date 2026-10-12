part of '../mock_backend.dart';

extension _LooksRoutes on MockBackend {
  static const maxPerPage = 50;

  List<MockRoute> get _looksRoutes => [
        MockRoute('GET', '/outfits', (r, p) {
          final v = Validator();
          final style = styleFromSlug(v, r.query['style_slug'], 'style_slug');
          final occasion = occasionFromSlug(v, r.query['occasion_slug'], 'occasion_slug');
          final page = int.tryParse(r.query['page'] ?? '1');
          final perPage = int.tryParse(r.query['per_page'] ?? '10');
          if (page == null || page < 1) v.add('page', 'La page doit être un entier positif.');
          if (perPage == null || perPage < 1 || perPage > maxPerPage) {
            v.add('per_page', 'per_page doit être compris entre 1 et $maxPerPage.');
          }
          v.throwIfInvalid();

          final matching = fixtures.looks
              .where((l) =>
                  l.status == LookStatus.published &&
                  (style == null || l.styleId == style.id) &&
                  (occasion == null || l.occasionId == occasion.id))
              .toList()
            ..sort((a, b) {
              final byDate = b.publishedAt!.compareTo(a.publishedAt!);
              return byDate != 0 ? byDate : compareIds(a.id, b.id);
            });
          final lastPage = matching.isEmpty ? 1 : (matching.length / perPage!).ceil();
          final pageItems = matching.skip((page! - 1) * perPage!).take(perPage);
          return MockResponse.ok({
            'data': [for (final l in pageItems) l.toJson()],
            'meta': PageMeta(
              currentPage: page,
              perPage: perPage,
              total: matching.length,
              lastPage: lastPage,
            ).toJson(),
          });
        }),
        MockRoute('GET', '/outfits/{id}', (r, p) {
          final look = publishedLook(p['id']!);
          if (look == null) throw HttpError.notFound("Ce look n'existe pas ou n'est plus publié.");
          return MockResponse.ok({'data': look.toJson()});
        }),
      ];
}
