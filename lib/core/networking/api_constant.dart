class ApiConstant {
  static const String apiBaseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "2801a53fb3cc7a598ce73d51e7f5bc51";
  static const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";
  static const String upcomingMovies = "/movie/upcoming";
  static const String popularMovies = "/movie/popular";
  static const String topRatedMovies = "/movie/top_rated";
  static const String airingTodayTv = "/tv/airing_today";
  static const String popularTv = "/tv/popular";
  static const String topRatedTv = "/tv/top_rated";
  static const String searchMovie = "/search/movie";
  static const String searchTv = "/search/tv";
  static const String movieDetail = "/movie/";
  static const String tvDetail = "/tv/";
  static const String genreMovie = "/genre/movie/list";
  static const String genreTv = "/genre/tv/list";

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