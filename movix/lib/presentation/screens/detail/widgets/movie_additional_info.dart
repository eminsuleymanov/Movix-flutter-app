import 'package:flutter/material.dart';

import '../../../../utils/constants/app_txt_styles.dart';

class MovieAdditionalInfo extends StatelessWidget {
  const MovieAdditionalInfo({
    super.key,
    required this.label,
    required this.value,
  });
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$label: ",
          style: AppTxtStyles.montRegWhite14,
        ),
        Text(
          value,
          style: AppTxtStyles.montserratRegularGray,
        )
      ],
    );
  }
}
