import 'package:movie_app/movie/home/presentation/bloc/movie/details/get_movie_details_cubit.dart';
import 'package:movie_app/movie/home/presentation/bloc/movie/genre/get_movie_genres_cubit.dart';
import 'package:movie_app/movie/home/presentation/bloc/movie/popular/get_popular_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/bloc/movie/search/search_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/bloc/movie/similar/similar_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/bloc/movie/top_rated/get_top_rated_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/bloc/movie/upcoming/get_up_coming_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/bloc/tv/airing_today/get_airing_today_cubit.dart';
import 'package:movie_app/movie/home/presentation/bloc/tv/by_genre/get_tv_by_genre_cubit.dart';
import 'package:movie_app/movie/home/presentation/bloc/tv/details/get_tv_details_cubit.dart';
import 'package:movie_app/movie/home/presentation/bloc/tv/genre/get_tv_genres_cubit.dart';
import 'package:movie_app/movie/home/presentation/bloc/tv/popular/get_tv_popular_cubit.dart';
import 'package:movie_app/movie/home/presentation/bloc/tv/search/search_tv_cubit.dart';
import 'package:movie_app/movie/home/presentation/bloc/tv/similar/similar_tv_cubit.dart';
import 'package:movie_app/movie/home/presentation/bloc/tv/top_rated/get_tv_top_rated_cubit.dart';
import 'package:movie_app/lib_imports.dart';

import '../../movie/home/presentation/Bloc/movie/by_genre/get_movies_by_genre_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  try {
    getIt.registerLazySingleton<SharedPreCacheHelper>(
        () => SharedPreCacheHelper(getIt<SharedPreferences>()));
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
  getIt.registerLazySingleton<GetMovieByGenre>(() => GetMovieByGenre(getIt()));
  getIt.registerLazySingleton<GetTvByGenre>(() => GetTvByGenre(getIt()));

  getIt.registerLazySingleton<GetMovieVideos>(() => GetMovieVideos(getIt()));
  getIt.registerLazySingleton<GetTvVideos>(() => GetTvVideos(getIt()));
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
  getIt.registerFactory<GetMoviesByGenreCubit>(
      () => GetMoviesByGenreCubit(getIt()));

  //tv
  getIt.registerFactory<GetTvDetailsCubit>(() => GetTvDetailsCubit(getIt()));
  getIt.registerFactory<GetTvGenresCubit>(() => GetTvGenresCubit(getIt()));
  getIt.registerFactory<GetTvPopularCubit>(() => GetTvPopularCubit(getIt()));
  getIt.registerFactory<SearchTvCubit>(() => SearchTvCubit(getIt()));
  getIt.registerFactory<SimilarTvCubit>(() => SimilarTvCubit(getIt()));
  getIt.registerFactory<GetTvTopRatedCubit>(() => GetTvTopRatedCubit(getIt()));
  getIt
      .registerFactory<GetAiringTodayCubit>(() => GetAiringTodayCubit(getIt()));
  getIt.registerFactory<GetTvByGenreCubit>(() => GetTvByGenreCubit(getIt()));
}

_setUpServices() async {
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
}
