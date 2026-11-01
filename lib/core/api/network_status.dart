import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_providers.dart';

final connectivityChangesProvider = Provider<Stream<List<ConnectivityResult>>>((ref) {
  try {
    return Connectivity().onConnectivityChanged.handleError((Object _) {});
  } on MissingPluginException {
    return const Stream.empty();
  }
});

class SimulatedOffline extends Notifier<bool> {
  @override
  bool build() => false;

  void set(bool offline) {
    ref.read(apiClientProvider).simulateOffline = offline;
    state = offline;
  }
}

final simulatedOfflineProvider = NotifierProvider<SimulatedOffline, bool>(SimulatedOffline.new);

class ResumeSignal extends Notifier<int> {
  @override
  int build() {
    final listener = AppLifecycleListener(onResume: ping);
    ref.onDispose(listener.dispose);
    return 0;
  }

  void ping() => state++;
}

final resumeSignalProvider = NotifierProvider<ResumeSignal, int>(ResumeSignal.new);

class NetworkStatus extends Notifier<bool> {
  @override
  bool build() {
    final reachability = ref.watch(apiClientProvider).reachability.listen((online) {
      if (online != state) state = online;
    });
    final connectivity = ref.watch(connectivityChangesProvider).listen((results) {
      final connected = results.any((r) => r != ConnectivityResult.none);
      if (!connected) state = false;
      if (connected && !state) state = true;
    });
    ref.onDispose(() {
      reachability.cancel();
      connectivity.cancel();
    });
    return !ref.watch(simulatedOfflineProvider);
  }
}

final isOnlineProvider = NotifierProvider<NetworkStatus, bool>(NetworkStatus.new);

final offlineProvider = Provider<bool>((ref) => !ref.watch(isOnlineProvider));
