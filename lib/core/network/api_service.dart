import 'package:autism/core/network/api_constant.dart';
import 'package:autism/features/auth/login/data/model/login_response_body.dart';
import 'package:autism/features/auth/newPassword/data/model/new_password_request_body.dart';
import 'package:autism/features/auth/newPassword/data/model/new_password_response_body.dart';
import 'package:autism/features/auth/signUp/data/model/sign_up_request_body.dart';
import 'package:autism/features/auth/signUp/data/model/sign_up_response.dart';
import 'package:autism/features/auth/verifyCode/data/model/verify_request_body.dart';
import 'package:autism/features/auth/verifyCode/data/model/verify_response_body.dart';
import 'package:autism/features/home/data/model/channel_response_body.dart';
import 'package:autism/features/home/data/model/video_response_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../features/auth/forgetPass/data/model/forget_request_body.dart';
import '../../features/auth/forgetPass/data/model/forget_response_body.dart';
import '../../features/auth/login/data/model/login_request_body.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signup)
  Future<SignUpResponse> signup(
    @Body() SignUpRequestBody signupRequestBody,
  );

  @POST(ApiConstants.forgetPassword)
  Future<ForgetResponseBody> forgetPassword(
    @Body() ForgetRequestBody forgetPasswordRequestBody,
  );

  @POST(ApiConstants.verifyCode)
  Future<VerifyResponseBody> verifyCode(
    @Body() VerifyRequestBody verifyCodeRequestBody,
  );

  @POST(ApiConstants.newPassword)
  Future<NewPasswordResponseBody> newPassword(
    @Body() NewPasswordRequestBody newPasswordRequestBody,
  );

  @GET(ApiConstants.showAllVideo)
  Future<VideoResponseBody> showAllVideos({
    @Query("search") String? search,
    @Query("pageToken") String? pageToken,
    @Query("videoDuration") String? videoDuration,
    @Query("videoCategoryId") String? videoCategoryId,
  });
  @GET(ApiConstants.showAllChannel)
  Future<ChannelResponseBody> showAllChannels({
    @Query("search") String? search,
    @Query("pageToken") String? pageToken,
});
}
