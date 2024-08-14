

import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';
import 'package:autism/features/auth/verifyCode/data/model/verify_request_body.dart';
import 'package:autism/features/auth/verifyCode/data/model/verify_response_body.dart';

class VerifyRepo{
  ApiService _apiService;

  VerifyRepo(this._apiService);


  Future<ApiResult<VerifyResponseBody>>verify(VerifyRequestBody verifyRequestBody)async{
    try{
      final response = await _apiService.verifyCode(verifyRequestBody);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }

  }


}