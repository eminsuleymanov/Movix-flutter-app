import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';

class CustomBlurEffect extends StatelessWidget {
  const CustomBlurEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: 45,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 0, sigmaY: 6, tileMode: TileMode.repeated),
          child: const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.backgroundPrimary,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
