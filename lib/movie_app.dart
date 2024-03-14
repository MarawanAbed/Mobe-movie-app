import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/services/navigator.dart';
import 'package:movie_app/core/themes/themes.dart';
import 'package:movie_app/lib_imports.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key, required this.appRouter, required this.isOnBoarding, });

  final AppRouter appRouter;
  final bool isOnBoarding ;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MaterialApp(
        title: AppStrings.title,
        navigatorKey: Navigators.navigationKey,
        debugShowCheckedModeBanner: false,
        darkTheme: Themes.darkThemeData(context),
        themeMode: ThemeMode.dark,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: isOnBoarding? Routes.home :Routes.onBoarding ,
      ),
    );
  }
}
