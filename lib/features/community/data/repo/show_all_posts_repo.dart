

import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';
import 'package:autism/features/community/data/model/show_post_response.dart';

class ShowAllPostsRepo {
  final ApiService _apiService;

  ShowAllPostsRepo(this._apiService);
  
  
  Future<ApiResult<ShowPostsResponse>> showAllPosts() async {
    try {
      final response = await _apiService.showAllPosts();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

}