import 'package:flutter/material.dart';
import 'package:islami_app_task1/utils/app_colors.dart';
import 'package:islami_app_task1/utils/app_style.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
      selectedLabelStyle: AppStyle.bold12White,
    ),
    textTheme: TextTheme(headlineLarge: AppStyle.bold16White),
  );
  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      headlineLarge: AppStyle.bold16White.copyWith(color: Colors.orange),
    ),
  );
}
