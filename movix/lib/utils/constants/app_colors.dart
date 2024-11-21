import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundPrimary = Color(0xff0A0F2F);
  static const Color background2 = Color.fromRGBO(21, 29, 59, 1);
  
  static const Color white = Color(0xffFFFFFF);
  static const Color whiteOpacity = Color(0xB1FFFFFF);
  static const Color lightBlueGradient1 = Color(0xFF449EFF);
  static const Color lightBlueGradient2 = Color(0xFF1DC7F7);
  static const LinearGradient blueGradient = LinearGradient(
    colors: [AppColors.lightBlueGradient1, AppColors.lightBlueGradient2],
  );
  static const purple = Color.fromRGBO(62,91,249,1);
  static const yellow = Color(0xffF6C806);
  static const green = Color(0xff5cb85c);
  static const red = Color(0xffcc0000);


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
