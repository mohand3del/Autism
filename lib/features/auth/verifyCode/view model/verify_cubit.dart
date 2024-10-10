import 'package:autism/features/auth/verifyCode/data/model/verify_request_body.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/repo/verify_repo.dart';

part 'verify_state.dart';
part 'verify_cubit.freezed.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit(this._verifyRepo) : super(const VerifyState.initial());
  final VerifyRepo _verifyRepo;
  String? emailController;
  String? codeController;
  TextEditingController code =TextEditingController();
  final formKey = GlobalKey<FormState>();



  void emitVerifyState ()async {
    emit(const VerifyState.loading());
    final response = await _verifyRepo.verify(
      VerifyRequestBody(email:emailController,code:codeController),
    );
    response.when(success: (verifyRequestBody) {
      emit(VerifyState.success(verifyRequestBody));
    }, failure: (error) {
      emit(VerifyState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  Future<bool> verifyCode(String otpCode) async {
    try {
      // Call the verify method of VerifyRepo
      final verificationResponse = await _verifyRepo.verify(
        VerifyRequestBody(email: emailController, code: otpCode),
      );

      // Handle successful verification
      if (verificationResponse.when(success: (verifyRequestBody) {
        return true;
      }, failure: (error) {
        return false;
      })) {
        return true;
      } else {
        // Handle failed verification (display error message)
        print('OTP code verification failed:'); // Log the error message
        return false;
      }
    } catch (error) {
      // Handle errors during communication with the backend
      print('Error verifying OTP code: $error');
      return false;
    }
  }
}
