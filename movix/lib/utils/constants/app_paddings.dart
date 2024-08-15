
import 'package:flutter/material.dart';

class AppPaddings {
  static const EdgeInsets all8 =EdgeInsets.all(8);
  static const EdgeInsets all10 =EdgeInsets.all(10);
  static const EdgeInsets all16 =EdgeInsets.all(16);
  static const EdgeInsets exceptTop16 = EdgeInsets.fromLTRB(
    16.0,  // left
    0.0,   // top
    16.0,  // right
    16.0,  // bottom
  );


  static const EdgeInsets h8v4 = EdgeInsets.symmetric(horizontal: 8.0,vertical: 4);
  static const EdgeInsets h30v16 = EdgeInsets.symmetric(horizontal: 30.0,vertical: 16);

  static const EdgeInsets h12 = EdgeInsets.symmetric(horizontal: 12.0);
  static const EdgeInsets h16 = EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets h20 = EdgeInsets.symmetric(horizontal: 20.0);
  static const EdgeInsets h24 = EdgeInsets.symmetric(horizontal: 24.0);

  static const EdgeInsets v8 = EdgeInsets.symmetric(vertical: 8.0);
  static const EdgeInsets v10 = EdgeInsets.symmetric(vertical: 10.0);
  static const EdgeInsets v12 = EdgeInsets.symmetric(vertical: 12.0);

  static const EdgeInsets r16 =EdgeInsets.only(right: 16);
  
  static const EdgeInsets l16 =EdgeInsets.only(left: 16);
}