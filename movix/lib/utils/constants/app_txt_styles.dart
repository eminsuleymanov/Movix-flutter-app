import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movix/utils/constants/app_colors.dart';

class AppTxtStyles {
  static var montserrat500white = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 24.sp,
      color: AppColors.white);
  static var monts18white500 = montserrat500white.copyWith(
    fontSize: 18.sp,
  );
  static var montserrat300Grey = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w300,
      fontSize: 18.sp,
      color: AppColors.whiteOpacity);
  static var montserratRegularGray = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      color: AppColors.whiteOpacity);
  static var montserratRegularBlue = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      foreground: Paint()
        ..shader = AppColors.blueGradient
            .createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)));

  static var montserratRegularWhite14 =
      montserratRegularGray.copyWith(color: AppColors.white);
}
