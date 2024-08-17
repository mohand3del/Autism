import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';

import '../model/new_password_request_body.dart';
import '../model/new_password_response_body.dart';

class NewPasswordRepo {

  final ApiService _apiService;

  NewPasswordRepo(this._apiService);
  Future<ApiResult<NewPasswordResponseBody>>newPassword(NewPasswordRequestBody newPasswordRequestBody)async{
    try{
      final response = await _apiService.newPassword(newPasswordRequestBody);
      return ApiResult.success(response);

    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}