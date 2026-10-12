import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/core/api/api_client.dart';
import 'package:herycia/core/api/api_exception.dart';
import 'package:herycia/features/account/data/api_account_repositories.dart';
import 'package:herycia/features/account/domain/account_models.dart';
import 'package:herycia/features/catalog/data/api_catalog_repository.dart';
import 'package:herycia/features/favorites/data/api_wardrobe_repositories.dart';
import 'package:herycia/features/favorites/domain/wardrobe_models.dart';
import 'package:herycia/features/looks/data/api_looks_repository.dart';
import 'package:herycia/features/looks/domain/look_models.dart';
import 'package:herycia/features/recommendation/data/api_recommendation_repository.dart';
import 'package:herycia/features/recommendation/domain/recommendation_models.dart';
import 'package:herycia/mock_backend/mock_api_client.dart';
import 'package:herycia/mock_backend/mock_backend.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late InMemoryTokenStore tokens;
  late MockApiClient client;

  setUp(() {
    tokens = InMemoryTokenStore();
    client = MockApiClient.fromBundle(rootBundle, tokenStore: tokens, latency: Duration.zero);
  });

  Future<void> login() => ApiAuthRepository(client, tokens).login(
        const LoginRequest(email: MockBackend.demoEmail, password: MockBackend.demoPassword),
      );

  group('ApiException', () {
    test('lit le format d’erreur du contrat', () {
      final e = ApiException.fromResponse(422, {
        'message': 'Certaines données sont invalides.',
        'errors': {
          'color_id': ['La couleur sélectionnée n\'est pas disponible.'],
        },
        'code': 'VALIDATION_ERROR',
      });
      expect(e.code, ApiErrorCode.validation);
      expect(e.firstErrorFor('color_id'), 'La couleur sélectionnée n\'est pas disponible.');
    });

    test('code inconnu ou corps vide : UNKNOWN sans planter', () {
      expect(ApiException.fromResponse(500, null).code, ApiErrorCode.unknown);
      expect(ApiException.fromResponse(500, {'code': 'BIZARRE'}).code, ApiErrorCode.unknown);
    });
  });

  test('hors ligne : NetworkUnavailableException, pas une erreur API', () async {
    client.offline = true;
    await expectLater(
      ApiCatalogRepository(client).colors(),
      throwsA(isA<NetworkUnavailableException>()),
    );
  });

  test('catalogue : version et guide des couleurs', () async {
    final repo = ApiCatalogRepository(client);
    final version = await repo.version();
    expect(version.rulesVersion, isNotEmpty);
    final guide = await repo.colorGuide();
    expect(guide.families, hasLength(15));
    expect(guide.principles, isNotEmpty);
    expect(await repo.colorPairingRules(), hasLength(300));
  });

  test('looks : pagination et détail', () async {
    final repo = ApiLooksRepository(client);
    final page = await repo.list(const LookQuery(perPage: 4));
    expect(page.data, hasLength(4));
    expect(page.hasMore, isTrue);
    final look = await repo.get(page.data.first.id);
    expect(look.items, isNotEmpty);
    await expectLater(
      repo.get('19'),
      throwsA(isA<ApiException>().having((e) => e.code, 'code', ApiErrorCode.notFound)),
    );
  });

  test('recommandations : aller-retour typé, puis feedback', () async {
    final repo = ApiRecommendationRepository(client);
    final result = await repo.fromItem(const FromItemRequest(clothingTypeId: '2', colorId: '11', occasionSlug: 'work'));
    expect(result.results, isNotEmpty);
    expect(result.results.every((r) => r.items.any((i) => i.isAnchor)), isTrue);

    final evaluation = await repo.evaluate(const OutfitRequest(items: [
      RequestItem(clothingTypeId: '2', colorId: '2', role: PieceRole.top),
      RequestItem(clothingTypeId: '8', colorId: '10', role: PieceRole.bottom),
      RequestItem(clothingTypeId: '17', colorId: '1', role: PieceRole.shoes),
    ]));
    expect(evaluation.score, evaluation.breakdown.total);

    final receipt = await repo.sendFeedback(result.requestId, const FeedbackRequest(isHelpful: true));
    expect(receipt.requestId, result.requestId);
  });

  group('Compte', () {
    test('connexion : le jeton est stocké ; déconnexion : il est effacé', () async {
      final auth = ApiAuthRepository(client, tokens);
      final session = await auth.login(
        const LoginRequest(email: MockBackend.demoEmail, password: MockBackend.demoPassword),
      );
      expect(await tokens.read(), session.token);
      expect((await auth.me()).email, MockBackend.demoEmail);
      await auth.logout();
      expect(await tokens.read(), isNull);
      await expectLater(
        auth.me(),
        throwsA(isA<ApiException>().having((e) => e.code, 'code', ApiErrorCode.unauthenticated)),
      );
    });

    test('déconnexion tolérante si le jeton a déjà expiré', () async {
      await tokens.write('jeton_perime');
      await ApiAuthRepository(client, tokens).logout();
      expect(await tokens.read(), isNull);
    });

    test('identifiants refusés : erreur de champ exploitable par l’écran', () async {
      await expectLater(
        ApiAuthRepository(client, tokens).login(const LoginRequest(email: MockBackend.demoEmail, password: 'faux')),
        throwsA(isA<ApiException>().having((e) => e.firstErrorFor('email'), 'email', isNotNull)),
      );
    });

    test('préférences : lecture et mise à jour', () async {
      await login();
      final repo = ApiPreferencesRepository(client);
      final prefs = await repo.get();
      final updated = await repo.update(prefs.copyWith(theme: ThemePreference.dark, silhouette: 'broad'));
      expect(updated.theme, ThemePreference.dark);
      expect(updated.silhouette, 'broad');
    });
  });

  group('Favoris et compositions', () {
    const uuid = 'c0ffee00-1234-4abc-8def-0123456789ab';

    test('enregistrement idempotent et suppression tolérante', () async {
      await login();
      final repo = ApiFavoritesRepository(client);
      const input = FavoriteInput(
        clientUuid: uuid,
        snapshot: LookSnapshot(title: 'Ma tenue', items: [
          RequestItem(clothingTypeId: '1', colorId: '2', role: PieceRole.top),
        ]),
      );
      final first = await repo.save(input);
      final second = await repo.save(input);
      expect(second.id, first.id);
      await repo.delete(uuid);
      await repo.delete(uuid);
      expect((await repo.list()).where((f) => f.clientUuid == uuid), isEmpty);
    });

    test('conflit de composition : ApiException CONFLICT', () async {
      await login();
      final repo = ApiSavedOutfitsRepository(client);
      final existing = (await repo.list()).first;
      await expectLater(
        repo.update(
          existing.clientUuid,
          SavedOutfitInput(
            clientUuid: existing.clientUuid,
            composition: existing.composition,
            baseUpdatedAt: existing.updatedAt.subtract(const Duration(days: 1)),
          ),
        ),
        throwsA(isA<ApiException>().having((e) => e.code, 'code', ApiErrorCode.conflict)),
      );
    });
  });
}
