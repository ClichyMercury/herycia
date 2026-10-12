import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../design_system/gallery/design_system_gallery.dart';
import '../features/account/presentation/auth_screens.dart';
import '../features/account/presentation/info_screens.dart';
import '../features/account/presentation/preferences_screen.dart';
import '../features/account/presentation/profile_screen.dart';
import '../features/favorites/presentation/saved_outfits_screen.dart';
import '../features/color_guide/presentation/color_guide_screens.dart';
import '../features/compose_from_item/presentation/from_item_results_screen.dart';
import '../features/compose_from_item/presentation/from_item_screen.dart';
import '../features/compose_outfit/presentation/compose_outfit_screen.dart';
import '../features/compose_outfit/presentation/evaluation_screen.dart';
import '../features/favorites/presentation/favorites_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/looks/presentation/look_detail_screen.dart';
import '../features/looks/presentation/look_view.dart';
import '../features/shell/presentation/app_shell.dart';
import '../features/splash/presentation/splash_screen.dart';

abstract final class AppRoutes {
  static const splash = '/splash';
  static const compose = '/compose';
  static const composeOutfit = '/compose/outfit';
  static const evaluation = '/compose/outfit/evaluation';
  static const fromItem = '/compose/from-item';
  static const fromItemResults = '/compose/from-item/results';
  static const look = '/look';
  static const colorGuide = '/compose/color-guide';
  static const colorGuidePrinciples = '/compose/color-guide/principles';

  static String colorFamily(String slug) => '/compose/color-guide/family/$slug';

  static String lookById(String id) => '/looks/$id';
  static const favorites = '/favorites';
  static const profile = '/profile';
  static const designSystem = '/profile/design-system';
  static const login = '/profile/login';
  static const register = '/profile/register';
  static const forgotPassword = '/profile/forgot-password';
  static const resetPassword = '/profile/reset-password';
  static const preferences = '/profile/preferences';
  static const savedOutfits = '/profile/saved-outfits';
  static const privacy = '/profile/privacy';
  static const about = '/profile/about';
}

final showDevToolsProvider = Provider<bool>((ref) => kDebugMode);

final initialLocationProvider = Provider<String>((ref) => AppRoutes.splash);

final routerProvider = Provider<GoRouter>((ref) {
  final showDevTools = ref.watch(showDevToolsProvider);
  final router = GoRouter(
    initialLocation: ref.watch(initialLocationProvider),
    routes: [
      GoRoute(path: AppRoutes.splash, builder: (context, state) => const SplashScreen()),
      GoRoute(
        path: AppRoutes.look,
        builder: (context, state) => LookDetailScreen(look: state.extra! as LookView),
      ),
      GoRoute(
        path: '/looks/:id',
        builder: (context, state) => LookByIdScreen(id: state.pathParameters['id']!),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => AppShell(navigationShell: shell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.compose,
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: 'color-guide',
                  builder: (context, state) => const ColorGuideScreen(),
                  routes: [
                    GoRoute(
                      path: 'principles',
                      builder: (context, state) => const PrinciplesScreen(),
                    ),
                    GoRoute(
                      path: 'family/:slug',
                      builder: (context, state) => ColorFamilyScreen(slug: state.pathParameters['slug']!),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'from-item',
                  builder: (context, state) => const FromItemScreen(),
                  routes: [
                    GoRoute(
                      path: 'results',
                      builder: (context, state) => const FromItemResultsScreen(),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'outfit',
                  builder: (context, state) => const ComposeOutfitScreen(),
                  routes: [
                    GoRoute(
                      path: 'evaluation',
                      builder: (context, state) => const EvaluationScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.favorites,
              builder: (context, state) => const FavoritesScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.profile,
              builder: (context, state) => ProfileScreen(showDevTools: showDevTools),
              routes: [
                GoRoute(path: 'login', builder: (context, state) => const LoginScreen()),
                GoRoute(path: 'register', builder: (context, state) => const RegisterScreen()),
                GoRoute(path: 'forgot-password', builder: (context, state) => const ForgotPasswordScreen()),
                GoRoute(
                  path: 'reset-password',
                  builder: (context, state) => ResetPasswordScreen(email: state.extra as String?),
                ),
                GoRoute(path: 'preferences', builder: (context, state) => const PreferencesScreen()),
                GoRoute(path: 'saved-outfits', builder: (context, state) => const SavedOutfitsScreen()),
                GoRoute(path: 'privacy', builder: (context, state) => const PrivacyScreen()),
                GoRoute(path: 'about', builder: (context, state) => const AboutScreen()),
                if (showDevTools)
                  GoRoute(
                    path: 'design-system',
                    builder: (context, state) => const DesignSystemGallery(),
                  ),
              ],
            ),
          ]),
        ],
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});
