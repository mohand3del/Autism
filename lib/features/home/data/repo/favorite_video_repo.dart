import 'dart:developer';
import 'dart:io';
import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_error_model.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';
import 'package:autism/core/network/response_model.dart';
import 'package:autism/features/home/data/model/favorite_video_response_model.dart';
import 'package:dio/dio.dart';

class FavoriteVideoRepo {
  final ApiService _apiService;

  FavoriteVideoRepo(this._apiService);

  Future<ApiResult<FavoriteVideoResponseModel>> getFavoriteVideos(
      {required int skipVideo}) async {
    try {
      final response = await _apiService.showFavoriteVideo(skipVideo);

      return ApiResult.success(response);
    } catch (error) {
      // Always use ErrorHandler.handle() for consistency
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ApiResponse>> addToFavorite(
      {required String videoId}) async {
    try {
      final response = await _apiService.addToFavorite(videoId);
      log('removeFromFavorite response: $response');
      if (response.status == 200) {
        log('Video removed from favorites successfully');
      } else {
        log('Failed to remove video from favorites: ${response.message}');
      }
      return ApiResult.success(response);
    } catch (error) {
      // Always use ErrorHandler.handle() for consistency
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ApiResponse>> removeFromFavorite(
      {required String videoId}) async {
    try {
      final response = await _apiService.removeFromFavorite(videoId);
      log('removeFromFavorite response: $response');
      if (response.status == 200) {
        log('Video removed from favorites successfully');
      } else {
        log('Failed to remove video from favorites: ${response.message}');
      }
      return ApiResult.success(response);
    } catch (error) {
      // Always use ErrorHandler.handle() for consistency
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ApiResponse>> deleteAllFavorites() async {
    try {
      final response = await _apiService.deleteAllFavorites();
      log('deleteAllFavorites response: $response');
      if (response.status == 200) {
        log('All favorite videos deleted successfully');
      } else {
        log('Failed to delete all favorite videos: ${response.message}');
      }
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
