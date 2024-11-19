import 'package:flutter/material.dart';

import '../../../../../../core/routes/generator.dart';
import '../../../../../../utils/constants/app_strings.dart';
import '../../../../../../utils/constants/app_txt_styles.dart';
import '../../../../reset_password/reset_screen.dart';

class ForgotPasswordTxt extends StatelessWidget {
  const ForgotPasswordTxt({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        AppStrings.forgotPassword,
        style: AppTxtStyles.montserratRegularWhite16,
      ),
      onPressed: ()=> Navigate.to(context, const ResetScreen()),
    );
  }
}
