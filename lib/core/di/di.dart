

import 'package:autism/core/network/dio_factory.dart';
import 'package:autism/features/auth/forgetPass/view%20model/forget_cubit.dart';
import 'package:autism/features/auth/login/data/repo/login_repo.dart';
import 'package:autism/features/auth/login/view%20model/login_cubit.dart';
import 'package:autism/features/auth/newPassword/data/repo/new_password_repo.dart';
import 'package:autism/features/auth/newPassword/viewModel/new_password_cubit.dart';
import 'package:autism/features/auth/signUp/data/repo/sign_up_repo.dart';
import 'package:autism/features/auth/signUp/view%20model/sign_up_cubit.dart';
import 'package:autism/features/auth/verifyCode/data/repo/verify_repo.dart';
import 'package:autism/features/auth/verifyCode/view%20model/verify_cubit.dart';
import 'package:autism/features/community/data/repo/add_reaction_repo.dart';
import 'package:autism/features/community/data/repo/create_post_repo.dart';
import 'package:autism/features/community/data/repo/delete_reaction_repo.dart';
import 'package:autism/features/community/data/repo/show_all_posts_repo.dart';
import 'package:autism/features/community/viewModel/add_reaction_cubit/add_reaction_cubit.dart';
import 'package:autism/features/community/viewModel/create_post_cubit/create_post_cubit.dart';
import 'package:autism/features/community/viewModel/delete_reaction_cubit/delete_reaction_cubit.dart';
import 'package:autism/features/community/viewModel/show_all_post_cubit.dart';
import 'package:autism/features/home/data/repo/channel_repo.dart';
import 'package:autism/features/home/data/repo/history_repo.dart';
import 'package:autism/features/home/data/repo/video_repo.dart';
import 'package:autism/features/home/viewModel/channelCubit/channel_cubit.dart';
import 'package:autism/features/home/viewModel/exploreVideoCubit/video_by_id_cubit.dart';
import 'package:autism/features/home/viewModel/exploreVideoCubit/video_cubit.dart';
import 'package:autism/features/home/viewModel/historyCubit/history_cubit.dart';
import 'package:autism/features/resource/data/repo/resource_repo.dart';
import 'package:autism/features/resource/viewModel/resource_cubit.dart';
import 'package:autism/features/test/data/repo/form_repo.dart';
import 'package:autism/features/test/data/repo/tell_about_repo.dart';
import 'package:autism/features/test/data/repo/test_result_repo.dart';
import 'package:autism/features/test/viewModel/form_cubit/form_cubit.dart';
import 'package:autism/features/test/viewModel/tell_about_cubit/tell_about_cubit.dart';
import 'package:autism/features/test/viewModel/test_result_cubit/test_result_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/forgetPass/data/repo/forget_repo.dart';
import '../network/api_service.dart';

final getIt = GetIt.instance;



Future<void> setupGetIt() async {

  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));

  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  //forget password
  getIt.registerLazySingleton<ForgetRepo>(() => ForgetRepo(getIt()));
  getIt.registerFactory<ForgetCubit>(() => ForgetCubit(getIt()));
  //verify code
  getIt.registerFactory<VerifyCubit>(() => VerifyCubit(getIt()));
  getIt.registerLazySingleton<VerifyRepo>(() => VerifyRepo(getIt()));
  //new password
  getIt.registerFactory<NewPasswordCubit>(() => NewPasswordCubit(getIt()));
  getIt.registerLazySingleton<NewPasswordRepo>(() => NewPasswordRepo(getIt()));
  //video
  getIt.registerLazySingleton<VideoRepo>(() => VideoRepo(getIt()));
  getIt.registerFactory<VideoCubit>(() => VideoCubit(getIt()));
  //channel
  getIt.registerLazySingleton<ChannelRepo>(() => ChannelRepo(getIt()));
  getIt.registerFactory<ChannelCubit>(() => ChannelCubit(getIt()));

  //getIt.registerLazySingleton<VideoRepo>(() => VideoRepo(getIt()));
  getIt.registerFactory<VideoByIdCubit>(() => VideoByIdCubit(getIt()));

  //history
  getIt.registerFactory<HistoryCubit>(() => HistoryCubit(getIt()));
  getIt.registerLazySingleton<HistoryRepo>(() => HistoryRepo(getIt()));

  //tell about
  getIt.registerFactory<TellAboutCubit>(() => TellAboutCubit(getIt()));
  getIt.registerLazySingleton<TellAboutRepo>(() => TellAboutRepo(getIt()));
  //form
  getIt.registerFactory<FormCubit>(() => FormCubit(FormRepo(getIt())));
  getIt.registerLazySingleton<FormRepo>(() => FormRepo(getIt()));
  //test
  getIt.registerFactory<TestResultCubit>(() => TestResultCubit(getIt()));
  getIt.registerLazySingleton<TestResultRepo>(() => TestResultRepo(getIt()));
  //resources
  getIt.registerLazySingleton<ResourceRepo>(() => ResourceRepo(getIt()));
  getIt.registerFactory<ResourceCubit>(() => ResourceCubit(getIt()));
  //community
  getIt.registerLazySingleton<  ShowAllPostsRepo>(() => ShowAllPostsRepo(getIt()));
  getIt.registerFactory<ShowAllPostCubit>(() => ShowAllPostCubit(getIt()));

  //create post
   getIt.registerLazySingleton<CreatePostRepo>(() => CreatePostRepo(getIt()));
   getIt.registerFactory<CreatePostCubit>(() => CreatePostCubit(getIt()));
   //add reaction
   getIt.registerLazySingleton<AddReactionRepo>(() => AddReactionRepo(getIt()));
  getIt.registerFactory<AddReactionCubit>(() => AddReactionCubit(getIt()));
  //delete reaction
  getIt.registerLazySingleton<DeleteReactionRepo>(() => DeleteReactionRepo(getIt()));
  getIt.registerFactory<DeleteReactionCubit>(() => DeleteReactionCubit(getIt()));











}