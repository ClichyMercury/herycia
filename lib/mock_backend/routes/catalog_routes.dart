part of '../mock_backend.dart';

extension _CatalogRoutes on MockBackend {
  List<MockRoute> get _catalogRoutes => [
        MockRoute('GET', '/catalog/version', (_, _) => MockResponse.ok({'data': fixtures.version})),
        MockRoute('GET', '/clothing-categories', (_, _) => MockResponse.ok({'data': fixtures.categories})),
        MockRoute('GET', '/clothing-types', (_, _) => MockResponse.ok({'data': fixtures.types})),
        MockRoute('GET', '/colors', (_, _) => MockResponse.ok({'data': fixtures.colors})),
        MockRoute('GET', '/styles', (_, _) => MockResponse.ok({'data': fixtures.styles})),
        MockRoute('GET', '/occasions', (_, _) => MockResponse.ok({'data': fixtures.occasions})),
        MockRoute('GET', '/color-guide', (_, _) => MockResponse.ok({'data': fixtures.colorGuide})),
        MockRoute('GET', '/outfits', _listOutfits),
        MockRoute('GET', '/outfits/{id}', (_, params) {
          final outfit = fixtures.outfits.where((o) => o['id'] == params['id']).firstOrNull;
          if (outfit == null) throw HttpError.notFound();
          return MockResponse.ok({'data': outfit});
        }),
      ];

  MockResponse _listOutfits(MockRequest request, Map<String, String> _) {
    final style = request.query['style'];
    final occasion = request.query['occasion'];
    final exclude = request.query['exclude'];
    if (style != null && !fixtures.styles.any((s) => s['slug'] == style)) {
      throw HttpError.field('style', "Le style sélectionné n'est pas disponible.");
    }
    if (occasion != null && !fixtures.occasions.any((o) => o['slug'] == occasion)) {
      throw HttpError.field('occasion', "L'occasion sélectionnée n'est pas disponible.");
    }
    final items = [
      for (final o in fixtures.outfits)
        if ((style == null || (o['style'] as Json?)?['slug'] == style) &&
            (occasion == null || (o['occasion'] as Json?)?['slug'] == occasion) &&
            o['id'] != exclude)
          o,
    ];
    return MockResponse.ok(paginate(items, request, '/outfits'));
  }
}
