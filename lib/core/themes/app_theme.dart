import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.whiteColor,
    //appBar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
    ),
    //text theme
    textTheme: TextTheme(
      displayLarge: boldStyle(),
      displayMedium: regularStyle(),
    ),
    //button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
    //Text Field
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      hintStyle: boldStyle(
        color: AppColors.greyColor,
        fontSize: 16,
      ),
      // fillColor: AppColors.whiteColor,
      // filled: true,
    ),
  );
}
