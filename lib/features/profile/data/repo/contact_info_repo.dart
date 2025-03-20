import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/api_result.dart';
import 'package:autism/core/network/api_service.dart';
import 'package:autism/core/network/response_model.dart';
import 'package:autism/features/profile/data/model/contact_info_model.dart';
import 'package:autism/features/profile/data/model/edit_contact_info_model.dart';

class ContactInfoRepo {
  final ApiService _apiService;
  ContactInfoRepo(this._apiService);

  Future<ApiResult<ContactInfoModel>> getContactInfo() async {
    try {
      final response = await _apiService.getContactInfo();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }


  Future<ApiResult<ApiResponse>> editContactInfo({
    required String address,
    required String phone,
    required String facebook,
    required String linkedIn,
  }) async {
    try {
      final response = await _apiService.editContactInfo(
        EditContactInfoModel(address: address, phone: phone, facebookLink: facebook, linkedinLink: linkedIn)

      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
