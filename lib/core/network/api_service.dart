
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
import 'package:autism/features/community/data/model/get_post_by_id_response.dart';
import 'package:autism/features/community/data/model/show_post_comments_response.dart';
import 'package:autism/features/community/data/model/show_post_response.dart';
import 'package:autism/features/home/data/model/channel_by_id_response_body.dart';
import 'package:autism/features/home/data/model/channel_response_body.dart';
import 'package:autism/features/home/data/model/favorite_video_response_model.dart';
import 'package:autism/features/home/data/model/history_response_body.dart';
import 'package:autism/features/home/data/model/video_by_id_response_body.dart';
import 'package:autism/features/home/data/model/video_response_body.dart';
import 'package:autism/features/profile/data/model/contact_info_model.dart';
import 'package:autism/features/profile/data/model/edit_contact_info_model.dart';
import 'package:autism/features/profile/data/model/profile_user_data.dart';
import 'package:autism/features/profile/data/model/profile_user_data_response.dart';
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
  });
  @POST(ApiConstants.tellAbout)
  Future<TellAboutResponseBody> tellAbout(
      @Body() TellAboutRequestBody tellAboutRequestBody);

  @POST(ApiConstants.form)
  Future<FormResponseBody> sendForm(@Body() FormRequestBody formRequestBody);
  @GET(ApiConstants.testResult)
  Future<TestResultResponse> getTestResult();

  @GET(ApiConstants.showAllResource)
  Future<ResourceResponseBody> showAllWebsites({
    @Query("page") int? page,
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
  @GET(ApiConstants.showPostComments)
  Future<ShowPostCommentsResponse> showPostComments(
    @Query("postId") String postId,
    @Query("commentsSkip") int commentsSkip,
    @Query("subcommentsSkip") int subCommentsSkip,
  );

  @POST(ApiConstants.addComment)
  Future<ApiResponse> addComment(
    @Query("postId") String postId,
    @Body() Map<String, String> commentBody,
  );
  @GET(ApiConstants.getPostById)
  Future<GetPostByIdResponse> getPostById(
    @Query("postId") String postId,
    @Query("skip") int skip,
  );
  @GET(ApiConstants.userData)
  Future<ProfileUserDataResponse> getUserData();
  @POST(ApiConstants.editUserData)
  Future<ApiResponse> editProfile(
    @Body() ProfileUserData profileUserData,
  );

  @POST(ApiConstants.uploadImage)
  @MultiPart()
  Future<ApiResponse> uploadImage(
    @Body() FormData formData,
  );
  @GET(ApiConstants.contactInformation)
  Future<ContactInfoModel> getContactInfo();
  @POST(ApiConstants.editContactInfo)
  Future<ApiResponse> editContactInfo(
    @Body() EditContactInfoModel contactInfoModel,
  );
  @GET(ApiConstants.favoriteVideo)
  Future<FavoriteVideoResponseModel> showFavoriteVideo(
    @Query("favoriteSkip") int favoriteSkip,
  );

  @POST(ApiConstants.addToFavorite)
  Future<ApiResponse> addToFavorite(
    @Query("videoId") String videoId,
  );

  @DELETE(ApiConstants.deleteFavorite)
  Future<ApiResponse> removeFromFavorite(
    @Query("videoId") String videoId,
  );

  @DELETE(ApiConstants.deleteAllFavorites)
  Future<ApiResponse> deleteAllFavorites();
}
