import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movix/core/routes/generator.dart';
import 'package:movix/presentation/screens/auth/login/widgets/buttons/forgot_password_txt.dart';
import 'package:movix/presentation/screens/auth/login/widgets/buttons/log_via_social.dart';
import 'package:movix/presentation/screens/auth/login/widgets/inputs/login_email_input.dart';
import 'package:movix/presentation/screens/auth/login/widgets/inputs/login_password_input.dart';
import 'package:movix/presentation/screens/auth/register/register_page.dart';
import 'package:movix/presentation/screens/auth/widgets/auth_mini_links.dart';
import 'package:movix/presentation/widgets/global_button.dart';
import 'package:movix/utils/constants/app_colors.dart';
import 'package:movix/utils/constants/app_paddings.dart';
import 'package:movix/utils/constants/app_strings.dart';
import 'package:movix/utils/constants/app_txt_styles.dart';
import 'package:movix/utils/constants/assets_paths.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.all16,
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                AssetsPaths.appLogo,
                width: 120.w,
                height: 120.h,
              ),
            ),
            Text(
              AppStrings.welcomeBack,
              style: AppTxtStyles.montserrat500white,
            ),
            SizedBox(
              height: 20.h,
            ),
            const LoginEmailInput(),
            SizedBox(
              height: 28.h,
            ),
            const LoginPasswordInput(),
            const ForgotPasswordTxt(),
            SizedBox(
              height: 34.h,
            ),
            const Center(
              child: GlobalButton(
                text: AppStrings.login,
                color: AppColors.purple,
              ),
            ),
            AuthMiniLinks(
              grayTxt: AppStrings.createNewAcc,
              blueTxt: AppStrings.signUp,
              onPressed: () => Navigate.to(context, const RegisterPage()),
            ),
            SizedBox(
              height: 26.h,
            ),
            const LogViaSocial()
          ],
        ),
      ),
    );
  }
}
