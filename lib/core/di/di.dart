

import 'package:autism/core/network/dio_factory.dart';
import 'package:autism/features/auth/login/data/repo/login_repo.dart';
import 'package:autism/features/auth/login/view%20model/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../network/api_service.dart';

final getIt = GetIt.instance;



Future<void> setupGetIt() async {

  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

}