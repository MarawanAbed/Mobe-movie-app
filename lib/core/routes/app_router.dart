import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/movie/home/presentation/pages/genre_page.dart';
import 'package:movie_app/movie/home/presentation/pages/home_page.dart';
import 'package:movie_app/movie/home/presentation/pages/movie_details_page.dart';
import 'package:movie_app/movie/home/presentation/pages/search_page.dart';
import 'package:movie_app/movie/home/presentation/pages/tv_details_page.dart';
import 'package:movie_app/movie/home/presentation/pages/type_page.dart';
import 'package:movie_app/movie/home/presentation/pages/view_all_page.dart';
import 'package:movie_app/movie/onboarding/presentation/pages/onboarding_page.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return _onboardingRoute();
      case Routes.homeScreen:
        return _homeRoute();
      case Routes.genreScreen:
        final Map<String, dynamic> arguments =
        settings.arguments as Map<String, dynamic>;
        final String title = arguments['title'] as String;
        final bool isMovie = arguments['isMovie'] as bool;
        return _genreRoute({'title': title, 'isMovie': isMovie});
      case Routes.viewAllScreen:
        final Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        final String title = arguments['title'] as String;
        final bool isMovie = arguments['isMovie'] as bool;
        return _viewAllRoute({'title': title, 'isMovie': isMovie});
      case Routes.homeDetailsScreen:
        return _homeDetailsRoute();
      case Routes.typeScreen:
        final Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        final String title = arguments['title'] as String;
        final bool isMovie = arguments['isMovie'] as bool;
        return _typeRoute({'title': title, 'isMovie': isMovie});
      case Routes.searchScreen:
        return _searchRoute();
      case Routes.tvDetailsScreen:
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
    builder: (_) => const HomePage(),
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
    builder: (_) => const TvPageDetails(),
  );
}

Route _searchRoute() {
  return MaterialPageRoute(
    builder: (_) => const SearchPage(),
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
  return MaterialPageRoute(
    builder: (_) => ViewAllPage(
      title: title,
      isMovie: isMovie,
    ),
  );
}

Route _homeDetailsRoute() {
  return MaterialPageRoute(
    builder: (_) => const MoviePageDetails(),
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
