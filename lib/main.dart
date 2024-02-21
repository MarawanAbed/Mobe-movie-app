import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/movie_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isOnBoarding = prefs.getBool(AppStrings.onBoardingKey) ?? false;

  runApp(
    MovieApp(
      isOnBoarding: isOnBoarding,
      appRouter: AppRouter(),
    ),
  );
}
