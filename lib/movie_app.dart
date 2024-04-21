import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/themes/themes.dart';
import 'lib_imports.dart';

class MobeApp extends StatelessWidget {
  const MobeApp({super.key, required this.appRouter, required this.isOnBoarding, });

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
