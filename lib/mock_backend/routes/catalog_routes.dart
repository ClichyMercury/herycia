part of '../mock_backend.dart';

extension _CatalogRoutes on MockBackend {
  List<MockRoute> get _catalogRoutes => [
        MockRoute('GET', '/catalog/version', (r, p) {
          return MockResponse.ok({'data': fixtures.version.toJson()});
        }),
        MockRoute('GET', '/clothing-categories', (r, p) {
          return MockResponse.ok({'data': [for (final c in fixtures.categories) c.toJson()]});
        }),
        MockRoute('GET', '/clothing-types', (r, p) {
          final categoryId = r.query['category_id'];
          if (categoryId != null && !index.categoriesById.containsKey(categoryId)) {
            throw HttpError.validation({
              'category_id': ["Cette catégorie n'existe pas."],
            });
          }
          return MockResponse.ok({
            'data': [
              for (final t in fixtures.types)
                if (categoryId == null || t.categoryId == categoryId) t.toJson(),
            ],
          });
        }),
        MockRoute('GET', '/colors', (r, p) {
          return MockResponse.ok({'data': [for (final c in fixtures.colors) c.toJson()]});
        }),
        MockRoute('GET', '/styles', (r, p) {
          return MockResponse.ok({'data': [for (final s in fixtures.styles) s.toJson()]});
        }),
        MockRoute('GET', '/occasions', (r, p) {
          return MockResponse.ok({'data': [for (final o in fixtures.occasions) o.toJson()]});
        }),
        MockRoute('GET', '/color-guide', (r, p) {
          return MockResponse.ok({'data': fixtures.colorGuide.toJson()});
        }),
        MockRoute('GET', '/color-pairing-rules', (r, p) {
          return MockResponse.ok({
            'data': [for (final rule in fixtures.pairingRules) rule.toJson()],
            'meta': {'rules_version': index.rulesVersion},
          });
        }),
        MockRoute('GET', '/recommendation-rules', (r, p) {
          return MockResponse.ok({
            'data': [for (final rule in fixtures.recommendationRules) rule.toJson()],
            'meta': {'rules_version': index.rulesVersion},
          });
        }),
      ];
}
