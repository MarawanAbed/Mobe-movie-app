import 'package:movie_app/lib_imports.dart';

abstract class Repo {
  Future<ApiResult<List<MovieModel>>> getUpcomingMovies();

  Future<ApiResult<List<MovieModel>>> getPopularMovies();

  Future<ApiResult<List<MovieModel>>> getTopRatedMovies();

  Future<ApiResult<List<TvModel>>> getAiringTodayTv();

  Future<ApiResult<List<TvModel>>> getPopularTv();

  Future<ApiResult<List<TvModel>>> getTopRatedTv();

  Future<ApiResult<List<MovieModel>>> searchMovie(String query);

  Future<ApiResult<List<TvModel>>> searchTv(String query);

  Future<ApiResult<List<MovieModel>>> getSimilarMovie(int id);

  Future<ApiResult<List<TvModel>>> getSimilarTv(int id);

  Future<ApiResult<List<GenresModel>>> getMovieGenres();

  Future<ApiResult<List<GenresModel>>> getTvGenres();

  Future<ApiResult<MovieDetailsModel>> getMovieDetail(int id);

  Future<ApiResult<TvDetailsModel>> getTvDetail(int id);

  Future<ApiResult<List<MovieModel>>> getMoviesByGenre(int id);

  Future<ApiResult<List<TvModel>>> getTvByGenre(int id);

  Future<ApiResult<String>> getMovieVideos(int id);

  Future<ApiResult<String>> getTvVideos(int id);
}