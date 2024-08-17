



import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';

import '../model/forget_request_body.dart';
import '../model/forget_response_body.dart';

class ForgetRepo {
  ApiService _apiService;

  ForgetRepo(this._apiService);
  Future<ApiResult<ForgetResponseBody>> forgot(ForgetRequestBody forgotRequestBody)async{

    try {
      final response = await _apiService.forgetPassword(forgotRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}