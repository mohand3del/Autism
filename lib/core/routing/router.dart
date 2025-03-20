import 'package:autism/core/di/di.dart';
import 'package:autism/features/auth/forgetPass/presentation/views/forget_view.dart';
import 'package:autism/features/auth/login/presentation/view/login_view.dart';
import 'package:autism/features/auth/login/view%20model/login_cubit.dart';
import 'package:autism/features/auth/newPassword/presentation/views/new_password_view.dart';
import 'package:autism/features/auth/signUp/presentation/views/sign_up_view.dart';
import 'package:autism/features/auth/signUp/view%20model/sign_up_cubit.dart';
import 'package:autism/features/auth/verifyCode/presentation/views/verify_code_view.dart';
import 'package:autism/features/community/presentation/view/comment_view.dart';
import 'package:autism/features/community/presentation/view/community_view.dart';
import 'package:autism/features/community/presentation/view/create_post_view.dart';
import 'package:autism/features/community/presentation/view/search_view.dart';
import 'package:autism/features/community/viewModel/create_post_cubit/create_post_cubit.dart';
import 'package:autism/features/community/viewModel/show_all_post_cubit.dart';
import 'package:autism/features/home/presentation/views/channel_info_view.dart';
import 'package:autism/features/home/presentation/views/channel_view.dart';
import 'package:autism/features/home/presentation/views/explore_view.dart';
import 'package:autism/features/home/presentation/views/history_view.dart';
import 'package:autism/features/home/presentation/views/home_view.dart';
import 'package:autism/features/home/presentation/views/video_view.dart';
import 'package:autism/features/home/viewModel/channelCubit/channel_cubit.dart';
import 'package:autism/features/home/viewModel/exploreVideoCubit/video_by_id_cubit.dart';
import 'package:autism/features/home/viewModel/exploreVideoCubit/video_cubit.dart';
import 'package:autism/features/home/viewModel/historyCubit/history_cubit.dart';
import 'package:autism/features/layout/view/layout_view.dart';
import 'package:autism/features/layout/viewModel/layout_cubit.dart';
import 'package:autism/features/onboarding/presentation/view/on_boarding_view.dart';
import 'package:autism/features/profile/presentation/view/contact_view.dart';
import 'package:autism/features/profile/presentation/view/edit_profile_view.dart';
import 'package:autism/features/profile/presentation/view/fqas_view.dart';
import 'package:autism/features/profile/presentation/view/profile_view.dart';
import 'package:autism/features/profile/viewModel/contactCubit/cubit/contact_info_cubit.dart';
import 'package:autism/features/profile/viewModel/profileCubit/editCubit/edit_profile_cubit.dart';
import 'package:autism/features/profile/viewModel/profileCubit/profile_cubit.dart';
import 'package:autism/features/resource/presentation/view/resource_view.dart';
import 'package:autism/features/resource/viewModel/resource_cubit.dart';
import 'package:autism/features/test/presentation/view/autism_result_view.dart';
import 'package:autism/features/test/presentation/view/choose_test_view.dart';
import 'package:autism/features/test/presentation/view/non_autism_view.dart';
import 'package:autism/features/test/presentation/view/on_boarding_test_view.dart';
import 'package:autism/features/test/presentation/view/tell_us_about_view.dart';
import 'package:autism/features/test/presentation/view/test_result_view.dart';
import 'package:autism/features/test/presentation/view/waiting_view.dart';
import 'package:autism/features/test/viewModel/tell_about_cubit/tell_about_cubit.dart';
import 'package:autism/features/test/viewModel/test_cubit.dart';
import 'package:autism/features/test/viewModel/test_result_cubit/test_result_cubit.dart';
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
  static const String history = "/history";
  static const String waiting = "/waiting";
  static const String autismTestResult = "/autismTestResult";
  static const String nonAutismTestResult = "/nonAutismTestResult";
  static const String testResult = "/testResult";
  static const String resources = "/resource";
  static const String community = "/community";
  static const String comment = "/comment";
  static const String createPost = "/createPost";
  static const String search = "/search";
  static const String profile = "/profile";
  static const String setting = "/setting";
  static const String about = "/about";
  static const String privacy = "/privacy";
  static const String faqs = "/faqs";
  static const String verifyCertificate = "/verifyCertificate";
  static const String contactInformation = "/contactInformation";
  static const String editProfile = "/editProfile";
  static const String fqas = "/fqas";

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
              BlocProvider(
                  create: (context) => getIt<HistoryCubit>()..getHistory(0)),
              BlocProvider(
                  create: (context) =>
                      getIt<ResourceCubit>()..fetchResources()),
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
          final videoId = state.extra as String?;
          if (videoId != null) {
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
                videoId: videoId,
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Text('No video ID provided!'),
              ),
            );
          }
        },
      ),
      GoRoute(
          path: channelInfo,
          builder: (context, state) {
            final channelId = state.extra as String;

            return BlocProvider(
                create: (BuildContext context) =>
                    getIt<ChannelCubit>()..getChannelById(channelId: channelId),
                child: ChannelInfoView(
                  channelId: channelId,
                ));
          }),
      GoRoute(
          path: chooseTest,
          builder: (context, state) {
            return BlocProvider(
                create: (BuildContext context) {
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
      GoRoute(
          path: tellAbout,
          builder: (context, state) {
            return BlocProvider<TellAboutCubit>(
                create: (BuildContext context) => TellAboutCubit(getIt()),
                child: const TellUsAboutView());
          }),
      GoRoute(
          path: history,
          builder: (context, state) {
            int historySkip = 0;
            return BlocProvider(
                create: (BuildContext context) =>
                    getIt<HistoryCubit>()..getHistory(historySkip),
                child: const HistoryView());
          }),
      GoRoute(
          path: waiting,
          builder: (context, state) {
            return const WaitingView();
          }),
      GoRoute(
          path: autismTestResult,
          builder: (context, state) {
            return const AutismResultView();
          }),
      GoRoute(
          path: nonAutismTestResult,
          builder: (context, state) {
            return const NonAutismView();
          }),
      GoRoute(
          path: testResult,
          builder: (context, state) {
            return BlocProvider(
                create: (BuildContext context) =>
                    getIt<TestResultCubit>()..getTestResult(),
                child: const TestResultView());
          }),
      GoRoute(
          path: resources,
          builder: (context, state) {
            return BlocProvider(
                create: (BuildContext context) =>
                    getIt<ResourceCubit>()..fetchResources(),
                child: const ResourceView());
          }),
      GoRoute(
          path: community,
          builder: (context, state) {
            return BlocProvider(
                create: (BuildContext context) =>
                    getIt<ShowAllPostCubit>()..showAllPosts(),
                child: const CommunityView());
          }),
      GoRoute(
          path: comment,
          builder: (context, state) {
            final postId = state.extra as String;
            return CommentView(
              postId: postId,
            );
          }),
      GoRoute(
          path: createPost,
          builder: (context, state) {
            return const CreatePostView();
          }),
      GoRoute(
          path: search,
          builder: (context, state) {
            return const SearchView();
          }),
      GoRoute(
          path: profile,
          builder: (context, state) {
            return const ProfileView();
          }),
      GoRoute(
          path: editProfile,
          builder: (context, state) {
            return MultiBlocProvider(providers: [
              BlocProvider(
                create: (BuildContext context) => getIt<ProfileCubit>(),
              ),
              BlocProvider(
                create: (BuildContext context) => getIt<EditProfileCubit>(),
              ),
            ], child: const EditProfileView());
          }),
      GoRoute(
        path: contactInformation,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => getIt<ProfileCubit>(),
              ),
              BlocProvider(
                create: (BuildContext context) => getIt<ContactInfoCubit>(),
              ),
            ],
            child: ContactView(),
          );
        },
      ),
      GoRoute(
        path: fqas,
        builder: (context, state) {
          return FqasView();
        },
      )
    ],
  );
}
