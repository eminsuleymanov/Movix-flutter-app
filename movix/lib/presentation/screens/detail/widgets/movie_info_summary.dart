import 'package:flutter/material.dart';

import '../../../../data/models/movie.dart';
import '../../../../utils/constants/app_sizedboxes.dart';
import '../../../../utils/constants/app_txt_styles.dart';
import 'movie_additional_info.dart';

class MovieInfoSummary extends StatelessWidget {
  const MovieInfoSummary({super.key, required this.movie});
  final MovieResponse movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(movie.plot, style: AppTxtStyles.montRegWhite14),
        AppSizedboxes.h16,
        MovieAdditionalInfo(label: "Director", value: movie.director),
        AppSizedboxes.h4,
        MovieAdditionalInfo(label: "Country", value: movie.country),
        AppSizedboxes.h4,
        MovieAdditionalInfo(label: "Box Office", value: movie.boxOffice),
        AppSizedboxes.h4,
        MovieAdditionalInfo(
          label: "Languages",
          value: movie.language.join(', '),
        ),
      ],
    );
  }
}
