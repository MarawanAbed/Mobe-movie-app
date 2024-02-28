import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/movie/home/data/models/movie_model.dart';
import 'package:movie_app/movie/home/data/models/tv_model.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/details/get_movie_details_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/popular/get_popular_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/movie/search/search_movies_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/airing_today/get_airing_today_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/details/get_tv_details_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/popular/get_tv_popular_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/search/search_tv_cubit.dart';
import 'package:movie_app/movie/home/presentation/manager/tv/top_rated/get_tv_top_rated_cubit.dart';
import 'package:movie_app/movie/home/presentation/pages/genre/genre_page.dart';
import 'package:movie_app/movie/home/presentation/pages/home/home_page.dart';
import 'package:movie_app/movie/home/presentation/pages/movie_details/movie_details_page.dart';
import 'package:movie_app/movie/home/presentation/pages/search_movie/search_movie_page.dart';
import 'package:movie_app/movie/home/presentation/pages/search_tv/search_tv_page.dart';
import 'package:movie_app/movie/home/presentation/pages/tv_details/tv_details_page.dart';
import 'package:movie_app/movie/home/presentation/pages/type/type_page.dart';
import 'package:movie_app/movie/home/presentation/pages/view_all/view_all_page.dart';
import 'package:movie_app/movie/onboarding/presentation/pages/onboarding_page.dart';

import '../../movie/home/presentation/manager/movie/top_rated/get_top_rated_movies_cubit.dart';
import '../../movie/home/presentation/manager/movie/upcoming/get_up_coming_movies_cubit.dart';
import '../di/dependancy_injection.dart';

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
        final List<MovieModel>?movies = arguments['movies'] as List<MovieModel>?;
        final List<TvModel>?tv = arguments['tv'] as List<TvModel>?;
        return _viewAllRoute({'title': title, 'isMovie': isMovie, 'movies': movies, 'tv': tv});
      case Routes.movieDetails:
        return _homeDetailsRoute();
      case Routes.type:
        final Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        final String title = arguments['title'] as String;
        final bool isMovie = arguments['isMovie'] as bool;
        return _typeRoute({'title': title, 'isMovie': isMovie});
      case Routes.searchMovie:
        return _searchMovieRoute();
      case Routes.searchTv:
        return _searchTvRoute();
      case Routes.tvDetails:
        return _tvDetailsRoute();
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

Route _homeRoute() {
  return MaterialPageRoute(
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetUpComingMoviesCubit>()..getUpComingMovies(),
        ),
        BlocProvider(
          create: (context) => getIt<GetTopRatedMoviesCubit>()..getTopRatedMovies(),
        ),
        BlocProvider(
          create: (context) => getIt<GetPopularMoviesCubit>()..getPopularMovies(),
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
  return MaterialPageRoute(
    builder: (_) => TypePage(
      title: title,
      isMovie: isMovie,
    ),
  );
}

Route _tvDetailsRoute() {
  return MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (context) => getIt<GetTvDetailsCubit>(),
      child: const TvPageDetails(),
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
    builder: (_) => GenrePage(
      title: title,
      isMovie: isMovie,
    ),
  );
}

Route _viewAllRoute(Map<String, dynamic> arguments) {
  final String title = arguments['title'] as String;
  final bool isMovie = arguments['isMovie'] as bool;
  final List<MovieModel>?movies = arguments['movies'] as List<MovieModel>?;
  final List<TvModel>?tv = arguments['tv'] as List<TvModel>?;
  return MaterialPageRoute(
    builder: (_) => ViewAllPage(
      title: title,
      isMovie: isMovie,
      movies: movies??[],
      tv: tv??[],
    ),
  );
}

Route _homeDetailsRoute() {
  return MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (context) => getIt<GetMovieDetailsCubit>(),
      child: const MoviePageDetails(),
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
