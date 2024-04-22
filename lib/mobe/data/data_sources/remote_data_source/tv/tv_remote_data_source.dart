
import 'package:movie_app/lib_imports.dart';


abstract class TvRemoteDataSource
{
  Future<List<TvModel>> getAiringTodayTv();
  Future<List<TvModel>> getPopularTv();
  Future<List<TvModel>> getTopRatedTv();
  Future<List<TvModel>> getTvByGenre(int id);
  Future<List<TvModel>> searchTv(String query);
  Future<TvDetailsModel> getTvDetail(int id);
  Future<List<TvModel>> getSimilarTv(int id);
  Future<List<GenresModel>> getTvGenres();
  Future<String> getTvVideos(int id);
}


class TvRemoteDataSourceImpl implements TvRemoteDataSource
{
  final ApiService apiService;

  TvRemoteDataSourceImpl({required this.apiService});

  List<TvModel> _getTvModels(Map<String, dynamic> result) {
    return List<TvModel>.from(
        (result["results"] as List).map((e) => TvModel.fromJson(e)));
  }
  List<GenresModel> _getGenres(Map<String, dynamic> result) {
    return List<GenresModel>.from(
        (result["genres"] as List).map((e) => GenresModel.fromJson(e)));
  }

  @override
  Future<List<TvModel>> getPopularTv() async{
    return _getTvModels(
      await apiService.getPopularTv(AppSecured.apiKey),
    );
  }

  @override
  Future<List<TvModel>> getSimilarTv(int id) async{
    return _getTvModels(
      await apiService.getSimilarTv(id, AppSecured.apiKey),
    );
  }

  @override
  Future<List<TvModel>> getTopRatedTv() async{
    return _getTvModels(
      await apiService.getTopRatedTv(AppSecured.apiKey),
    );
  }

  @override
  Future<List<TvModel>> getTvByGenre(int id) async{
    return _getTvModels(
      await apiService.getTvByGenre(AppSecured.apiKey, id),
    );
  }

  @override
  Future<TvDetailsModel> getTvDetail(int id) async{
    return await apiService.getTvDetail(id, AppSecured.apiKey);
  }

  @override
  Future<List<GenresModel>> getTvGenres() async{
    return _getGenres(await apiService.getTvGenres(AppSecured.apiKey));
  }

  @override
  Future<String> getTvVideos(int id) async{
    final videosModel = await apiService.getTvVideos(id, AppSecured.apiKey);
    final trailer = videosModel.results.firstWhere(
            (video) => video.site == 'YouTube' && video.type == 'Trailer');
    return 'https://www.youtube.com/watch?v=${trailer.key}';
  }

  @override
  Future<List<TvModel>> searchTv(String query) async{
    return _getTvModels(
      await apiService.searchTv(query, AppSecured.apiKey),
    );
  }

  @override
  Future<List<TvModel>> getAiringTodayTv() async {
    return _getTvModels(
      await apiService.getAiringTodayTv(AppSecured.apiKey),
    );
  }

}