

import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';
import 'package:autism/features/test/data/model/test_result_response.dart';

class TestResultRepo {
  final ApiService _apiService;
  TestResultRepo(this._apiService);

  Future<ApiResult<TestResultResponse>> getTestResult() async {
   final response = await _apiService.getTestResult();
   try {

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }



  }
}