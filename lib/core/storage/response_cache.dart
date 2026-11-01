import 'dart:convert';

import '../api/api_exception.dart';
import 'app_database.dart';

class CachedBody {
  const CachedBody(this.body, {this.cachedAt});

  final Object? body;
  final DateTime? cachedAt;

  bool get fromCache => cachedAt != null;
}

bool isOfflineFailure(Object error) =>
    error is NetworkUnavailableException ||
    (error is ApiException && (error.code == ApiErrorCode.catalogUnavailable || error.code == ApiErrorCode.internal));

class ResponseCache {
  ResponseCache(this.db, {DateTime Function()? clock}) : clock = clock ?? (() => DateTime.now().toUtc());

  final AppDatabase db;
  final DateTime Function() clock;

  Future<CachedBody?> read(String key) async {
    final row = await db.cached(key);
    if (row == null) return null;
    try {
      return CachedBody(jsonDecode(row.body), cachedAt: row.savedAt.toUtc());
    } on FormatException {
      return null;
    }
  }

  Future<void> write(String key, Object? body) => db.writeCached(key, jsonEncode(body), clock());

  Future<void> invalidate(String prefix) => db.deleteCachedPrefix(prefix);

  Future<CachedBody> networkFirst(String key, Future<Object?> Function() fetch) async {
    try {
      final body = await fetch();
      await write(key, body);
      return CachedBody(body);
    } catch (error) {
      if (!isOfflineFailure(error)) rethrow;
      final cached = await read(key);
      if (cached == null) rethrow;
      return cached;
    }
  }
}

String canonicalKey(Object? value) => jsonEncode(_sorted(value));

Object? _sorted(Object? value) => switch (value) {
      Map<String, dynamic> map => {
          for (final key in map.keys.toList()..sort())
            if (map[key] != null) key: _sorted(map[key]),
        },
      List<dynamic> list => [for (final item in list) _sorted(item)],
      _ => value,
    };
