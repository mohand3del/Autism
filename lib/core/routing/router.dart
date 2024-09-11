import 'package:autism/core/di/di.dart';
import 'package:autism/features/auth/forgetPass/presentation/views/forget_view.dart';
import 'package:autism/features/auth/login/presentation/view/login_view.dart';
import 'package:autism/features/auth/login/view%20model/login_cubit.dart';
import 'package:autism/features/auth/newPassword/presentation/views/new_password_view.dart';
import 'package:autism/features/auth/signUp/presentation/views/sign_up_view.dart';
import 'package:autism/features/auth/signUp/view%20model/sign_up_cubit.dart';
import 'package:autism/features/auth/verifyCode/presentation/views/verify_code_view.dart';
import 'package:autism/features/home/data/model/video_by_id_response_body.dart';
import 'package:autism/features/home/data/model/video_response_body.dart';
import 'package:autism/features/home/presentation/views/channel_info_view.dart';
import 'package:autism/features/home/presentation/views/channel_view.dart';
import 'package:autism/features/home/presentation/views/explore_view.dart';
import 'package:autism/features/home/presentation/views/home_view.dart';
import 'package:autism/features/home/presentation/views/video_view.dart';
import 'package:autism/features/home/viewModel/channelCubit/channel_cubit.dart';
import 'package:autism/features/home/viewModel/exploreVideoCubit/video_by_id_cubit.dart';
import 'package:autism/features/home/viewModel/exploreVideoCubit/video_cubit.dart';
import 'package:autism/features/layout/view/layout_view.dart';
import 'package:autism/features/layout/viewModel/layout_cubit.dart';
import 'package:autism/features/onboarding/presentation/view/on_boarding_view.dart';
import 'package:autism/features/test/presentation/view/choose_test_view.dart';
import 'package:autism/features/test/presentation/view/on_boarding_test_view.dart';
import 'package:autism/features/test/presentation/view/tell_us_about_view.dart';
import 'package:autism/features/test/presentation/view/widget/onboarding_test.dart';
import 'package:autism/features/test/viewModel/test_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/forgetPass/view model/forget_cubit.dart';
import '../../features/auth/newPassword/viewModel/new_password_cubit.dart';
import '../../features/auth/verifyCode/view model/verify_cubit.dart';
import '../../features/splash/presentation/view/splash_screen.dart';



class AppRouter {
  static const splash = '/';
  static const onBoarding = '/onboarding';
  static const login = '/login';
  static const signUp = '/signUp';
  static const forgetPass = '/forgetPass';
  static const verifyCode = '/verifyCode';
  static const newPassword = '/newPassword';
  static const home = "/home";
  static const String layout = "/layout";
  static const String explore = "/explore";
  static const String channel = "/channel";
  static const String video = "/video";
  static const String channelInfo = "/channelInfo";
  static const String onboardingTest = "/onboardingTest";
  static const String chooseTest = "/chooseTest";
  static const String tellAbout = "/tellAbout";

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: splash,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: onBoarding,
        builder: (context, state) {
          return const OnBoardingView();
        },
      ),
      GoRoute(
          path: login,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => LoginCubit(getIt()),
              child: const LoginView(),
            );
          }),
      GoRoute(
          path: signUp,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => SignUpCubit(getIt()),
              child: const SignUpView(),
            );
          }),
      GoRoute(
          path: forgetPass,
          builder: (context, state) {
            return BlocProvider(
                create: (context) => ForgetCubit(getIt()),
                child: const ForgetView());
          }),
      GoRoute(
          path: verifyCode,
          builder: (context, state) {
            final String email = state.extra as String;
            return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => VerifyCubit(getIt()),
                  ),
                  BlocProvider(
                    create: (context) => ForgetCubit(getIt()),
                  ),
                ],
                child: VerifyCodeView(
                  email: email,
                ));
          }),
      GoRoute(
          path: newPassword,
          builder: (context, state) {
            final String email;
            email = state.extra as String;
            return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => NewPasswordCubit(getIt()),
                  ),
                  BlocProvider(
                    create: (context) => ForgetCubit(getIt()),
                  ),
                ],
                child: NewPasswordView(
                  email: email,
                ));
          }),
      GoRoute(
          path: home,
          builder: (context, state) {
            return const HomeView();
          }),
      GoRoute(
          path: layout,
          builder: (context, state) {
            return MultiBlocProvider(providers: [
              BlocProvider(
                create: (context) => LayoutCubit(),
              ),
              BlocProvider(
                create: (context) => getIt<VideoCubit>()..getVideos(),
              ),
              BlocProvider(
                create: (context) => getIt<ChannelCubit>()..getChannels(),
              ),
            ], child: const LayoutView());
          }),
      GoRoute(
          path: explore,
          builder: (context, state) {
            return BlocProvider(
                create: (BuildContext context) =>
                    getIt<VideoCubit>()..getVideos(),
                child: const ExploreView());
          }),
      GoRoute(
          path: channel,
          builder: (context, state) {
            return BlocProvider(
                create: (BuildContext context) =>
                    getIt<ChannelCubit>()..getChannels(),
                child: const ChannelView());
          }),
      GoRoute(
          path: video,
          builder: (context, state) {

            final fullDatum = state.extra as FullDatum;

            return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (BuildContext context) => getIt<VideoByIdCubit>(),
                  ),
                  BlocProvider(
                    create: (context) => getIt<VideoCubit>()..getVideos(),
                  ),
                ],
                child: VideoView(
                  fullData: fullDatum,
                ));
          }),
      GoRoute(
          path: channelInfo,
          builder: (context, state) {
           final channelId = state.extra as String;

            return BlocProvider(
                create: (BuildContext context) =>
                getIt<ChannelCubit>()..getChannelById(channelId: channelId),
                child:  ChannelInfoView(channelId: channelId,));
          }),
      GoRoute(path: chooseTest, builder: (context, state) {

        return BlocProvider(create: (BuildContext context) {

          return TestingCubit();
        },
        child: const ChooseTestView());
      }),
      GoRoute(
        path: onboardingTest,
        builder: (context, state) {
          return const OnBoardingTestView();
        },
      ),
      GoRoute(path: tellAbout, builder: (context, state) {

        return const TellUsAboutView();
      })




    ],
  );
}
