

import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';
import 'package:autism/features/test/data/model/tell_about_request_body.dart';
import 'package:autism/features/test/data/model/tell_about_response_body.dart';

class TellAboutRepo {
  final ApiService _apiService;

  TellAboutRepo(this._apiService);

  Future<ApiResult<TellAboutResponseBody>> tellAbout(TellAboutRequestBody tellAboutRequestBody) async {
    try {
      final response = await _apiService.tellAbout(tellAboutRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}