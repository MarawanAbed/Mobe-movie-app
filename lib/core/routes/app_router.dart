import 'package:movie_app/lib_imports.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/details/get_movie_details_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/genre/get_movie_genres_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/popular/get_popular_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/search/search_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/similar/similar_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/airing_today/get_airing_today_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/by_genre/get_tv_by_genre_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/details/get_tv_details_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/genre/get_tv_genres_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/popular/get_tv_popular_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/search/search_tv_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/similar/similar_tv_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/top_rated/get_tv_top_rated_cubit.dart';

import '../../movie/home/presentation/manager/movie/top_rated/get_top_rated_movies_cubit.dart';
import '../../movie/home/presentation/manager/movie/upcoming/get_up_coming_movies_cubit.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return _onboardingRoute();
      case Routes.home:
        return _homeRoute();
      case Routes.genre:
        final Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        final String title = arguments['title'] as String;
        final bool isMovie = arguments['isMovie'] as bool;
        return _genreRoute({'title': title, 'isMovie': isMovie});
      case Routes.viewAll:
        final Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        final String title = arguments['title'] as String;
        final bool isMovie = arguments['isMovie'] as bool;
        final List<MovieModel>? movies =
            arguments['movies'] as List<MovieModel>?;
        final List<TvModel>? tv = arguments['tv'] as List<TvModel>?;
        return _viewAllRoute(
            {'title': title, 'isMovie': isMovie, 'movies': movies, 'tv': tv});
      case Routes.movieDetails:
        final int id = settings.arguments as int;
        return _movieDetailsRoute(id);
      case Routes.type:
        final Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        final String title = arguments['title'] as String;
        final bool isMovie = arguments['isMovie'] as bool;
        final int id = arguments['id'] as int;
        return _typeRoute({'title': title, 'isMovie': isMovie, 'id': id});
      case Routes.searchMovie:
        return _searchMovieRoute();
      case Routes.searchTv:
        return _searchTvRoute();
      case Routes.tvDetails:
        final int id = settings.arguments as int;
        return _tvDetailsRoute(id);
      case Routes.moviesFavorite:
        return _moviesFavoriteRoute();
      case Routes.tvFavorite:
        return _tvFavoriteRoute();
      default:
        return _defaultRoute(settings);
    }
  }
}

Route _onboardingRoute() {
  return MaterialPageRoute(
    builder: (_) => const OnBoardingPage(),
  );
}

Route _moviesFavoriteRoute() {
  return MaterialPageRoute(
    builder: (_) => const MoviesFavoritePage(),
  );
}

Route _tvFavoriteRoute() {
  return MaterialPageRoute(
    builder: (_) => const TvFavoritePage(),
  );
}

Route _homeRoute() {
  return MaterialPageRoute(
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<GetUpComingMoviesCubit>()..getUpComingMovies(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<GetTopRatedMoviesCubit>()..getTopRatedMovies(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<GetPopularMoviesCubit>()..getPopularMovies(),
        ),
        BlocProvider(
          create: (context) => getIt<GetAiringTodayCubit>()..getAiringToday(),
        ),
        BlocProvider(
          create: (context) => getIt<GetTvTopRatedCubit>()..getTopRatedTv(),
        ),
        BlocProvider(
          create: (context) => getIt<GetTvPopularCubit>()..getPopularTv(),
        ),
      ],
      child: const HomePage(),
    ),
  );
}

Route _typeRoute(Map<String, dynamic> arguments) {
  final String title = arguments['title'] as String;
  final bool isMovie = arguments['isMovie'] as bool;
  final int id = arguments['id'] as int;
  return MaterialPageRoute(
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetMoviesByGenreCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetTvByGenreCubit>(),
        ),
      ],
      child: TypePage(
        title: title,
        isMovie: isMovie,
        id: id,
      ),
    ),
  );
}

Route _tvDetailsRoute(int id) {
  return MaterialPageRoute(
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetTvDetailsCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<SimilarTvCubit>(),
        ),
      ],
      child: TvPageDetails(
        id: id,
      ),
    ),
  );
}

Route _searchMovieRoute() {
  return MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (context) => getIt<SearchMoviesCubit>(),
      child: const SearchMoviePage(),
    ),
  );
}

Route _searchTvRoute() {
  return MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (context) => getIt<SearchTvCubit>(),
      child: const SearchTvPage(),
    ),
  );
}

Route _genreRoute(Map<String, dynamic> arguments) {
  final String title = arguments['title'] as String;
  final bool isMovie = arguments['isMovie'] as bool;
  return MaterialPageRoute(
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetTvGenresCubit>()..getTvGenres(),
        ),
        BlocProvider(
          create: (context) => getIt<GetMovieGenresCubit>()..getMovieGenres(),
        ),
      ],
      child: GenrePage(
        title: title,
        isMovie: isMovie,
      ),
    ),
  );
}

Route _viewAllRoute(Map<String, dynamic> arguments) {
  final String title = arguments['title'] as String;
  final bool isMovie = arguments['isMovie'] as bool;
  final List<MovieModel>? movies = arguments['movies'] as List<MovieModel>?;
  final List<TvModel>? tv = arguments['tv'] as List<TvModel>?;
  return MaterialPageRoute(
    builder: (_) => ViewAllPage(
      title: title,
      isMovie: isMovie,
      movies: movies ?? [],
      tv: tv ?? [],
    ),
  );
}

Route _movieDetailsRoute(int id) {
  return MaterialPageRoute(
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetMovieDetailsCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<SimilarMoviesCubit>(),
        ),
      ],
      child: MoviePageDetails(
        id: id,
      ),
    ),
  );
}

Route _defaultRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      body: Center(
        child: Text('No route defined for ${settings.name}'),
      ),
    ),
  );
}
