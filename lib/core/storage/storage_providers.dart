import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../api/api_client.dart';
import 'app_database.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase(driftDatabase(name: 'herycia'));
  ref.onDispose(db.close);
  return db;
});

class SecureTokenStore implements TokenStore {
  SecureTokenStore([FlutterSecureStorage? storage]) : _storage = storage ?? const FlutterSecureStorage();

  static const _key = 'auth_token';

  final FlutterSecureStorage _storage;
  String? _cache;
  bool _loaded = false;

  @override
  Future<String?> read() async {
    if (_loaded) return _cache;
    try {
      _cache = await _storage.read(key: _key);
    } on PlatformException {
      _cache = null;
    } on MissingPluginException {
      _cache = null;
    }
    _loaded = true;
    return _cache;
  }

  @override
  Future<void> write(String? token) async {
    _cache = token;
    _loaded = true;
    try {
      if (token == null) {
        await _storage.delete(key: _key);
      } else {
        await _storage.write(key: _key, value: token);
      }
    } on PlatformException {
      return;
    } on MissingPluginException {
      return;
    }
  }
}
