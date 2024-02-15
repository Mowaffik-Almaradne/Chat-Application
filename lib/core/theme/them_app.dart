import 'package:flutter/material.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';

Color subTextColor = AppColors.textColor;
final appTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    centerTitle: true,
  ),
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  colorScheme: ColorScheme.light(
    primary: AppColors.primaryColor,
  ),
  progressIndicatorTheme:
      ProgressIndicatorThemeData(color: AppColors.primaryColor),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: AppColors.primaryColor),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
