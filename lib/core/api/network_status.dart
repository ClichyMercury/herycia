import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../mock_backend/mock_api_client.dart';
import 'api_providers.dart';

class SimulatedOffline extends Notifier<bool> {
  @override
  bool build() => false;

  void set(bool offline) {
    final client = ref.read(apiClientProvider);
    if (client is MockApiClient) client.offline = offline;
    state = offline;
  }
}

final offlineProvider = NotifierProvider<SimulatedOffline, bool>(SimulatedOffline.new);
