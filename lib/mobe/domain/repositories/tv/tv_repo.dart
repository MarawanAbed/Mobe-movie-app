import '../../../../../lib_imports.dart';

abstract class TvRepo {
  Future<ApiResult<List<TvModel>>> getAiringTodayTv(int page);

  Future<ApiResult<List<TvModel>>> getPopularTv(int page);

  Future<ApiResult<List<TvModel>>> getTopRatedTv(int page);

  Future<ApiResult<List<TvModel>>> searchTv(String query,int page);

  Future<ApiResult<TvDetailsModel>> getTvDetail(int id);

  Future<ApiResult<List<TvModel>>> getSimilarTv(int id,int page);

  Future<ApiResult<List<GenresModel>>> getTvGenres();

  Future<ApiResult<List<TvModel>>> getTvByGenre(int id,int page);

  Future<ApiResult<String>> getTvVideos(int id);
}
