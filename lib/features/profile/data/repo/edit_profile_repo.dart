import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';
import 'package:autism/core/network/response_model.dart';
import 'package:autism/features/profile/data/model/profile_user_data.dart';

class EditProfileRepo {
  final ApiService _apiService;
  EditProfileRepo(this._apiService);

  Future<ApiResult<ApiResponse>> editProfile({
    required String fullName,
    required String gender,
    required String dateOfBirth,
  }) async {
    try {
      final response = await _apiService.editProfile(ProfileUserData(
        name: fullName,
        gender: gender,
        dateOfBirth: dateOfBirth, // Pass DateTime object
      ));
      
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}