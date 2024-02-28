import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/networking/api_service.dart';
import 'package:movie_app/core/networking/dio_factory.dart';
import 'package:movie_app/movie/home/data/repositories/repo_impl.dart';
import 'package:movie_app/movie/home/domain/repositories/repo.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_airing_today_tv.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_movie_details.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_movie_geners.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_popular_movies.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_popular_tv.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_similar_movie.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_similar_tv.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_top_rated_movies.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_top_rated_tv.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_tv_details.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_tv_geners.dart';
import 'package:movie_app/movie/home/domain/use_cases/get_upcoming_movies.dart';
import 'package:movie_app/movie/home/domain/use_cases/search_movies.dart';
import 'package:movie_app/movie/home/domain/use_cases/search_tv.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/details/get_movie_details_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/genre/get_movie_genres_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/popular/get_popular_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/search/search_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/similar/similar_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/top_rated/get_top_rated_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/upcoming/get_up_coming_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/airing_today/get_airing_today_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/details/get_tv_details_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/genre/get_tv_genres_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/popular/get_tv_popular_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/search/search_tv_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/similar/similar_tv_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/top_rated/get_tv_top_rated_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../movie/home/data/data_sources/remote_data_source/remote_data_source.dart';
import '../helpers/cache.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  try {
    getIt.registerLazySingleton<CacheHelper>(() => CacheHelper(getIt<SharedPreferences>()));
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
    _setupDataSources();
    _setupRepositories();
    _setupUseCases();
    _setupCubits();
    _setUpServices();
  } catch (e) {
    print('Failed to initialize dependencies: $e');
  }
}

_setupDataSources() {
  getIt.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(apiService: getIt()));
}

_setupRepositories() {
  getIt.registerLazySingleton<Repo>(() => RepoImpl(getIt()));
}

_setupUseCases() {
  getIt
      .registerLazySingleton<GetAiringTodayTv>(() => GetAiringTodayTv(getIt()));
  getIt.registerLazySingleton<GetMovieDetails>(() => GetMovieDetails(getIt()));
  getIt.registerLazySingleton<GetMovieGenres>(() => GetMovieGenres(getIt()));
  getIt
      .registerLazySingleton<GetPopularMovies>(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton<GetPopularTv>(() => GetPopularTv(getIt()));
  getIt
      .registerLazySingleton<GetSimilarMovies>(() => GetSimilarMovies(getIt()));
  getIt.registerLazySingleton<GetSimilarTv>(() => GetSimilarTv(getIt()));
  getIt.registerLazySingleton<GetTopRatedMovies>(
      () => GetTopRatedMovies(getIt()));
  getIt.registerLazySingleton<GetTopRatedTv>(() => GetTopRatedTv(getIt()));
  getIt.registerLazySingleton<GetTvDetails>(() => GetTvDetails(getIt()));
  getIt.registerLazySingleton<GetTvGenres>(() => GetTvGenres(getIt()));
  getIt.registerLazySingleton<GetUpComingMovies>(
      () => GetUpComingMovies(getIt()));
  getIt.registerLazySingleton<SearchMovie>(() => SearchMovie(getIt()));
  getIt.registerLazySingleton<SearchTv>(() => SearchTv(getIt()));
}

_setupCubits() {
  //movies
  getIt.registerFactory<GetMovieDetailsCubit>(
      () => GetMovieDetailsCubit(getIt()));
  getIt
      .registerFactory<GetMovieGenresCubit>(() => GetMovieGenresCubit(getIt()));
  getIt.registerFactory<GetPopularMoviesCubit>(
      () => GetPopularMoviesCubit(getIt()));
  getIt.registerFactory<SearchMoviesCubit>(() => SearchMoviesCubit(getIt()));
  getIt.registerFactory<SimilarMoviesCubit>(() => SimilarMoviesCubit(getIt()));
  getIt.registerFactory<GetTopRatedMoviesCubit>(
      () => GetTopRatedMoviesCubit(getIt()));
  getIt.registerFactory<GetUpComingMoviesCubit>(
      () => GetUpComingMoviesCubit(getIt()));

  //tv
  getIt.registerFactory<GetTvDetailsCubit>(() => GetTvDetailsCubit(getIt()));
  getIt.registerFactory<GetTvGenresCubit>(() => GetTvGenresCubit(getIt()));
  getIt.registerFactory<GetTvPopularCubit>(() => GetTvPopularCubit(getIt()));
  getIt.registerFactory<SearchTvCubit>(() => SearchTvCubit(getIt()));
  getIt.registerFactory<SimilarTvCubit>(() => SimilarTvCubit(getIt()));
  getIt.registerFactory<GetTvTopRatedCubit>(() => GetTvTopRatedCubit(getIt()));
  getIt
      .registerFactory<GetAiringTodayCubit>(() => GetAiringTodayCubit(getIt()));
}

_setUpServices() async {
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
}

