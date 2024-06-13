import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundPrimary = Color(0xff0A0F2F);
  static const Color background2 = Color.fromRGBO(21, 29, 59, 1);
  
  static const Color white = Color(0xffFFFFFF);
  static const Color whiteOpacity = Color.fromRGBO(255, 255, 255, 0.7);
  static const Color lightBlueGradient1 = Color.fromRGBO(68, 158, 255, 1);
  static const Color lightBlueGradient2 = Color.fromRGBO(29, 199, 247, 1);
  static const LinearGradient blueGradient = LinearGradient(
    colors: [AppColors.lightBlueGradient1, AppColors.lightBlueGradient2],
  );
  static const purple = Color.fromRGBO(62,91,249,1);

  static const primarySwatch = MaterialColor(0xff0B0F2F, <int, Color>{
    50: Color.fromRGBO(9, 11, 45, .1),
    100: Color.fromRGBO(9, 11, 45, .2),
    200: Color.fromRGBO(9, 11, 45, .3),
    300: Color.fromRGBO(9, 11, 45, .4),
    400: Color.fromRGBO(9, 11, 45, .5),
    500: Color.fromRGBO(9, 11, 45, .6),
    600: Color.fromRGBO(9, 11, 45, .7),
    700: Color.fromRGBO(9, 11, 45, .8),
    800: Color.fromRGBO(9, 11, 45, .9),
    900: Color.fromRGBO(9, 11, 45, 1),
  });
}
