import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../mock_backend/mock_transport.dart';
import '../config/env.dart';
import '../storage/storage_providers.dart';
import 'api_client.dart';
import 'dio_transport.dart';

final tokenStoreProvider = Provider<TokenStore>((ref) => SecureTokenStore());

final apiTransportProvider = Provider<ApiTransport>(
  (ref) => Env.useMockApi ? MockTransport.fromBundle(rootBundle) : DioTransport(baseUrl: Env.apiBaseUrl),
);

final apiClientProvider = Provider<ApiClient>(
  (ref) => HttpApiClient(ref.watch(apiTransportProvider), ref.watch(tokenStoreProvider)),
);
