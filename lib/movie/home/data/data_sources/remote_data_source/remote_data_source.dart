import 'package:movie_app/core/networking/api_constant.dart';
import 'package:movie_app/core/networking/api_service.dart';
import 'package:movie_app/movie/home/data/models/genres_model.dart';
import 'package:movie_app/movie/home/data/models/movie_details_model.dart';
import 'package:movie_app/movie/home/data/models/movie_model.dart';
import 'package:movie_app/movie/home/data/models/tv_details_model.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';

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
  Future<List<MovieModel>>getMoviesByGenre(int id);
  Future<List<TvModel>>getTvByGenre(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiService apiService;

  RemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<TvModel>> getAiringTodayTv()async {
    final result=await apiService.getAiringTodayTv(ApiConstant.apiKey);
    return List<TvModel>.from((result["results"] as List)
        .map((e) => TvModel.fromJson(e)));
  }

  @override
  Future<MovieDetailsModel> getMovieDetail(int id)async {
   return await apiService.getMovieDetail(id, ApiConstant.apiKey);
  }

  @override
  Future<List<GenresModel>> getMovieGenres()async {
    final result=await apiService.getMovieGenres(ApiConstant.apiKey);
    return List<GenresModel>.from((result["genres"] as List)
        .map((e) => GenresModel.fromJson(e)));
  }

  @override
  Future<List<MovieModel>> getPopularMovies()async {
    final result=await apiService.getPopularMovies(ApiConstant.apiKey);
    return List<MovieModel>.from((result["results"] as List)
        .map((e) => MovieModel.fromJson(e)));
  }

  @override
  Future<List<TvModel>> getPopularTv() async{
    final result=await apiService.getPopularTv(ApiConstant.apiKey);
    return List<TvModel>.from((result["results"] as List)
        .map((e) => TvModel.fromJson(e)));
  }

  @override
  Future<List<MovieModel>> getSimilarMovie(int id)async {
    final result=await apiService.getSimilarMovie(id,ApiConstant.apiKey);
    return List<MovieModel>.from((result["results"] as List)
        .map((e) => MovieModel.fromJson(e)));
  }

  @override
  Future<List<TvModel>> getSimilarTv(int id)async {
    final result=await apiService.getSimilarTv(id,ApiConstant.apiKey);
    return List<TvModel>.from((result["results"] as List)
        .map((e) => TvModel.fromJson(e)));  }

  @override
  Future<List<MovieModel>> getTopRatedMovies()async {
    final result=await apiService.getTopRatedMovies(ApiConstant.apiKey);
    return List<MovieModel>.from((result["results"] as List)
        .map((e) => MovieModel.fromJson(e)));  }

  @override
  Future<List<TvModel>> getTopRatedTv()async {
    final result=await apiService.getTopRatedTv(ApiConstant.apiKey);
    return List<TvModel>.from((result["results"] as List)
        .map((e) => TvModel.fromJson(e)));
  }

  @override
  Future<TvDetailsModel> getTvDetail(int id) async{
    return await apiService.getTvDetail(id, ApiConstant.apiKey);
  }

  @override
  Future<List<GenresModel>> getTvGenres()async {
    final result=await apiService.getTvGenres(ApiConstant.apiKey);
    return List<GenresModel>.from((result["genres"] as List)
        .map((e) => GenresModel.fromJson(e)));
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies()async {
     final result=await apiService.getUpcomingMovies(ApiConstant.apiKey);
     return List<MovieModel>.from((result["results"] as List)
         .map((e) => MovieModel.fromJson(e)));
  }

  @override
  Future<List<MovieModel>> searchMovie(String query)async {
    final result=await apiService.searchMovie(query,ApiConstant.apiKey);
    return List<MovieModel>.from((result["results"] as List)
        .map((e) => MovieModel.fromJson(e)));  }

  @override
  Future<List<TvModel>> searchTv(String query)async {
    final result=await apiService.searchTv(ApiConstant.apiKey,query);
    return List<TvModel>.from((result["results"] as List)
        .map((e) => TvModel.fromJson(e)));
  }

  @override
  Future<List<MovieModel>> getMoviesByGenre(int id) async{
    final result=await apiService.getMovieByGenre(ApiConstant.apiKey,id);
    return List<MovieModel>.from((result["results"] as List)
        .map((e) => MovieModel.fromJson(e)));
  }

  @override
  Future<List<TvModel>> getTvByGenre(int id) async{
    final result=await apiService.getTvByGenre(ApiConstant.apiKey,id);
    return List<TvModel>.from((result["results"] as List)
        .map((e) => TvModel.fromJson(e)));
  }
}
