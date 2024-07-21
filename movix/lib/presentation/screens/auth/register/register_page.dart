import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movix/presentation/screens/auth/register/widgets/inputs/confirm_pasword_input.dart';
import 'package:movix/presentation/screens/auth/register/widgets/inputs/register_email_input.dart';
import 'package:movix/presentation/screens/auth/register/widgets/inputs/register_fullname_input.dart';
import 'package:movix/presentation/screens/auth/register/widgets/inputs/register_password_input.dart';
import 'package:movix/utils/constants/app_colors.dart';
import 'package:movix/utils/constants/app_paddings.dart';
import 'package:movix/utils/constants/app_strings.dart';
import 'package:movix/utils/constants/app_txt_styles.dart';

import '../../../widgets/global_button.dart';
import '../../../widgets/global_profile_avatar.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 30,
        foregroundColor: AppColors.white,
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.backgroundPrimary,
        
      ),
      body: SafeArea(
        child: Padding(
            padding: AppPaddings.all16,
            child: ListView(
              children: [
                Text(
                  AppStrings.createNewAccount,
                  style: AppTxtStyles.montserrat500white,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const GlobalProfileAvatar(),
                SizedBox(
                  height: 40.h,
                ),
                const RegisterFullnameInput(),
                SizedBox(
                  height: 28.h,
                ),
                const RegisterEmailInput(),
                SizedBox(
                  height: 28.h,
                ),
                const RegisterPasswordInput(),
                SizedBox(
                  height: 28.h,
                ),
                const ConfirmPaswordInput(),
                SizedBox(
                  height: 34.h,
                ),
                const Center(
                  child: GlobalButton(
                    text: AppStrings.signIn,
                    color: AppColors.purple,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
