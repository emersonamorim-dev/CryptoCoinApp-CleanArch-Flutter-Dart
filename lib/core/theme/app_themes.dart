// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.accent,
    backgroundColor: AppColors.background,
    cardColor: AppColors.card,
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: AppColors.text),
      bodyText2: TextStyle(color: AppColors.subText),
    ),
  );

  // tema escuro
  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.accent,
    backgroundColor: const Color(0xFF303030),
    cardColor: const Color(0xFF424242),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: AppColors.text),
      bodyText2: TextStyle(color: AppColors.subText),
    ),
  );
}
