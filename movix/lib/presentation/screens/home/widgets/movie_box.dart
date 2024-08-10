import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/movie.dart';
import '../../../../utils/constants/app_sizedboxes.dart';
import '../../../../utils/constants/app_txt_styles.dart';

class MovieBox extends StatelessWidget {
  const MovieBox({
    super.key,
    required this.movie,
    this.width = 110,
    this.isSliderItem = false, this.onTap,
  });
  final MovieResponse movie;
  final double width;
  final bool isSliderItem;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onTap,
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
      ),
    );
  }
}
