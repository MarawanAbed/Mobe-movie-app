
import 'package:flutter/material.dart';

import 'app_colors.dart';

class Themes{
  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData.light().copyWith(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
    );
  }

  static ThemeData darkThemeData(BuildContext context) {
    return ThemeData.dark().copyWith(
      primaryColor: AppColors.kPrimaryColor,
      scaffoldBackgroundColor: AppColors.kBackGround,
    );
  }
}
