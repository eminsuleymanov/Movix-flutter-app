import 'package:flutter/material.dart';

import '../../../../../../utils/constants/app_strings.dart';
import '../../../../../../utils/constants/app_txt_styles.dart';

class ForgotPasswordTxt extends StatelessWidget {
  const ForgotPasswordTxt({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        AppStrings.forgotPassword,
        style: AppTxtStyles.montserratRegularWhite16,
        // textAlign: TextAlign.end,
      ),
      onPressed: () {},
    );
  }
}
