import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movix/utils/constants/app_colors.dart';

class AppTxtStyles {
  static var montserrat500white = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 24.sp,
      color: AppColors.white);

  static var monts20white500 = montserrat500white.copyWith(
    fontSize: 20.sp,
  );
  static var montserrat300Grey = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w300,
      fontSize: 18.sp,
      color: AppColors.whiteOpacity);

  static var montserratRegularGray = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      color: AppColors.whiteOpacity);

  static var montserratRegularBlue = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      foreground: Paint()
        ..shader = AppColors.blueGradient
            .createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)));

  static var montserratRegularWhite16 =
      montserratRegularGray.copyWith(color: AppColors.white);

  static var montRegWhite14 = montserratRegularWhite16.copyWith(fontSize: 14.sp);
}
