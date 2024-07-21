import 'package:flutter/material.dart';

import '../../utils/constants/app_strings.dart';
import '../../utils/constants/app_txt_styles.dart';

class GlobalSectionHeadlines extends StatelessWidget {
  const GlobalSectionHeadlines({
    super.key,
    required this.heading,
    required this.onPressed,
  });
  final String heading;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          heading,
          style: AppTxtStyles.monts20white500,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            AppStrings.viewAll,
            style: AppTxtStyles.montserratRegularBlue,
          ),
        )
      ],
    );
  }
}
