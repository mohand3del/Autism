import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';

import '../model/video_by_id_response_body.dart';
import '../model/video_response_body.dart';

class VideoRepo {
  final ApiService _apiService;

  VideoRepo(this._apiService);

  Future<ApiResult<VideoResponseBody>> getVideos({
    String? search,
    String? pageToken,
    String? videoDuration,
    String? videoCategoryId,
  }) async {
    try {
      final response = await _apiService.showAllVideos(
        search: search,
        pageToken: pageToken,
        videoDuration: videoDuration,
        videoCategoryId: videoCategoryId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  Future<ApiResult<VideoByIdResponseBody>> getVideoById({
    String? videoId
}) async {
    try{
      final response = await _apiService.getVideoById(videoId: videoId);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }

  }
}