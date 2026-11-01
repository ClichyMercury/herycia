import 'dart:convert';

import 'mock_engine.dart';
import 'mock_fixtures.dart';
import 'mock_http.dart';

part 'routes/auth_routes.dart';
part 'routes/catalog_routes.dart';
part 'routes/recommendation_routes.dart';
part 'routes/wardrobe_routes.dart';

class MockUser {
  MockUser({
    required this.id,
    required this.name,
    required this.email,
    required this.passwordForMockOnly,
    required this.createdAt,
  });

  final String id;
  String name;
  final String email;
  String passwordForMockOnly;
  final DateTime createdAt;
  DateTime tokenValidAfter = DateTime.utc(2000);

  Json toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'email_verified_at': null,
        'created_at': isoSeconds(createdAt),
      };
}

class MockToken {
  MockToken({required this.userId, required this.issuedAt, required this.loginAt});

  final String userId;
  final DateTime issuedAt;
  final DateTime loginAt;
  bool revoked = false;
}

class MockRecord {
  MockRecord({required this.id, required this.data, required this.createdAt, required this.updatedAt});

  final String id;
  Json data;
  final DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  bool get isActive => deletedAt == null;
}

class MockFeedback {
  MockFeedback({required this.userId, required this.requestId, required this.outfitId, required this.data});

  final String userId;
  final String requestId;
  final String? outfitId;
  Json data;
}

String isoSeconds(DateTime date) => '${date.toUtc().toIso8601String().split('.').first}Z';

String isoMicros(DateTime date) {
  final utc = date.toUtc();
  final base = utc.toIso8601String().split('.').first;
  final micros = (utc.millisecond * 1000 + utc.microsecond).toString().padLeft(6, '0');
  return '$base.${micros}Z';
}

class MockBackend {
  MockBackend({required this.fixtures, DateTime Function()? clock, bool seedDemoData = true})
      : clock = clock ?? (() => DateTime.now().toUtc()) {
    engine = MockEngine(fixtures);
    _routes = [..._catalogRoutes, ..._recommendationRoutes, ..._authRoutes, ..._wardrobeRoutes];
    if (seedDemoData) {
      users[demoEmail] = MockUser(
        id: '0197b2c4-7d1e-7a3b-9f10-2c8e5a4d6b11',
        name: 'Awa Démo',
        email: demoEmail,
        passwordForMockOnly: demoPassword,
        createdAt: DateTime.utc(2026, 10, 1),
      );
    }
  }

  static const demoEmail = 'demo@herycia.app';
  static const demoPassword = 'motdepasse123';
  static const mockOtp = '123456';
  static const accessTokenTtl = Duration(minutes: 15);
  static const refreshWindow = Duration(days: 14);
  static const tombstoneRetention = Duration(days: 90);
  static const maxActivePerResource = 500;

  final MockFixtures fixtures;
  final DateTime Function() clock;
  late final MockEngine engine;
  late final List<MockRoute> _routes;

  final Map<String, MockUser> users = {};
  final Map<String, MockToken> tokens = {};
  final Map<String, ({String otp, int attempts})> otps = {};
  final Map<String, Map<String, MockRecord>> favorites = {};
  final Map<String, Map<String, MockRecord>> savedOutfits = {};
  final Map<String, Json> preferences = {};
  final List<MockFeedback> feedbacks = [];
  final Map<String, int> callCounts = {};
  int _sequence = 0;
  DateTime _lastTick = DateTime.utc(2000);

  DateTime tick() {
    var now = clock();
    if (!now.isAfter(_lastTick)) now = _lastTick.add(const Duration(microseconds: 1));
    _lastTick = now;
    return now;
  }

  String nextUuid() {
    final n = (++_sequence).toRadixString(16).padLeft(12, '0');
    return '0197b2c4-0000-7000-8000-$n';
  }

  MockResponse handle(MockRequest request) {
    callCounts.update('${request.method} ${request.path}', (v) => v + 1, ifAbsent: () => 1);
    try {
      for (final route in _routes) {
        final params = route.match(request.method, request.path);
        if (params != null) return route.handler(request, params);
      }
      throw HttpError.notFound();
    } on HttpError catch (e) {
      return e.toResponse();
    }
  }

  String issueToken(String userId, {DateTime? loginAt}) {
    final now = clock();
    final token = 'mock.${base64Url.encode(utf8.encode('$userId.${nextUuid()}'))}';
    tokens[token] = MockToken(userId: userId, issuedAt: now, loginAt: loginAt ?? now);
    return token;
  }

  MockUser? _userOf(MockToken token) {
    for (final u in users.values) {
      if (u.id == token.userId) return u;
    }
    return null;
  }

  MockUser? optionalUser(MockRequest request) {
    final token = tokens[request.bearerToken];
    if (token == null || token.revoked) return null;
    if (clock().isAfter(token.issuedAt.add(accessTokenTtl))) return null;
    final user = _userOf(token);
    if (user == null || token.issuedAt.isBefore(user.tokenValidAfter)) return null;
    return user;
  }

  MockUser requireUser(MockRequest request) => optionalUser(request) ?? (throw HttpError.unauthenticated());

  void revokeAllTokens(MockUser user) {
    user.tokenValidAfter = clock().add(const Duration(microseconds: 1));
  }

  void expireAllTokens() {
    for (final entry in tokens.entries.toList()) {
      tokens[entry.key] = MockToken(
        userId: entry.value.userId,
        issuedAt: entry.value.issuedAt.subtract(accessTokenTtl * 2),
        loginAt: entry.value.loginAt.subtract(accessTokenTtl * 2),
      )..revoked = entry.value.revoked;
    }
  }

  Map<String, MockRecord> favoritesOf(MockUser user) => favorites.putIfAbsent(user.id, () => {});

  Map<String, MockRecord> savedOutfitsOf(MockUser user) => savedOutfits.putIfAbsent(user.id, () => {});

  Json authPayload(MockUser user, String token, {bool withUser = true}) => {
        'data': {
          'access_token': token,
          'token_type': 'Bearer',
          'expires_in': accessTokenTtl.inSeconds,
          if (withUser) 'user': user.toJson(),
        },
      };
}
