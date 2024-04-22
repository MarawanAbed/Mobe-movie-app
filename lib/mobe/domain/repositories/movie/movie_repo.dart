import 'package:movie_app/lib_imports.dart';

abstract class MovieRepo {
  Future<ApiResult<List<MovieModel>>> getUpcomingMovies(int page );

  Future<ApiResult<List<MovieModel>>> getPopularMovies();

  Future<ApiResult<List<MovieModel>>> getTopRatedMovies();

  Future<ApiResult<List<MovieModel>>> searchMovie(String query);

  Future<ApiResult<List<MovieModel>>> getSimilarMovie(int id);

  Future<ApiResult<MovieDetailsModel>> getMovieDetail(int id);

  Future<ApiResult<List<GenresModel>>> getMovieGenres();

  Future<ApiResult<List<MovieModel>>> getMoviesByGenre(int id);

  Future<ApiResult<String>> getMovieVideos(int id);
}
