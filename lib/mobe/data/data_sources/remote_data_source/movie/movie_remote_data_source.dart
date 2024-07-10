import 'package:movie_app/lib_imports.dart';
abstract class MovieRemoteDataSource
{
  Future<List<MovieModel>> getUpcomingMovies(int page);
  Future<List<MovieModel>> getPopularMovies(int page);
  Future<List<MovieModel>> getTopRatedMovies(int page);
  Future<List<MovieModel>> searchMovie(String query,int page);
  Future<MovieDetailsModel> getMovieDetail(int id);
  Future<List<MovieModel>> getSimilarMovie(int id,int page);
  Future<List<GenresModel>> getMovieGenres();
  Future<List<MovieModel>> getMoviesByGenre(int id,int page);
  Future<String> getMovieVideos(int id);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource
{
  final ApiService apiService;

  MovieRemoteDataSourceImpl({required this.apiService});

  List<GenresModel> _getGenres(Map<String, dynamic> result) {
    return List<GenresModel>.from(
        (result["genres"] as List).map((e) => GenresModel.fromJson(e)));
  }
  List<MovieModel> _getMovieModels(Map<String, dynamic> result) {
    return List<MovieModel>.from(
        (result["results"] as List).map((e) => MovieModel.fromJson(e)));
  }

  @override
  Future<MovieDetailsModel> getMovieDetail(int id) async{
    return await apiService.getMovieDetail(id, AppSecured.apiKey);
  }

  @override
  Future<List<GenresModel>> getMovieGenres() async{
  return _getGenres(await apiService.getMovieGenres(AppSecured.apiKey));
  }

  @override
  Future<String> getMovieVideos(int id) async{
    final videosModel = await apiService.getMovieVideos(id, AppSecured.apiKey);
    final trailer = videosModel.results.firstWhere(
            (video) => video.site == 'YouTube' && video.type == 'Trailer');
    return 'https://www.youtube.com/watch?v=${trailer.key}';
  }

  @override
  Future<List<MovieModel>> getMoviesByGenre(int id,int page) async{
    return _getMovieModels(await apiService.getMovieByGenre(AppSecured.apiKey, id,page));
  }

  @override
  Future<List<MovieModel>> getPopularMovies(int page) async{
    return _getMovieModels(await apiService.getPopularMovies(AppSecured.apiKey,page));
  }

  @override
  Future<List<MovieModel>> getSimilarMovie(int id,int page) async{
    return _getMovieModels(await apiService.getSimilarMovie(id, AppSecured.apiKey,page));
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies(int page) async{
    return _getMovieModels(await apiService.getTopRatedMovies(AppSecured.apiKey,page));
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies(int page) async{
    return _getMovieModels(await apiService.getUpcomingMovies(AppSecured.apiKey,page));
  }

  @override
  Future<List<MovieModel>> searchMovie(String query,int page) async{
    return _getMovieModels(await apiService.searchMovie(query, AppSecured.apiKey,page));
  }

}