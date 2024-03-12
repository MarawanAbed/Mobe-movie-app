import 'package:movie_app/lib_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await setupGetIt();
  bool? isOnBoarding = await getIt<SharedPreCacheHelper>().getData(key:AppStrings.onBoardingKey) ?? false;
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteModelAdapter());
  await Hive.openBox<FavoriteModel>(AppStrings.favoriteMovie);
  await Hive.openBox<FavoriteModel>(AppStrings.favoriteTv);

  runApp(
    MovieApp(
      isOnBoarding: isOnBoarding!,
      appRouter: AppRouter(),
    ),
  );
}
