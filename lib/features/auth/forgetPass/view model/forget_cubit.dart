import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/forget_request_body.dart';
import '../data/repo/forget_repo.dart';

part 'forget_state.dart';
part 'forget_cubit.freezed.dart';

class ForgetCubit extends Cubit<ForgetState> {
  final ForgetRepo _forgetRepo;
  ForgetCubit(this._forgetRepo) : super(const ForgetState.initial());


  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  void emitForgetState ()async {
    emit(const ForgetState.loading());
    final response = await _forgetRepo.forgot(
        ForgetRequestBody(email: emailController.text)
    );
    response.when(success: (forgotResponseBody) {
      emit(ForgetState.success(forgotResponseBody));
    }, failure: (error) {
      emit(ForgetState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
