import 'package:movie_app/lib_imports.dart';

abstract class MovieRepo {
  Future<ApiResult<List<MovieModel>>> getUpcomingMovies(int page );

  Future<ApiResult<List<MovieModel>>> getPopularMovies(int page);

  Future<ApiResult<List<MovieModel>>> getTopRatedMovies(int page);

  Future<ApiResult<List<MovieModel>>> searchMovie(String query,int page);

  Future<ApiResult<List<MovieModel>>> getSimilarMovie(int id,int page);

  Future<ApiResult<MovieDetailsModel>> getMovieDetail(int id);

  Future<ApiResult<List<GenresModel>>> getMovieGenres();

  Future<ApiResult<List<MovieModel>>> getMoviesByGenre(int id,int page);

  Future<ApiResult<String>> getMovieVideos(int id);
}
