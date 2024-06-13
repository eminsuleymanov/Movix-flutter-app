
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: AppColors.primarySwatch,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.backgroundPrimary,
  );
}