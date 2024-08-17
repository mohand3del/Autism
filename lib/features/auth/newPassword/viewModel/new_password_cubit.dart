import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/new_password_request_body.dart';
import '../data/repo/new_password_repo.dart';

part 'new_password_state.dart';
part 'new_password_cubit.freezed.dart';


class NewPasswordCubit extends Cubit<NewPasswordState> {
  final NewPasswordRepo newPasswordRepo;
  NewPasswordCubit(this.newPasswordRepo) : super(const NewPasswordState.initial());

  String? emailController;
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
  TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitNewPasswordState() async{
    emit(const NewPasswordState.loading());
    final response = await newPasswordRepo.newPassword(
        NewPasswordRequestBody(
          email:emailController,
          password:passwordController.text,
          confirmPassword:passwordConfirmationController.text,
        )
    );
    response.when(success: (newPasswordResponseBody){
      emit(NewPasswordState.success(newPasswordResponseBody));
    }, failure: (error){
      emit(NewPasswordState.error(error: error.apiErrorModel.message??" "));
    });

  }

}