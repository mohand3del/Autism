import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';
import 'package:autism/core/network/response_model.dart';
import 'package:autism/features/community/data/model/show_post_comments_response.dart';

class ShowPostCommentsRepo {
  final ApiService _apiService;
  ShowPostCommentsRepo(this._apiService);

  Future<ApiResult<ShowPostCommentsResponse>> showPostComments(
      String postId, int commentsSkip, int subCommentsSkip) async {
    try {
      final response = await _apiService.showPostComments(
        postId,
        commentsSkip,
        subCommentsSkip,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<ApiResponse>> addComment(
      String postId, String comment, String method, String parentCommentId) async {
    try {
      final response = await _apiService.addComment(
        postId,
        {
          'comment': comment,
          'method': method,
          'parentCommentId': parentCommentId,
        },
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
