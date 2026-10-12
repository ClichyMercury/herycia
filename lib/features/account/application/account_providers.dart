import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_providers.dart';
import '../data/api_account_repositories.dart';
import '../domain/account_repositories.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => ApiAuthRepository(ref.watch(apiClientProvider), ref.watch(tokenStoreProvider)),
);

final preferencesRepositoryProvider = Provider<PreferencesRepository>(
  (ref) => ApiPreferencesRepository(ref.watch(apiClientProvider)),
);
