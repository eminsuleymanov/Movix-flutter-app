import 'package:flutter/material.dart';

import '../../../../utils/constants/app_txt_styles.dart';

class MovieInfoText extends StatelessWidget {
  final int year;
  final List genres;
  final int runtime;

  const MovieInfoText({
    super.key,
    required this.year,
    required this.genres,
    required this.runtime,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$year, ${genres.join('/')} , $runtime min",
      style: AppTxtStyles.montRegWhite14,
    );
  }
}
