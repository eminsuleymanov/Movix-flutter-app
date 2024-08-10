import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../data/models/movie.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizedboxes.dart';
import '../../../../utils/constants/app_txt_styles.dart';
import '../../../../utils/constants/assets_paths.dart';

class MovieRatings extends StatelessWidget {
  const MovieRatings({super.key, required this.ratings});

  final List<Rating> ratings;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: ratings.map((rating) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildIcon(rating.source),
            AppSizedboxes.w4,
            Text(
              rating.value,
              style: AppTxtStyles.montRegWhite14,
            ),
            AppSizedboxes.w20,
          ],
        );
      }).toList(),
    );
  }

  Widget _buildIcon(String source) {
    switch (source) {
      case 'IMDb':
        return const Icon(
          FontAwesomeIcons.imdb,
          color: AppColors.yellow,
          size: 25,
        );
      case 'Rotten Tomatoes':
        return Image.asset(
          AssetsPaths.tomato,
          width: 25,
          height: 25,
        );
      default:
        return const Icon(Icons.star, color: AppColors.yellow);
    }
  }
}
