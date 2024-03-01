import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/core/di/dependancy_injection.dart';
import 'package:movie_app/core/helpers/cache.dart';
import 'package:movie_app/core/utils/strings.dart';
import 'package:movie_app/movie/home/data/models/favorite.dart';
import 'package:movie_app/movie_app.dart';

import 'core/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  bool? isOnBoarding = await getIt<SharedPreCacheHelper>().getData(key:AppStrings.onBoardingKey) ?? false;
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteModelAdapter());
  await Hive.openBox<FavoriteModel>(AppStrings.favoriteBoxName);

  runApp(
    MovieApp(
      isOnBoarding: isOnBoarding!,
      appRouter: AppRouter(),
    ),
  );
}
