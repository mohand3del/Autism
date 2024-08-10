import 'dart:developer';

import 'package:autism/core/helper/contants.dart';
import 'package:autism/core/helper/shared_preferences_helper.dart';
import 'package:autism/core/network/dio_factory.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


import '../data/model/login_request_body.dart';
import '../data/repo/login_repo.dart';
import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (loginResponse) async {
      //await saveUserToken(loginResponse.userData?.token ?? '');
      emit(LoginState.success(loginResponse));

    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.error.toString() ?? ''));
      log('Error: ${error.apiErrorModel.error}');
    });
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
