
import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/movie/home/presentation/pages/home_page.dart';
import 'package:movie_app/movie/onboarding/presentation/pages/onboarding_page.dart';
class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return _onboardingRoute();
      case Routes.homeScreen:
        return _homeRoute();
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
Route _defaultRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      body: Center(
        child: Text('No route defined for ${settings.name}'),
      ),
    ),
  );
}
