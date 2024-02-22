import 'package:flutter/material.dart';
import 'package:movie_app/core/di/dependancy_injection.dart';
import 'package:movie_app/core/helpers/cache.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/movie_app.dart';

import 'core/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  bool? isOnBoarding = await getIt<CacheHelper>().getData(key:AppStrings.onBoardingKey) ?? false;

  runApp(
    MovieApp(
      isOnBoarding: isOnBoarding!,
      appRouter: AppRouter(),
    ),
  );
}
