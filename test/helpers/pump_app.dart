import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/core/api/api_client.dart';
import 'package:herycia/core/api/api_exception.dart';
import 'package:herycia/core/api/api_providers.dart';
import 'package:herycia/core/storage/app_database.dart';
import 'package:herycia/core/storage/storage_providers.dart';
import 'package:herycia/design_system/design_system.dart';
import 'package:herycia/features/catalog/domain/catalog_models.dart';
import 'package:herycia/features/catalog/domain/catalog_repository.dart';
import 'package:herycia/l10n/l10n.dart';

List<Override> baseOverrides({TokenStore? tokens}) {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  return [
    appDatabaseProvider.overrideWith((ref) {
      final db = AppDatabase(NativeDatabase.memory());
      ref.onDispose(db.close);
      return db;
    }),
    tokenStoreProvider.overrideWithValue(tokens ?? InMemoryTokenStore()),
  ];
}

extension PumpApp on WidgetTester {
  Future<void> pumpDs(
    Widget child, {
    ThemeMode themeMode = ThemeMode.light,
    List<Override> overrides = const [],
    bool disableAnimations = false,
    TokenStore? tokens,
  }) {
    return pumpWidget(
      ProviderScope(
        overrides: [...baseOverrides(tokens: tokens), ...overrides],
        retry: (_, _) => null,
        child: MaterialApp(
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: themeMode,
          locale: const Locale('fr'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(disableAnimations: disableAnimations),
            child: child!,
          ),
          home: Scaffold(body: child),
        ),
      ),
    );
  }
}

class FakeCatalogRepository implements CatalogRepository {
  FakeCatalogRepository({this.failColors = false});

  bool failColors;
  int colorCalls = 0;

  static const navy = CatalogColor(
    id: '10',
    name: 'Bleu marine',
    slug: 'navy',
    hexCode: '#1F2A44',
    colorFamily: 'blue',
    isNeutral: true,
  );

  static const camel = CatalogColor(
    id: '9',
    name: 'Camel',
    slug: 'camel',
    hexCode: '#C19A6B',
    colorFamily: 'camel',
  );

  @override
  Future<List<CatalogColor>> colors() async {
    colorCalls++;
    if (failColors) {
      throw const ApiException(
        statusCode: 503,
        code: ApiErrorCode.catalogUnavailable,
        message: 'Catalogue indisponible.',
      );
    }
    return const [navy, camel];
  }

  static const categoryList = [
    ClothingCategory(id: '1', name: 'Hauts', slug: 'top', groupType: CategoryGroup.top),
    ClothingCategory(id: '2', name: 'Bas', slug: 'bottom', groupType: CategoryGroup.bottom),
    ClothingCategory(id: '3', name: 'Pièces complètes', slug: 'one-piece', groupType: CategoryGroup.onePiece),
    ClothingCategory(id: '4', name: 'Chaussures', slug: 'shoes', groupType: CategoryGroup.shoes),
    ClothingCategory(id: '5', name: 'Accessoires', slug: 'accessories', groupType: CategoryGroup.accessory, isOptional: true),
  ];

  static const shirt = ClothingType(id: '11', categoryId: '1', name: 'Chemise', slug: 'shirt');
  static const jeans = ClothingType(id: '21', categoryId: '2', name: 'Jean', slug: 'jeans');
  static const dress = ClothingType(id: '31', categoryId: '3', name: 'Robe', slug: 'dress', isOnePiece: true);
  static const sneakers = ClothingType(id: '41', categoryId: '4', name: 'Baskets', slug: 'sneakers');
  static const watch = ClothingType(id: '51', categoryId: '5', name: 'Montre', slug: 'watch');
  static const belt = ClothingType(id: '52', categoryId: '5', name: 'Ceinture', slug: 'belt');

  static const typeList = [shirt, jeans, dress, sneakers, watch, belt];

  @override
  Future<List<ClothingCategory>> categories() async => categoryList;

  @override
  Future<List<ClothingType>> types({String? categoryId}) async =>
      typeList.where((t) => categoryId == null || t.categoryId == categoryId).toList();

  @override
  Future<CatalogVersion> version() async => CatalogVersion(
        catalogVersion: 'test',
        rulesVersion: 'test',
        updatedAt: DateTime.utc(2026, 10, 12),
      );

  @override
  Future<ColorGuide> colorGuide() async => const ColorGuide(families: [], principles: []);

  @override
  Future<List<ColorPairingRule>> colorPairingRules() async => const [];

  @override
  Future<List<RecommendationRule>> recommendationRules() async => const [];

  @override
  Future<List<OutfitStyle>> styles() async => const [];

  @override
  Future<List<Occasion>> occasions() async => const [];
}
