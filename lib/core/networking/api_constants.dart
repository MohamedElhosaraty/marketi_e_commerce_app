class ApiConstants {

  static const String login = "auth/signIn";
  static const String signup = "auth/signUp";
  static const String sendPassEmail = "auth/sendPassEmail";
  static const String verifyCode = "auth/activeResetPass";
  static const String createNewPassword = "auth/resetPassword";
  static const String userData = "portfoilo/userData";
  static const String products = "home/products";
  static const String categories = "home/categories";
  static const String brands = "home/brands";
  static const String getFavourites = "user/getFavorite";
  static const String addFavourites = "user/addFavorite";
  static const String removeFavourites = "user/deleteFavorite";
  static const String addToCart = "user/addCart";
  static const String getCart = "user/getCart";
  static const String removeFromCart = "user/deleteCart";

}

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
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
