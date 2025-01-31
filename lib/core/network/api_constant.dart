class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "Not Connection Internet";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}

class ApiConstants {
  static const String apiBaseUrl = "https://autism-app.onrender.com/api/v1/";

  static const String login = "auth/signIn";
  static const String signup = "auth/signUp";
  static const String forgetPassword = "auth/sendPassEmail";
  static const String verifyCode = "auth/activeResetPass";
  static const String newPassword = "auth/resetPassword";
  static const String showAllVideo = "home/showAllVideos";
  static const String showAllChannel = "home/showAllChannels";
  static const String getVideoById = "home/video";
  static const String getChannelById = "home/channel";
  static const String getHistory = "home/showAllHistory";
  static const String tellAbout = "testing/userData";
  static const String form = "testing/form";
  static const String testResult = "testing/testResult";
  static const String showAllResource = "resource/showAllWebsites";
  static const String showAllCommunity = "community/showAllPosts";
  static const String createPost = "community/createPost";
  static const String addReaction = "community/post/add/reaction";
  static const String deleteReaction = "community/post/delete/reaction";
  static const String addComment = "community/post/add/comment";
  static const String deleteComment = "community/post/delete/comment";
  static const String showPostComments = "community/post/show/comments";
  static const String getPostById = "community/post";

}