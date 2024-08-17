

import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';

import '../model/sign_up_request_body.dart';
import '../model/sign_up_response.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignUpResponse>> signup(
      SignUpRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}