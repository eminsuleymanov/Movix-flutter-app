import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movix/utils/constants/app_sizedboxes.dart';
import 'package:movix/data/models/movie.dart';
import 'package:movix/utils/constants/app_colors.dart';
import 'package:movix/utils/constants/app_txt_styles.dart';

class MovieBox extends StatelessWidget {
  const MovieBox({
    super.key,
    required this.movie,
    this.width = 110,
    this.isSliderItem = false,
  });
  final MovieResponse movie;
  final double width;
  final bool isSliderItem;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              movie.poster,
              fit: BoxFit.cover,
              width: double.infinity,
              height: isSliderItem ? 200.h : 150.h,
            ),
          ),
          if (!isSliderItem) AppSizedboxes.h6,
          if (!isSliderItem)
            Text(
              movie.title,
              style: AppTxtStyles.montserratRegularWhite16,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
        ],
      ),
    );
  }
}
