import 'package:flutter/material.dart';

import '../../utils/constants/app_txt_styles.dart';
import '../../utils/extensions/locale_extension.dart';

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
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Text(
            heading,
            style: AppTxtStyles.monts20white500,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              context.l10n.viewAll,
              style: AppTxtStyles.montserratRegularBlue,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        )
      ],
    );
  }
}
