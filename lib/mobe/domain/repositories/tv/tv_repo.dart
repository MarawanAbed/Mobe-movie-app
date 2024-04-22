import '../../../../../lib_imports.dart';

abstract class TvRepo {
  Future<ApiResult<List<TvModel>>> getAiringTodayTv();

  Future<ApiResult<List<TvModel>>> getPopularTv();

  Future<ApiResult<List<TvModel>>> getTopRatedTv();

  Future<ApiResult<List<TvModel>>> searchTv(String query);

  Future<ApiResult<TvDetailsModel>> getTvDetail(int id);

  Future<ApiResult<List<TvModel>>> getSimilarTv(int id);

  Future<ApiResult<List<GenresModel>>> getTvGenres();

  Future<ApiResult<List<TvModel>>> getTvByGenre(int id);

  Future<ApiResult<String>> getTvVideos(int id);
}
