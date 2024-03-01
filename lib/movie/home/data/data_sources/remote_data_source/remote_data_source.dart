import 'package:movie_app/lib_imports.dart';

abstract class RemoteDataSource {
  Future<List<MovieModel>> getUpcomingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<List<TvModel>> getAiringTodayTv();

  Future<List<TvModel>> getPopularTv();

  Future<List<TvModel>> getTopRatedTv();

  Future<List<MovieModel>> searchMovie(String query);

  Future<List<TvModel>> searchTv(String query);

  Future<MovieDetailsModel> getMovieDetail(int id);

  Future<TvDetailsModel> getTvDetail(int id);

  Future<List<MovieModel>> getSimilarMovie(int id);

  Future<List<TvModel>> getSimilarTv(int id);

  Future<List<GenresModel>> getMovieGenres();

  Future<List<GenresModel>> getTvGenres();

  Future<List<MovieModel>> getMoviesByGenre(int id);

  Future<List<TvModel>> getTvByGenre(int id);

  Future<String> getMovieVideos(int id);

  Future<String> getTvVideos(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiService apiService;

  RemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<TvModel>> getAiringTodayTv() async {
    return _getTvModels(
      await apiService.getAiringTodayTv(AppSecured.apiKey),
    );
  }

  @override
  Future<MovieDetailsModel> getMovieDetail(int id) async {
    return await apiService.getMovieDetail(id, AppSecured.apiKey);
  }

  @override
  Future<List<GenresModel>> getMovieGenres() async {
    return _getGenres(await apiService.getMovieGenres(AppSecured.apiKey));

  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await apiService.getPopularMovies(AppSecured.apiKey);
    return List<MovieModel>.from(
        (result["results"] as List).map((e) => MovieModel.fromJson(e)));
  }

  @override
  Future<List<TvModel>> getPopularTv() async {
    final result = await apiService.getPopularTv(AppSecured.apiKey);
    return List<TvModel>.from(
        (result["results"] as List).map((e) => TvModel.fromJson(e)));
  }

  @override
  Future<List<MovieModel>> getSimilarMovie(int id) async {
    final result = await apiService.getSimilarMovie(id, AppSecured.apiKey);
    return List<MovieModel>.from(
        (result["results"] as List).map((e) => MovieModel.fromJson(e)));
  }

  @override
  Future<List<TvModel>> getSimilarTv(int id) async {
    final result = await apiService.getSimilarTv(id, AppSecured.apiKey);
    return List<TvModel>.from(
        (result["results"] as List).map((e) => TvModel.fromJson(e)));
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final result = await apiService.getTopRatedMovies(AppSecured.apiKey);
    return List<MovieModel>.from(
        (result["results"] as List).map((e) => MovieModel.fromJson(e)));
  }

  @override
  Future<List<TvModel>> getTopRatedTv() async {
    final result = await apiService.getTopRatedTv(AppSecured.apiKey);
    return List<TvModel>.from(
        (result["results"] as List).map((e) => TvModel.fromJson(e)));
  }

  @override
  Future<TvDetailsModel> getTvDetail(int id) async {
    return await apiService.getTvDetail(id, AppSecured.apiKey);
  }

  @override
  Future<List<GenresModel>> getTvGenres() async {
    return _getGenres(await apiService.getTvGenres(AppSecured.apiKey));

  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() async {
    return _getMovieModels(await apiService.getUpcomingMovies(AppSecured.apiKey));

  }

  @override
  Future<List<MovieModel>> searchMovie(String query) async {
    return _getMovieModels(await apiService.searchMovie(query, AppSecured.apiKey));

  }

  @override
  Future<List<TvModel>> searchTv(String query) async {
    return _getTvModels(await apiService.searchTv(query, AppSecured.apiKey));

  }

  @override
  Future<List<MovieModel>> getMoviesByGenre(int id) async {
    return _getMovieModels(await apiService.getMovieByGenre(AppSecured.apiKey, id));

  }

  @override
  Future<List<TvModel>> getTvByGenre(int id) async {
    return _getTvModels(await apiService.getTvByGenre(AppSecured.apiKey, id));

  }

  @override
  Future<String> getMovieVideos(int id) async {
    final videosModel = await apiService.getMovieVideos(id, AppSecured.apiKey);
    final trailer = videosModel.results.firstWhere(
        (video) => video.site == 'YouTube' && video.type == 'Trailer');
    return 'https://www.youtube.com/watch?v=${trailer.key}';
  }

  @override
  Future<String> getTvVideos(int id) async {
    final videosModel = await apiService.getTvVideos(id, AppSecured.apiKey);
    final trailer = videosModel.results.firstWhere(
        (video) => video.site == 'YouTube' && video.type == 'Trailer');
    return 'https://www.youtube.com/watch?v=${trailer.key}';
  }

  List<MovieModel> _getMovieModels(Map<String, dynamic> result) {
    return List<MovieModel>.from(
        (result["results"] as List).map((e) => MovieModel.fromJson(e)));
  }

  List<TvModel> _getTvModels(Map<String, dynamic> result) {
    return List<TvModel>.from(
        (result["results"] as List).map((e) => TvModel.fromJson(e)));
  }

  List<GenresModel> _getGenres(Map<String, dynamic> result) {
    return List<GenresModel>.from(
        (result["genres"] as List).map((e) => GenresModel.fromJson(e)));
  }


}
