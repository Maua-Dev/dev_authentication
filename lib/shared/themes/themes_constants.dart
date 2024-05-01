import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
    colorScheme:
        ColorScheme.fromSwatch(primarySwatch: AppColors.primaryMaterial)
            .copyWith(secondary: AppColors.accent, brightness: Brightness.dark),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all<Color>(AppColors.primary),
      thumbColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
    primaryColor: AppColors.primary,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        minimumSize: const Size.fromHeight(50),
        side: BorderSide(color: AppColors.primary),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: AppColors.primary)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: Colors.black),
      filled: true,
      fillColor: Colors.white,
      prefixIconColor: AppColors.primary,
      focusColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.primary),
    scaffoldBackgroundColor: Colors.transparent);
