import 'package:flutter/material.dart';

class Navigate {
  const Navigate._();

  static to(BuildContext context, Widget page) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );

  static void replace(BuildContext context, Widget page) =>
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
  static void back(BuildContext context, Widget page) =>
      Navigator.of(context).pop();
}
