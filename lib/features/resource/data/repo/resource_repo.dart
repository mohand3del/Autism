

import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';
import 'package:autism/features/resource/data/model/recource_response_body.dart';

class ResourceRepo {
  final ApiService _apiService;
  ResourceRepo(this._apiService);

  Future<ApiResult<ResourceResponseBody>> getResource({required int page}) async {
    try {
      final response = await _apiService.showAllWebsites(
        page: page,
      );

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}