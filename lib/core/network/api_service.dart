import 'package:autism/core/network/api_constant.dart';
import 'package:autism/features/auth/login/data/model/login_response_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../features/auth/login/data/model/login_request_body.dart';


part 'api_service.g.dart';

@RestApi(baseUrl:ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
}