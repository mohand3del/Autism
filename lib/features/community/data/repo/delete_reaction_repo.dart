

import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';
import 'package:autism/core/network/response_model.dart';

class DeleteReactionRepo {

  final ApiService _apiServices;

  DeleteReactionRepo(this._apiServices);

  Future<ApiResult<ApiResponse>> deleteReaction(String postId) async {
    try {
      final response = await _apiServices.deleteReaction(postId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

}