import 'package:flutter/material.dart';
import 'package:movix/data/models/movie.dart';
import 'package:movix/utils/constants/app_colors.dart';
import 'package:movix/utils/constants/app_txt_styles.dart';

class MovieSliderItem extends StatelessWidget {
  const MovieSliderItem({
    super.key,
    required this.movie,
  });

  final MovieResponse movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, //width props eliyib movieboxun evezine iwletmek olar with few changes
      height: 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        image: DecorationImage(
          image: movie.poster.isNotEmpty
              ? NetworkImage(movie.poster)
              : const ColoredBox(color: AppColors.background2) as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
      child:  Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            movie.title,
            style: AppTxtStyles.monts20white500,
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
