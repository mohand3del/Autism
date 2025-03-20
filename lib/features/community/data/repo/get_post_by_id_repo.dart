import 'package:autism/core/network/api_service.dart';
import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import '../model/get_post_by_id_response.dart';

class GetPostByIdRepo {
  final ApiService _apiService;

  GetPostByIdRepo(this._apiService);

  Future<ApiResult<GetPostByIdResponse>> getPostById(String postId, {int skip = 0}) async {
    try {
      final response = await _apiService.getPostById(postId, skip);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
