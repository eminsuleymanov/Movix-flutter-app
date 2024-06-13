import 'package:flutter/material.dart';

import '../../../../utils/constants/app_txt_styles.dart';

class AuthMiniLinks extends StatelessWidget {
  const AuthMiniLinks({
    super.key,
    required this.grayTxt,
    required this.blueTxt,
    this.onPressed,
  });
  final String grayTxt;
  final String blueTxt;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          grayTxt,
          style: AppTxtStyles.montserratRegularGray,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            blueTxt,
            style: AppTxtStyles.montserratRegularBlue,
          ),
        )
      ],
    ));
  }
}
