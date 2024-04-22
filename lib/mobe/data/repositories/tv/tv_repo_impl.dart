import 'package:movie_app/lib_imports.dart';

class TvRepoImpl implements TvRepo {
  final TvRemoteDataSource _remoteDataSource;

  TvRepoImpl(this._remoteDataSource);

  @override
  Future<ApiResult<List<TvModel>>> getAiringTodayTv() async {
      try {
        final result = await _remoteDataSource.getAiringTodayTv();
        return ApiResult.success(result);
      } catch (error) {
        HelperMethod.showErrorToast(
          error.toString(),
        );
        return ApiResult.failure(ErrorHandler.handle(error));
      }
  }

  @override
  Future<ApiResult<List<TvModel>>> getPopularTv() async {
    try {
      final result = await _remoteDataSource.getPopularTv();
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<TvModel>>> getSimilarTv(int id) async {
    try {
      final result = await _remoteDataSource.getSimilarTv(id);
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<TvModel>>> getTopRatedTv() async {
    try {
      final result = await _remoteDataSource.getTopRatedTv();
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<TvDetailsModel>> getTvDetail(int id) async {
    try {
      final result = await _remoteDataSource.getTvDetail(id);
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<GenresModel>>> getTvGenres() async {
    try {
      final result = await _remoteDataSource.getTvGenres();
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<String>> getTvVideos(int id) async {
    try {
      final result = await _remoteDataSource.getTvVideos(id);
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<TvModel>>> searchTv(String query) async {
    try {
      final result = await _remoteDataSource.searchTv(query);
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<TvModel>>> getTvByGenre(int id) async {
    try {
      final result = await _remoteDataSource.getTvByGenre(id);
      return ApiResult.success(result);
    } catch (error) {
      HelperMethod.showErrorToast(
        error.toString(),
      );
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
