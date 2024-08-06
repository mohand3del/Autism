

import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/view/splash_screen.dart';

class AppRouter {
  static const splash = '/';


  static final GoRouter router = GoRouter(
    routes:<RouteBase> [
      GoRoute(
        path: splash,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),

    ],
  );

}