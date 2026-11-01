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
    id: '162543d0-27c2-5a4e-ae5d-e1e64980999e',
    name: 'Bleu marine',
    slug: 'bleu-marine',
    hexCode: '#1B2A49',
    colorFamily: 'bleu',
    isNeutral: true,
  );

  static const camel = CatalogColor(
    id: 'af1ac4b5-8c3f-5418-87c0-dedb842fee78',
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
    ClothingCategory(id: 'c-top', name: 'Hauts', slug: 'hauts', groupType: CategoryGroup.top),
    ClothingCategory(id: 'c-bottom', name: 'Bas', slug: 'bas', groupType: CategoryGroup.bottom),
    ClothingCategory(id: 'c-one', name: 'Pièces complètes', slug: 'pieces-completes', groupType: CategoryGroup.onePiece),
    ClothingCategory(id: 'c-shoes', name: 'Chaussures', slug: 'chaussures', groupType: CategoryGroup.footwear),
    ClothingCategory(
      id: 'c-acc',
      name: 'Accessoires',
      slug: 'accessoires',
      groupType: CategoryGroup.accessory,
      isOptional: true,
    ),
  ];

  static const shirt = ClothingType(id: 't-shirt', categoryId: 'c-top', name: 'Chemise', slug: 'chemise');
  static const blazer = ClothingType(id: 't-blazer', categoryId: 'c-top', name: 'Blazer', slug: 'blazer');
  static const jeans = ClothingType(id: 't-jeans', categoryId: 'c-bottom', name: 'Jean', slug: 'jean');
  static const dress = ClothingType(id: 't-dress', categoryId: 'c-one', name: 'Robe', slug: 'robe', isOnePiece: true);
  static const sneakers = ClothingType(id: 't-sneakers', categoryId: 'c-shoes', name: 'Baskets', slug: 'baskets');
  static const watch = ClothingType(id: 't-watch', categoryId: 'c-acc', name: 'Montre', slug: 'montre');
  static const belt = ClothingType(id: 't-belt', categoryId: 'c-acc', name: 'Ceinture', slug: 'ceinture');

  static const typeList = [shirt, blazer, jeans, dress, sneakers, watch, belt];

  @override
  Future<List<ClothingCategory>> categories() async => categoryList;

  @override
  Future<List<ClothingType>> types({String? categoryId}) async =>
      typeList.where((t) => categoryId == null || t.categoryId == categoryId).toList();

  @override
  Future<CatalogVersion> version() async => const CatalogVersion(catalogVersion: 1, rulesVersion: 1);

  @override
  Future<ColorGuide> colorGuide() async => const ColorGuide(families: []);

  @override
  Future<List<OutfitStyle>> styles() async => const [];

  @override
  Future<List<Occasion>> occasions() async => const [];
}
