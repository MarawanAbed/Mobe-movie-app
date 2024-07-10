import 'package:retrofit/retrofit.dart';

import '../../lib_imports.dart';
import '../../mobe/data/models/movie/movie_vidoes.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstant.upcomingMovies)
  Future<Map<String, dynamic>> getUpcomingMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  @GET(ApiConstant.popularMovies)
  Future<Map<String, dynamic>> getPopularMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  @GET(ApiConstant.topRatedMovies)
  Future<Map<String, dynamic>> getTopRatedMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  @GET(ApiConstant.airingTodayTv)
  Future<Map<String, dynamic>> getAiringTodayTv(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  @GET(ApiConstant.popularTv)
  Future<Map<String, dynamic>> getPopularTv(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  @GET(ApiConstant.topRatedTv)
  Future<Map<String, dynamic>> getTopRatedTv(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  @GET(ApiConstant.searchMovie)
  Future<Map<String, dynamic>> searchMovie(
    @Query('query') String query,
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  @GET(ApiConstant.searchTv)
  Future<Map<String, dynamic>> searchTv(
    @Query('query') String query,
    @Query('api_key') String apiKey,
    @Query('page') int page,
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
    @Query('page') int page,
  );

  @GET(ApiConstant.similarTv)
  Future<Map<String, dynamic>> getSimilarTv(
    @Path('tv_id') int id,
    @Query('api_key') String apiKey,
    @Query('page') int page,
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
    @Query('page') int page,
  );

  @GET(ApiConstant.tvByGenre)
  Future<Map<String, dynamic>> getTvByGenre(
    @Query('api_key') String apiKey,
    @Query('with_genres') int genreId,
    @Query('page') int page,
  );

  @GET(ApiConstant.movieVideos)
  Future<VideosModel> getMovieVideos(
    @Path('movie_id') int id,
    @Query('api_key') String apiKey,
  );

  @GET(ApiConstant.tvVideos)
  Future<VideosModel> getTvVideos(
    @Path('tv_id') int id,
    @Query('api_key') String apiKey,
  );
}
