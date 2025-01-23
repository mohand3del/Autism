

import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';
import 'package:autism/features/community/data/model/add_reaction_request_body.dart';
import 'package:autism/features/community/data/model/add_reaction_response.dart';

class AddReactionRepo {
 final ApiService _apiService;

  AddReactionRepo(this._apiService);

  Future<ApiResult<AddReactionResponse>>
  addReaction(AddReactionRequestBody addReactionRequestBody,{required String postId}) async {
    final response = await _apiService.addReaction(
      postId,
      addReactionRequestBody,
    );
    try {
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }

  }

}