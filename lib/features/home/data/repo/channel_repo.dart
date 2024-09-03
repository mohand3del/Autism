

import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';
import 'package:autism/features/home/data/model/channel_by_id_response_body.dart';


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


 Future<ApiResult<ChannelByIdResponseBody>> getChannelById({
   String? channelId
 })async {
   try {
     final response = await _apiService.getChannelById(
         channelId: channelId
     );
     return ApiResult.success(response);
   } catch (error) {
     return ApiResult.failure(ErrorHandler.handle(error));
   }
 }


  }