import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';
import 'package:autism/features/home/data/model/favorite_video_response_model.dart';

 class FavoriteVideoRepo {
  FavoriteVideoRepo(this._apiService);
  final ApiService _apiService;
  
  Future<ApiResult<FavoriteVideoResponseModel>> getFavoriteVideos(
    {
      required int skipVideo,
    }

  )async {
    try {
      final response = await _apiService.showFavoriteVideo(
        skipVideo,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}
