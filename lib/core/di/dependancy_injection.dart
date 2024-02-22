import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/cache.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {

  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper(getIt<SharedPreferences>()));



  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
