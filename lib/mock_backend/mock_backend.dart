import '../core/api/api_exception.dart';
import '../core/json/id_converter.dart';
import '../features/account/domain/account_models.dart';
import '../features/catalog/domain/catalog_models.dart';
import '../features/favorites/domain/wardrobe_models.dart';
import '../features/looks/domain/look_models.dart';
import '../features/recommendation/domain/engine/catalog_index.dart';
import '../features/recommendation/domain/engine/outfit_evaluator.dart';
import '../features/recommendation/domain/engine/recommender.dart';
import '../features/recommendation/domain/recommendation_models.dart';
import 'mock_fixtures.dart';
import 'mock_http.dart';

part 'routes/auth_routes.dart';
part 'routes/catalog_routes.dart';
part 'routes/looks_routes.dart';
part 'routes/recommendation_routes.dart';
part 'routes/wardrobe_routes.dart';

class MockUser {
  MockUser({
    required this.id,
    required this.name,
    required this.email,
    required this.passwordForMockOnly,
    required this.createdAt,
    this.roles = const [UserRole.user],
    this.emailVerifiedAt,
  });

  final String id;
  String name;
  final String email;
  String passwordForMockOnly;
  final List<UserRole> roles;
  final DateTime createdAt;
  DateTime? emailVerifiedAt;

  AppUser toModel() => AppUser(
        id: id,
        name: name,
        email: email,
        roles: roles,
        emailVerifiedAt: emailVerifiedAt,
        createdAt: createdAt,
      );
}

class MockFeedback {
  MockFeedback({
    required this.id,
    required this.requestId,
    required this.userId,
    required this.outfitId,
    required this.isHelpful,
    required this.comment,
    required this.createdAt,
  });

  final String id;
  final String requestId;
  String? userId;
  final String? outfitId;
  final bool isHelpful;
  final String? comment;
  final DateTime createdAt;
}

class MockBackend {
  MockBackend({
    required this.fixtures,
    DateTime Function()? clock,
    this.seedDemoData = true,
  }) : clock = clock ?? (() => DateTime.now().toUtc()) {
    index = CatalogIndex(
      categories: fixtures.categories,
      types: fixtures.types,
      colors: fixtures.colors,
      styles: fixtures.styles,
      occasions: fixtures.occasions,
      pairingRules: fixtures.pairingRules,
      recommendationRules: fixtures.recommendationRules,
      catalogVersion: fixtures.version.catalogVersion,
      rulesVersion: fixtures.version.rulesVersion,
    );
    evaluator = OutfitEvaluator(index);
    recommender = Recommender(evaluator);
    improver = Improver(evaluator);
    _routes = [
      ..._catalogRoutes,
      ..._looksRoutes,
      ..._recommendationRoutes,
      ..._authRoutes,
      ..._wardrobeRoutes,
    ];
    if (seedDemoData) _seed();
  }

  static const demoEmail = 'demo@herycia.app';
  static const demoPassword = 'motdepasse123';
  static const tokenLifetime = Duration(days: 30);
  static const maxLoginAttemptsPerMinute = 5;

  final MockFixtures fixtures;
  final DateTime Function() clock;
  final bool seedDemoData;

  late final CatalogIndex index;
  late final OutfitEvaluator evaluator;
  late final Recommender recommender;
  late final Improver improver;
  late final List<MockRoute> _routes;

  final Map<String, MockUser> users = {};
  final Map<String, ({String userId, DateTime expiresAt})> tokens = {};
  final Map<String, String> resetTokens = {};
  final Map<String, List<DateTime>> failedLogins = {};
  final Map<String, List<Favorite>> favorites = {};
  final Map<String, List<SavedOutfit>> savedOutfits = {};
  final Map<String, UserPreferences> preferences = {};
  final List<MockFeedback> feedback = [];
  final Set<String> issuedRequestIds = {};
  final Map<String, int> _sequences = {};

  List<MockRoute> get routes => List.unmodifiable(_routes);

  String nextId(String sequence) {
    final value = (_sequences[sequence] ?? 0) + 1;
    _sequences[sequence] = value;
    return '$value';
  }

  String nextRequestId() {
    final id = 'rec_${nextId('request').padLeft(6, '0')}';
    issuedRequestIds.add(id);
    return id;
  }

  MockResponse handle(MockRequest request) {
    for (final route in _routes) {
      final params = route.match(request.method, request.path);
      if (params == null) continue;
      try {
        return route.handler(request, params);
      } on HttpError catch (e) {
        return e.toResponse();
      }
    }
    return HttpError.notFound('Route inconnue : ${request.method} ${request.path}').toResponse();
  }

  MockUser? userFor(MockRequest request) {
    final token = request.bearerToken;
    if (token == null) return null;
    final entry = tokens[token];
    if (entry == null || !entry.expiresAt.isAfter(clock())) return null;
    return users[entry.userId];
  }

  MockUser requireUser(MockRequest request) => userFor(request) ?? (throw HttpError.unauthenticated());

  AuthSession issueToken(MockUser user) {
    final token = 'mock_${nextId('token').padLeft(4, '0')}_${user.id}';
    final expiresAt = clock().add(tokenLifetime);
    tokens[token] = (userId: user.id, expiresAt: expiresAt);
    return AuthSession(token: token, expiresAt: expiresAt, user: user.toModel());
  }

  Occasion? occasionFromSlug(Validator v, Object? slug, String field) {
    if (slug == null) return null;
    final occasion = slug is String ? index.occasionsBySlug[slug] : null;
    if (occasion == null) v.add(field, "Cette occasion n'existe pas.");
    return occasion;
  }

  OutfitStyle? styleFromSlug(Validator v, Object? slug, String field) {
    if (slug == null) return null;
    final style = slug is String ? index.stylesBySlug[slug] : null;
    if (style == null) v.add(field, "Ce style n'existe pas.");
    return style;
  }

  void _seed() {
    final now = clock();
    final demo = MockUser(
      id: nextId('user'),
      name: 'Awa',
      email: demoEmail,
      passwordForMockOnly: demoPassword,
      createdAt: now.subtract(const Duration(days: 12)),
      emailVerifiedAt: now.subtract(const Duration(days: 12)),
    );
    users[demo.id] = demo;
    preferences[demo.id] = UserPreferences(
      styleSlugs: const ['smart-casual', 'minimalist'],
      occasionSlugs: const ['work', 'everyday'],
      silhouette: 'hourglass',
      updatedAt: now.subtract(const Duration(days: 3)),
    );
    final look = fixtures.looks.firstWhere((l) => l.id == '3');
    const savedItems = [
      RequestItem(clothingTypeId: '2', colorId: '11', role: PieceRole.top),
      RequestItem(clothingTypeId: '8', colorId: '10', role: PieceRole.bottom),
      RequestItem(clothingTypeId: '16', colorId: '8', role: PieceRole.shoes),
    ];
    final savedScore = evaluator.evaluate(
      [
        for (final i in savedItems)
          EnginePiece(type: index.typesById[i.clothingTypeId]!, color: index.colorsById[i.colorId]!, role: i.role),
      ],
      occasion: index.occasionsBySlug['work'],
    ).score;
    favorites[demo.id] = [
      Favorite(
        id: nextId('favorite'),
        clientUuid: '0b9d6f3e-6c1a-4f0e-9a51-1f2d3c4b5a61',
        outfitId: look.id,
        snapshot: snapshotOf(look),
        createdAt: now.subtract(const Duration(days: 2)),
        updatedAt: now.subtract(const Duration(days: 2)),
      ),
    ];
    savedOutfits[demo.id] = [
      SavedOutfit(
        id: nextId('saved_outfit'),
        clientUuid: '6a1f4c2e-3b7d-4e8a-9c0b-5d6e7f8a9b0c',
        title: 'Entretien jeudi',
        composition: const CompositionPayload(items: savedItems, occasionSlug: 'work'),
        score: savedScore,
        ruleVersion: index.rulesVersion,
        createdAt: now.subtract(const Duration(days: 1)),
        updatedAt: now.subtract(const Duration(days: 1)),
      ),
    ];
  }

  LookSnapshot snapshotOf(Look look) => LookSnapshot(
        title: look.title,
        items: [
          for (final i in look.items)
            RequestItem(clothingTypeId: i.clothingTypeId, colorId: i.colorId, role: i.role),
        ],
        occasionSlug: look.occasionId == null ? null : index.occasionsById[look.occasionId]?.slug,
        styleSlug: look.styleId == null ? null : index.stylesById[look.styleId]?.slug,
        imageUrl: look.primaryImage?.usageApproved ?? false ? look.primaryImage!.thumbnailUrl : null,
      );

  Look? publishedLook(String id) {
    for (final look in fixtures.looks) {
      if (look.id == id && look.status == LookStatus.published) return look;
    }
    return null;
  }

  List<EnginePiece> parseItems(Validator v, Object? raw, String field) {
    if (raw is! List || raw.isEmpty) {
      v.add(field, 'Ajoutez au moins une pièce.');
      return const [];
    }
    if (raw.length > 10) {
      v.add(field, 'Une tenue ne peut pas dépasser 10 pièces.');
      return const [];
    }
    final pieces = <EnginePiece>[];
    for (var i = 0; i < raw.length; i++) {
      final item = raw[i];
      if (item is! Map<String, dynamic>) {
        v.add('$field.$i', 'Pièce invalide.');
        continue;
      }
      final typeId = v.id(item, 'clothing_type_id', 'type de vêtement');
      final colorId = v.id(item, 'color_id', 'couleur');
      final type = typeId == null ? null : index.typesById[typeId];
      final color = colorId == null ? null : index.colorsById[colorId];
      if (typeId != null && type == null) {
        v.add('$field.$i.clothing_type_id', "Ce type de vêtement n'existe pas ou n'est plus disponible.");
      }
      if (colorId != null && color == null) {
        v.add('$field.$i.color_id', "La couleur sélectionnée n'est pas disponible.");
      }
      final role = PieceRole.values.where((r) => _roleWire(r) == item['role']).firstOrNull;
      if (role == null) {
        v.add('$field.$i.role', 'Le rôle doit valoir top, bottom, one_piece, shoes ou accessory.');
      } else if (type != null && roleForGroup(index.groupOf(type.id)!) != role) {
        v.add('$field.$i.role', 'Le rôle ne correspond pas au type de vêtement.');
      }
      if (type != null && color != null && role != null) {
        pieces.add(EnginePiece(type: type, color: color, role: role));
      }
    }
    return pieces;
  }

  static String _roleWire(PieceRole role) => switch (role) {
        PieceRole.top => 'top',
        PieceRole.bottom => 'bottom',
        PieceRole.onePiece => 'one_piece',
        PieceRole.shoes => 'shoes',
        PieceRole.accessory => 'accessory',
      };
}

List<Map<String, dynamic>> sortedById<T>(Iterable<T> items, String Function(T) id, Map<String, dynamic> Function(T) toJson) =>
    ([...items]..sort((a, b) => compareIds(id(a), id(b)))).map(toJson).toList();
