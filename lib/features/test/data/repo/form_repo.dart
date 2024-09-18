

import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';
import 'package:autism/features/test/data/model/form_request_body.dart';
import 'package:autism/features/test/data/model/form_response_body.dart';

class FormRepo {
 final ApiService _apiService;
  FormRepo(this._apiService);

  Future<ApiResult<FormResponseBody>> submitForm(FormRequestBody formRequestBody) async {
    try {
      final response = await _apiService.sendForm(formRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }



}