import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movix/data/models/movie.dart';
import 'package:movix/utils/constants/app_colors.dart';
import 'package:movix/utils/constants/app_paddings.dart';
import 'package:movix/utils/constants/app_sizedboxes.dart';
import 'package:movix/utils/constants/app_txt_styles.dart';

class MovieListTile extends StatelessWidget {
  const MovieListTile({
    super.key,
    required this.movie,
  });

  final MovieResponse movie;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: ColoredBox(
        color: AppColors.background2,
        child: Padding(
          padding: AppPaddings.v12,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120.w,
                height: 140.h,
                child: Image.network(
                  movie.poster,
                  fit: BoxFit.contain,
                ),
              ),
              AppSizedboxes.w16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: AppTxtStyles.montserratRegularWhite16,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppSizedboxes.h6,
                    Text(
                      movie.country,
                      style: AppTxtStyles.montserratRegularGray,
                    ),
                    AppSizedboxes.h6,
                    Text(
                      movie.genres.map((e) => e.name).join(', '),
                      style: AppTxtStyles.montserratRegularBlue,
                    ),
                    AppSizedboxes.h6,
                    Text(
                      movie.rated,
                      style: AppTxtStyles.montRegWhite14,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
