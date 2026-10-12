import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../mock_backend/mock_api_client.dart';
import '../storage/storage_providers.dart';
import 'api_client.dart';

final tokenStoreProvider = Provider<TokenStore>((ref) => SecureTokenStore());

final apiClientProvider = Provider<ApiClient>(
  (ref) => MockApiClient.fromBundle(rootBundle, tokenStore: ref.watch(tokenStoreProvider)),
);
