import 'dart:io';

import 'package:autism/core/network/api_constant.dart';
import 'package:autism/core/network/response_model.dart';
import 'package:autism/features/auth/login/data/model/login_response_body.dart';
import 'package:autism/features/auth/newPassword/data/model/new_password_request_body.dart';
import 'package:autism/features/auth/newPassword/data/model/new_password_response_body.dart';
import 'package:autism/features/auth/signUp/data/model/sign_up_request_body.dart';
import 'package:autism/features/auth/signUp/data/model/sign_up_response.dart';
import 'package:autism/features/auth/verifyCode/data/model/verify_request_body.dart';
import 'package:autism/features/auth/verifyCode/data/model/verify_response_body.dart';
import 'package:autism/features/community/data/model/add_reaction_request_body.dart';
import 'package:autism/features/community/data/model/add_reaction_response.dart';
import 'package:autism/features/community/data/model/create_post_response.dart';
import 'package:autism/features/community/data/model/show_post_response.dart';
import 'package:autism/features/home/data/model/channel_by_id_response_body.dart';
import 'package:autism/features/home/data/model/channel_response_body.dart';
import 'package:autism/features/home/data/model/history_response_body.dart';
import 'package:autism/features/home/data/model/video_by_id_response_body.dart';
import 'package:autism/features/home/data/model/video_response_body.dart';
import 'package:autism/features/resource/data/model/recource_response_body.dart';
import 'package:autism/features/test/data/model/form_request_body.dart';
import 'package:autism/features/test/data/model/form_response_body.dart';
import 'package:autism/features/test/data/model/tell_about_request_body.dart';
import 'package:autism/features/test/data/model/tell_about_response_body.dart';
import 'package:autism/features/test/data/model/test_result_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../features/auth/forgetPass/data/model/forget_request_body.dart';
import '../../features/auth/forgetPass/data/model/forget_response_body.dart';
import '../../features/auth/login/data/model/login_request_body.dart';
import 'package:logger/logger.dart';

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
  @GET(ApiConstants.getVideoById)
  Future<VideoByIdResponseBody> getVideoById(
      {@Query("videoId") String? videoId});

  @GET(ApiConstants.getChannelById)
  Future<ChannelByIdResponseBody> getChannelById(
      {@Query("channelId") String? channelId});
  @GET(ApiConstants.getHistory)
  Future<HistoryResponseBody> getHistory({

    @Query("historySkip") int? historySkip,
  }
      );
  @POST(ApiConstants.tellAbout)
  Future<TellAboutResponseBody> tellAbout(
      @Body() TellAboutRequestBody tellAboutRequestBody
      );
  @POST("testing/childFace")
  Future<ApiResponse> uploadChildFace(@Part(name: "file") File file);

  @POST("testing/drawing")
  Future<ApiResponse> uploadDrawing(@Part(name: "file") File file);

  @POST("testing/coloring")
  Future<ApiResponse> uploadColoring(@Part(name: "file") File file);

  @POST("testing/handWriting")
  Future<ApiResponse> uploadHandWriting(@Part(name: "file") File file);
  @POST(ApiConstants.form)
  Future<FormResponseBody> sendForm(@Body() FormRequestBody formRequestBody);
  @GET(ApiConstants.testResult)
  Future<TestResultResponse>getTestResult();

  @GET(ApiConstants.showAllResource)
  Future<ResourceResponseBody> showAllWebsites(
      {@Query("page") int? page,
        @Query("number") int? number = 20,
  });
  @GET(ApiConstants.showAllCommunity)
  Future<ShowPostsResponse> showAllPosts();

  @POST(ApiConstants.createPost)
  Future<CreatePostResponse> createPost(
     @Body() FormData formData,

      );

  @POST(ApiConstants.addReaction)
  Future<AddReactionResponse> addReaction(
      @Query("postId") String postId,
      @Body() AddReactionRequestBody addReactionRequestBody,
      );

  @DELETE(ApiConstants.deleteReaction)
  Future<ApiResponse> deleteReaction(
      @Query("postId") String postId,

      );




}
