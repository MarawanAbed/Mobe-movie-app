import '../../../../../lib_imports.dart';

class MovieRepoImpl implements MovieRepo {
  final MovieRemoteDataSource _remoteDataSource;

  MovieRepoImpl(this._remoteDataSource);

  @override
  Future<ApiResult<MovieDetailsModel>> getMovieDetail(int id) async {
    try {
      final result = await _remoteDataSource.getMovieDetail(id);
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<GenresModel>>> getMovieGenres() async {
    try {
      final result = await _remoteDataSource.getMovieGenres();
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<String>> getMovieVideos(int id) async {
    try {
      final result = await _remoteDataSource.getMovieVideos(id);
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getMoviesByGenre(int id) async {
    try {
      final result = await _remoteDataSource.getMoviesByGenre(id);
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getPopularMovies() async {
    try {
      final result = await _remoteDataSource.getPopularMovies();
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getSimilarMovie(int id) async {
    try {
      final result = await _remoteDataSource.getSimilarMovie(id);
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getTopRatedMovies() async {
    try {
      final result = await _remoteDataSource.getTopRatedMovies();
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));

      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getUpcomingMovies() async {
    try {
      final result = await _remoteDataSource.getUpcomingMovies();
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> searchMovie(String query) async {
    try {
      final result = await _remoteDataSource.searchMovie(query);
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
