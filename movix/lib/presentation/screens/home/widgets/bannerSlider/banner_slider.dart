import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movix/utils/constants/app_colors.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: 5,

        itemBuilder: (context, _, d) {
          return Container(
            width: 300,
            height: 200,
            color: AppColors.background2,
            margin: EdgeInsets.all(10),
          );
        },
        options: CarouselOptions(
          enlargeCenterPage: true,
           viewportFraction: 0.8,
           enlargeFactor: .2
        ));
  }
}
