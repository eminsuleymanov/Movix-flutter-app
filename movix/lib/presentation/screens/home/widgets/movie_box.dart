import 'package:flutter/material.dart';
import 'package:movix/utils/constants/app_sizedboxes.dart';
import 'package:movix/data/models/movie.dart';
import 'package:movix/utils/constants/app_colors.dart';
import 'package:movix/utils/constants/app_txt_styles.dart';

class MovieBox extends StatelessWidget {
  const MovieBox({super.key, required this.movie});
  final MovieResponse movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              movie.poster,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) => Container(
                color: AppColors.background2,
                height: 150,
                width: double.infinity,
                child: const Center(
                  child: Icon(Icons.error, color: AppColors.white),
                ),
              ),
            ),
          ),
          AppSizedboxes.h6,
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
