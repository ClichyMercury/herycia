import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../account/application/preferences_controller.dart';
import '../../account/application/session_controller.dart';
import '../../catalog/application/catalog_lookup.dart';
import '../../catalog/application/catalog_providers.dart';

abstract final class NativeSplashGate {
  static bool preserved = false;

  static void release() {
    if (!preserved) return;
    preserved = false;
    FlutterNativeSplash.remove();
  }
}

final splashTimingProvider = Provider<({Duration min, Duration max})>(
  (ref) => (min: const Duration(milliseconds: 1200), max: const Duration(seconds: 4)),
);

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  static const logoWidth = 662 / 4;

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool _visible = false;
  bool _slow = false;
  Timer? _slowTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NativeSplashGate.release();
      if (mounted) setState(() => _visible = true);
    });
    _start();
  }

  Future<void> _start() async {
    final timing = ref.read(splashTimingProvider);
    _slowTimer = Timer(const Duration(milliseconds: 2500), () {
      if (mounted) setState(() => _slow = true);
    });
    Future<void> settle(Future<Object?> future) => future.then((_) {}, onError: (_) {});
    final warmUp = Future.wait([
      settle(ref.read(sessionProvider.future)),
      settle(ref.read(preferencesProvider.future)),
      settle(ref.read(catalogLookupProvider.future)),
      settle(ref.read(colorGuideProvider.future)),
    ]).timeout(timing.max, onTimeout: () => const []);
    await Future.wait([warmUp, Future<void>.delayed(timing.min)]);
    if (mounted) context.go(AppRoutes.compose);
  }

  @override
  void dispose() {
    _slowTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = context.brightness == Brightness.dark;
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.background,
      body: Semantics(
        label: context.l10n.appTitle,
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                dark ? 'assets/branding/logo_dark.png' : 'assets/branding/logo.png',
                key: const ValueKey('splash-logo'),
                width: SplashScreen.logoWidth,
                excludeFromSemantics: true,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: AppSpacing.s16,
              child: AnimatedOpacity(
                opacity: _visible ? 1 : 0,
                duration: AppMotion.slow.resolve(context),
                child: Column(
                  children: [
                    const HeryciaLoader(key: ValueKey('splash-loader')),
                    if (_slow) ...[
                      const SizedBox(height: AppSpacing.s3),
                      Text(
                        context.l10n.commonSlowLoading,
                        style: context.typo.caption.copyWith(color: colors.textSecondary),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
