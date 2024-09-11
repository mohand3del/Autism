

import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';
import 'package:autism/features/home/data/model/history_response_body.dart';

class HistoryRepo {
  final ApiService _apiService;
  HistoryRepo(this._apiService);

  Future<ApiResult<HistoryResponseBody>> getHistory() async {
    try {
      final response =  await _apiService.getHistory();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(
        ErrorHandler.handle(error),
      );
    }

  }


}