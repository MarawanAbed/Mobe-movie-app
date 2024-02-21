import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/routes/app_router.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/services/navigator.dart';
import 'package:movie_app/core/themes/themes.dart';

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
        navigatorKey: Navigators.navigationKey,
        debugShowCheckedModeBanner: false,
        darkTheme: Themes.darkThemeData(context),
        themeMode: ThemeMode.dark,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: isOnBoarding? Routes.homeScreen :Routes.onBoarding ,
      ),
    );
  }
}
