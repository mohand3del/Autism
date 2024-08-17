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

}