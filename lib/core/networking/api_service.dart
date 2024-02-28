import 'package:dio/dio.dart';
import 'package:movie_app/core/networking/api_constant.dart';
import 'package:movie_app/movie/home/data/models/movie_details_model.dart';
import 'package:movie_app/movie/home/data/models/tv_details_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstant.upcomingMovies)
  Future<Map<String, dynamic>> getUpcomingMovies(
    @Query('api_key') String apiKey,
  );

  @GET(ApiConstant.popularMovies)
  Future<Map<String, dynamic>> getPopularMovies(
    @Query('api_key') String apiKey,
  );

  @GET(ApiConstant.topRatedMovies)
  Future<Map<String, dynamic>> getTopRatedMovies(
    @Query('api_key') String apiKey,
  );

  @GET(ApiConstant.airingTodayTv)
  Future<Map<String, dynamic>> getAiringTodayTv(
    @Query('api_key') String apiKey,
  );

  @GET(ApiConstant.popularTv)
  Future<Map<String, dynamic>> getPopularTv(
    @Query('api_key') String apiKey,
  );

  @GET(ApiConstant.topRatedTv)
  Future<Map<String, dynamic>> getTopRatedTv(
    @Query('api_key') String apiKey,
  );

  @GET(ApiConstant.searchMovie)
  Future<Map<String, dynamic>> searchMovie(
    @Query('api_key') String apiKey,
    @Query('query') String query,
  );

  @GET(ApiConstant.searchTv)
  Future<Map<String, dynamic>> searchTv(
    @Query('api_key') String apiKey,
    @Query('query') String query,
  );

  @GET(ApiConstant.movieDetail)
  Future<MovieDetailsModel> getMovieDetail(
    @Path('id') int id,
    @Query('api_key') String apiKey,
  );

  @GET(ApiConstant.tvDetail)
  Future<TvDetailsModel> getTvDetail(
    @Path('id') int id,
    @Query('api_key') String apiKey,
  );

  @GET(ApiConstant.similarMovie)
  Future<Map<String, dynamic>> getSimilarMovie(
    @Path('movie_id') int id,
    @Query('api_key') String apiKey,
  );

  @GET(ApiConstant.similarTv)
  Future<Map<String, dynamic>> getSimilarTv(
    @Path('tv_id') int id,
    @Query('api_key') String apiKey,
  );

  @GET(ApiConstant.genreMovie)
  Future<Map<String, dynamic>> getMovieGenres(
    @Query('api_key') String apiKey,
  );

  @GET(ApiConstant.genreTv)
  Future<Map<String, dynamic>> getTvGenres(
    @Query('api_key') String apiKey,
  );

  @GET(ApiConstant.movieByGenre)
  Future<Map<String, dynamic>> getMovieByGenre(
    @Query('api_key') String apiKey,
    @Query('with_genres') int genreId,
  );

  @GET(ApiConstant.tvByGenre)
  Future<Map<String, dynamic>> getTvByGenre(
    @Query('api_key') String apiKey,
    @Query('with_genres') int genreId,
  );
}
