import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../account/application/preferences_controller.dart';
import '../domain/body_silhouette.dart';

class SilhouetteController extends Notifier<BodySilhouette> {
  @override
  BodySilhouette build() {
    final slug = ref.watch(preferencesProvider).value?.silhouette;
    return BodySilhouette.values.where((s) => s.name == slug).firstOrNull ?? BodySilhouette.straight;
  }

  void select(BodySilhouette silhouette) {
    state = silhouette;
    ref.read(preferencesProvider.notifier).change((p) => p.copyWith(silhouette: silhouette.name));
  }
}

final silhouetteProvider = NotifierProvider<SilhouetteController, BodySilhouette>(
  SilhouetteController.new,
);
