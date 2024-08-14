

import 'package:autism/core/di/di.dart';
import 'package:autism/features/auth/forgetPass/presentation/views/forget_view.dart';
import 'package:autism/features/auth/login/presentation/view/login_view.dart';
import 'package:autism/features/auth/login/view%20model/login_cubit.dart';
import 'package:autism/features/auth/signUp/presentation/views/sign_up_view.dart';
import 'package:autism/features/auth/signUp/view%20model/sign_up_cubit.dart';
import 'package:autism/features/auth/verifyCode/presentation/views/verify_code_view.dart';
import 'package:autism/features/onboarding/presentation/view/on_boarding_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/forgetPass/view model/forget_cubit.dart';
import '../../features/auth/verifyCode/view model/verify_cubit.dart';
import '../../features/splash/presentation/view/splash_screen.dart';

class AppRouter {
  static const splash = '/';
  static const onBoarding = '/onboarding';
  static const login = '/login';
  static const signUp = '/signUp';
  static const forgetPass = '/forgetPass';
  static const verifyCode = '/verifyCode';


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
          return BlocProvider(
          create: (context) => LoginCubit(getIt()),
            child:
               const LoginView(),);
            }
          ),
      GoRoute(path: signUp,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SignUpCubit(getIt()),
            child:
            const SignUpView(),);
        }
      ),
      GoRoute(path:forgetPass,
        builder: (context, state) {
          return  BlocProvider(
              create: (context) => ForgetCubit(getIt()),
              child: const ForgetView());
        }
      ),
      GoRoute(path: verifyCode,
        builder: (context, state) {
          final String email = state.extra as String;
          return  BlocProvider(
              create: (context) => VerifyCubit(getIt()),
              child: VerifyCodeView(email: email,));
        }
      ),


    ],);



}