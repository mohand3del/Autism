

import 'package:autism/features/auth/login/presentation/view/login_view.dart';
import 'package:autism/features/onboarding/presentation/view/on_boarding_view.dart';
import 'package:autism/features/onboarding/view%20model/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/view/splash_screen.dart';

class AppRouter {
  static const splash = '/';
  static const onBoarding = '/onboarding';
  static const login = '/login';


  static final GoRouter router = GoRouter(
    routes:<RouteBase> [
      GoRoute(
        path: splash,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(path: onBoarding,
        builder: (context, state) {
          return const OnBoardingView();
        },
      ),
      GoRoute(path: login,
        builder: (context, state) {
          return const LoginView();
        },

      )

    ],
  );

}