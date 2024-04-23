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
  Future<ApiResult<List<MovieModel>>> getMoviesByGenre(int id,int page) async {
    try {
      final result = await _remoteDataSource.getMoviesByGenre(id,page);
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getPopularMovies(int page) async {
    try {
      final result = await _remoteDataSource.getPopularMovies(page);
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getSimilarMovie(int id,int page) async {
    try {
      final result = await _remoteDataSource.getSimilarMovie(id,page);
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getTopRatedMovies(int page) async {
    try {
      final result = await _remoteDataSource.getTopRatedMovies(page);
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));

    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getUpcomingMovies(int page) async {
    try {
      final result = await _remoteDataSource.getUpcomingMovies(page);
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
