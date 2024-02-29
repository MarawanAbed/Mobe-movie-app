import 'package:movie_app/core/networking/api_error_handler.dart';
import 'package:movie_app/core/networking/api_result.dart';
import 'package:movie_app/movie/home/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:movie_app/movie/home/data/models/genres_model.dart';
import 'package:movie_app/movie/home/data/models/movie_details_model.dart';
import 'package:movie_app/movie/home/data/models/movie_model.dart';
import 'package:movie_app/movie/home/data/models/tv_details_model.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';
import 'package:movie_app/movie/home/domain/repositories/repo.dart';

class RepoImpl implements Repo {
  final RemoteDataSource _remoteDataSource;

  RepoImpl(this._remoteDataSource);

  @override
  Future<ApiResult<List<TvModel>>> getAiringTodayTv() async {
    try {
      final result = await _remoteDataSource.getAiringTodayTv();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<MovieDetailsModel>> getMovieDetail(int id) async {
    try {
      final result = await _remoteDataSource.getMovieDetail(id);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<GenresModel>>> getMovieGenres() async {
    try {
      final result = await _remoteDataSource.getMovieGenres();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getPopularMovies() async {
    try {
      final result = await _remoteDataSource.getPopularMovies();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<TvModel>>> getPopularTv() async {
    try {
      final result = await _remoteDataSource.getPopularTv();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getSimilarMovie(int id) async {
    try {
      final result = await _remoteDataSource.getSimilarMovie(id);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<TvModel>>> getSimilarTv(int id) async {
    try {
      final result = await _remoteDataSource.getSimilarTv(id);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getTopRatedMovies() async {
    try {
      final result = await _remoteDataSource.getTopRatedMovies();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<TvModel>>> getTopRatedTv() async {
    try {
      final result = await _remoteDataSource.getTopRatedTv();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<TvDetailsModel>> getTvDetail(int id) async {
    try {
      final result = await _remoteDataSource.getTvDetail(id);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<GenresModel>>> getTvGenres() async {
    try {
      final result = await _remoteDataSource.getTvGenres();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getUpcomingMovies() async {
    try {
      final result = await _remoteDataSource.getUpcomingMovies();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> searchMovie(String query) async {
    try {
      final result = await _remoteDataSource.searchMovie(query);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<TvModel>>> searchTv(String query) async {
    try {
      final result = await _remoteDataSource.searchTv(query);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getMoviesByGenre(int id) async {
    try {
      final result = await _remoteDataSource.getMoviesByGenre(id);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<TvModel>>> getTvByGenre(int id) async {
    try {
      final result = await _remoteDataSource.getTvByGenre(id);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<String>> getMovieVideos(int id) async {
    try {
      final result = await _remoteDataSource.getMovieVideos(id);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<String>> getTvVideos(int id) async {
    try {
      final result = await _remoteDataSource.getTvVideos(id);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
