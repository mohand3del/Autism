

import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';

import '../model/channel_response_body.dart';

class ChannelRepo {
 final ApiService _apiService;

  ChannelRepo(this._apiService);

  Future<ApiResult<ChannelResponseBody>> getChannels({
    String? search,
    String? pageToken,
  }) async {
    try {
      final response = await _apiService.showAllChannels(
        search: search,
        pageToken: pageToken,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}