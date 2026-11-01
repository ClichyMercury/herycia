import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/core/api/api_exception.dart';
import 'package:herycia/core/storage/app_database.dart';
import 'package:herycia/core/storage/response_cache.dart';
import 'package:herycia/features/account/data/api_account_repositories.dart';
import 'package:herycia/features/account/domain/account_models.dart';
import 'package:herycia/features/catalog/data/api_catalog_repository.dart';
import 'package:herycia/features/looks/data/api_looks_repository.dart';
import 'package:herycia/features/looks/domain/look_models.dart';
import 'package:herycia/features/recommendation/data/api_recommendation_repository.dart';
import 'package:herycia/features/recommendation/domain/recommendation_models.dart';
import 'package:herycia/mock_backend/mock_backend.dart';

import '../helpers/mock_api.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  late MockApiHarness api;
  late AppDatabase db;
  late ResponseCache cache;

  setUp(() async {
    api = MockApiHarness(await MockApiHarness.fixtures());
    db = AppDatabase(NativeDatabase.memory());
    cache = ResponseCache(db, clock: () => DateTime.utc(2026, 10, 31, 10));
  });

  tearDown(() => db.close());

  const shirt = 'f9c84ba6-8813-5dc9-84be-bf8a5c4e0521';
  const white = '0491898d-fc0d-51ca-9b9f-e2cdadf5a975';

  group('catalogue', () {
    test('liste servie depuis le cache tant que la version ne change pas', () async {
      final repo = ApiCatalogRepository(api.client, cache);
      expect(await repo.colors(), hasLength(42));
      expect(await repo.colors(), hasLength(42));
      expect(api.backend.callCounts['GET /colors'], 1);
      expect(api.backend.callCounts['GET /catalog/version'], 1);
    });

    test('nouvelle version du catalogue : le cache est remplacé', () async {
      await ApiCatalogRepository(api.client, cache).colors();
      api.backend.fixtures.version['catalog_version'] = 2;
      await ApiCatalogRepository(api.client, cache).colors();
      expect(api.backend.callCounts['GET /colors'], 2);
    });

    test('hors ligne : le cache prend le relais, sans cache l’erreur réseau remonte', () async {
      await expectLater(
        ApiCatalogRepository(api.client..simulateOffline = true, cache).colors(),
        throwsA(isA<NetworkUnavailableException>()),
      );
      api.client.simulateOffline = false;
      await ApiCatalogRepository(api.client, cache).styles();
      api.client.simulateOffline = true;
      expect(await ApiCatalogRepository(api.client, cache).styles(), hasLength(7));
    });

    test('guide des couleurs : familles, neutres et harmonies', () async {
      final guide = await ApiCatalogRepository(api.client, cache).colorGuide();
      expect(guide.families, hasLength(15));
      expect(guide.neutralColorIds, isNotEmpty);
      expect(guide.harmonyFor('e4415da7-2919-5acc-8b06-5657736ae031')?.contrast, isNotEmpty);
      expect(guide.isNeutralFamily(guide.families.firstWhere((f) => f.slug == 'noir')), isTrue);
    });
  });

  test('looks : pagination, filtres par slug, exclusion, détail, repli hors ligne et 404', () async {
    final repo = ApiLooksRepository(api.client, cache);
    final page = await repo.list(const LookQuery(perPage: 2));
    expect(page.data, hasLength(2));
    expect(page.hasMore, isTrue);
    final casual = await repo.list(const LookQuery(styleSlug: 'casual'));
    expect(casual.data.every((l) => l.style?.slug == 'casual'), isTrue);
    final others = await repo.list(LookQuery(excludeId: page.data.first.id, perPage: 50));
    expect(others.data.map((l) => l.id), isNot(contains(page.data.first.id)));
    final look = await repo.get(page.data.first.id);
    expect(look.items, isNotEmpty);
    api.client.simulateOffline = true;
    expect((await repo.get(page.data.first.id)).id, look.id);
    api.client.simulateOffline = false;
    await expectLater(
      repo.get('00000000-0000-0000-0000-000000000000'),
      throwsA(isA<ApiException>().having((e) => e.code, 'code', ApiErrorCode.notFound)),
    );
  });

  group('recommandations', () {
    test('mode A : pièce de départ toujours présente, réponse rejouée hors ligne avec sa date', () async {
      final repo = ApiRecommendationRepository(api.client, cache);
      const request = FromItemRequest(clothingTypeId: shirt, colorId: white);
      final online = await repo.fromItem(request);
      expect(online.cachedAt, isNull);
      expect(online.startingItem.role, PieceRole.top);
      expect(online.results, isNotEmpty);
      for (final r in online.results) {
        expect(r.items.where((i) => i.isStartingItem).single.color.id, white);
      }
      api.client.simulateOffline = true;
      final offline = await repo.fromItem(request);
      expect(offline.cachedAt, DateTime.utc(2026, 10, 31, 10));
      expect(offline.requestId, online.requestId);
      await expectLater(
        repo.fromItem(const FromItemRequest(clothingTypeId: shirt, colorId: white, styleSlug: 'casual')),
        throwsA(isA<NetworkUnavailableException>()),
      );
    });

    test('évaluation et améliorations : avertissements typés et changements applicables', () async {
      final repo = ApiRecommendationRepository(api.client, cache);
      const request = OutfitRequest(items: [RequestItem(clothingTypeId: shirt, colorId: white, role: PieceRole.top)]);
      final evaluation = await repo.evaluate(request);
      expect(evaluation.isComplete, isFalse);
      expect(evaluation.warnings.where((w) => w.type == WarningType.structure), isNotEmpty);
      expect(evaluation.scoreBreakdown.total, evaluation.score);
      final improvements = await repo.improve(request);
      expect(improvements.improvements, isNotEmpty);
      expect(improvements.improvements.first.resultingScore, greaterThan(improvements.currentScore));
    });

    test('élément inconnu : 422 avec le champ imbriqué', () async {
      await expectLater(
        ApiRecommendationRepository(api.client, cache).evaluate(const OutfitRequest(items: [
          RequestItem(clothingTypeId: shirt, colorId: '00000000-0000-0000-0000-000000000000', role: PieceRole.top),
        ])),
        throwsA(isA<ApiException>().having((e) => e.firstErrorFor('items.0.color_id'), 'field', isNotNull)),
      );
    });

    test('feedback : compte obligatoire, 201 puis 200 au rejeu', () async {
      final repo = ApiRecommendationRepository(api.client, cache);
      final response = await repo.fromItem(const FromItemRequest(clothingTypeId: shirt, colorId: white));
      const feedback = FeedbackRequest(isHelpful: true);
      await expectLater(
        repo.sendFeedback(response.requestId, feedback),
        throwsA(isA<ApiException>().having((e) => e.code, 'code', ApiErrorCode.unauthenticated)),
      );
      await api.signIn();
      expect((await repo.sendFeedback(response.requestId, feedback)).isHelpful, isTrue);
      expect((await repo.sendFeedback(response.requestId, feedback.copyWith(rating: 4))).rating, 4);
      expect(api.backend.feedbacks, hasLength(1));
    });
  });

  group('compte', () {
    test('connexion : jeton enregistré, 15 min de vie, refresh transparent ensuite', () async {
      final auth = ApiAuthRepository(api.client, api.tokens);
      final session = await auth.login(const LoginRequest(email: MockBackend.demoEmail, password: MockBackend.demoPassword));
      expect(session.expiresIn, 900);
      expect(await api.tokens.read(), session.accessToken);
      api.backend.expireAllTokens();
      expect((await auth.me()).email, MockBackend.demoEmail);
      expect(await api.tokens.read(), isNot(session.accessToken));
    });

    test('identifiants invalides : 401 sans refresh', () async {
      await expectLater(
        ApiAuthRepository(api.client, api.tokens).login(const LoginRequest(email: MockBackend.demoEmail, password: 'faux')),
        throwsA(isA<ApiException>().having((e) => e.code, 'code', ApiErrorCode.unauthenticated)),
      );
      expect(api.backend.callCounts['POST /auth/refresh'], isNull);
    });

    test('mot de passe oublié : OTP à 6 chiffres puis connexion avec le nouveau mot de passe', () async {
      final auth = ApiAuthRepository(api.client, api.tokens);
      await auth.forgotPassword(MockBackend.demoEmail);
      await expectLater(
        auth.resetPassword(const ResetPasswordRequest(
          email: MockBackend.demoEmail,
          otp: '000000',
          password: 'nouveau-mdp-2026',
          passwordConfirmation: 'nouveau-mdp-2026',
        )),
        throwsA(isA<ApiException>().having((e) => e.firstErrorFor('otp'), 'otp', isNotNull)),
      );
      await auth.resetPassword(const ResetPasswordRequest(
        email: MockBackend.demoEmail,
        otp: MockBackend.mockOtp,
        password: 'nouveau-mdp-2026',
        passwordConfirmation: 'nouveau-mdp-2026',
      ));
      await auth.login(const LoginRequest(email: MockBackend.demoEmail, password: 'nouveau-mdp-2026'));
    });

    test('changement de mot de passe : nouveau jeton valide, les anciens sont révoqués', () async {
      final old = await api.signIn();
      final auth = ApiAuthRepository(api.client, api.tokens);
      await auth.changePassword(const ChangePasswordRequest(
        currentPassword: MockBackend.demoPassword,
        password: 'encore-un-autre-2026',
        passwordConfirmation: 'encore-un-autre-2026',
      ));
      final fresh = await api.tokens.read();
      expect(fresh, isNot(old));
      expect((await auth.me()).email, MockBackend.demoEmail);
    });

    test('nom modifiable ; suppression du compte avec mot de passe', () async {
      await api.signIn();
      final auth = ApiAuthRepository(api.client, api.tokens);
      expect((await auth.updateName('Awa K.')).name, 'Awa K.');
      await expectLater(auth.deleteAccount('mauvais'), throwsA(isA<ApiException>()));
      await auth.deleteAccount(MockBackend.demoPassword);
      expect(await api.tokens.read(), isNull);
      expect(api.backend.users, isEmpty);
    });

    test('préférences : identifiants de styles et d’occasions, updated_at nul au départ', () async {
      await api.signIn();
      final repo = ApiPreferencesRepository(api.client);
      expect((await repo.get()).updatedAt, isNull);
      final saved = await repo.update(const RemotePreferences(styleIds: ['2f2e1cea-0a8d-5e3d-b21d-2389a145e54a']));
      expect(saved.styleIds, ['2f2e1cea-0a8d-5e3d-b21d-2389a145e54a']);
      expect(saved.updatedAt, isNotNull);
      await expectLater(
        repo.update(const RemotePreferences(occasionIds: ['inconnu'])),
        throwsA(isA<ApiException>().having((e) => e.firstErrorFor('occasion_ids.0'), 'field', isNotNull)),
      );
    });
  });
}
