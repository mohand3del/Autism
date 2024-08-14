import 'package:autism/core/network/api_constant.dart';
import 'package:autism/features/auth/login/data/model/login_response_body.dart';
import 'package:autism/features/auth/signUp/data/model/sign_up_request_body.dart';
import 'package:autism/features/auth/signUp/data/model/sign_up_response.dart';
import 'package:autism/features/auth/verifyCode/data/model/verify_request_body.dart';
import 'package:autism/features/auth/verifyCode/data/model/verify_response_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../features/auth/forgetPass/data/model/forget_request_body.dart';
import '../../features/auth/forgetPass/data/model/forget_response_body.dart';
import '../../features/auth/login/data/model/login_request_body.dart';


part 'api_service.g.dart';

@RestApi(baseUrl:ApiConstants.apiBaseUrl)
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
      @Body() ForgetRequestBody forgetPasswordRequestBody,);
  @POST(ApiConstants.verifyCode)
  Future<VerifyResponseBody> verifyCode(
      @Body() VerifyRequestBody verifyCodeRequestBody,);
}

