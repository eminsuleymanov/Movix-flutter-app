import 'package:flutter/material.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_paddings.dart';
import '../../../../utils/constants/app_txt_styles.dart';

class RatedBox extends StatelessWidget {
  const RatedBox({super.key, required this.rated});
  final String rated;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: Padding(
        padding: AppPaddings.h8v4,
        child: Text(
          rated,
          style: AppTxtStyles.montRegWhite14,
        ),
      ),
    );
  }
}
