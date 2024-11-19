import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movix/utils/constants/app_sizedboxes.dart';

import '../../../core/routes/generator.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/constants/app_txt_styles.dart';
import '../../../utils/constants/assets_paths.dart';
import '../../widgets/global_button.dart';
import '../auth/login/login_page.dart';
import '../auth/register/register_page.dart';
import '../auth/widgets/auth_mini_links.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.all16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsPaths.appLogo,
              width: 220.w,
              height: 220.h,
            ),
            AppSizedboxes.h20,
            Text(
              AppStrings.newExperience,
              style: AppTxtStyles.montserrat500white,
            ),
            AppSizedboxes.h20,
            Text(
              AppStrings.onboardGreytxt,
              style: AppTxtStyles.montserrat300Grey,
              textAlign: TextAlign.center,
            ),
            AppSizedboxes.h60,
            GlobalButton(
              onTap: () => Navigate.to(context, const RegisterPage()),
              text: AppStrings.getStarted,
              gradientColor1: AppColors.lightBlueGradient1,
              gradientColor2: AppColors.lightBlueGradient2,
            ),
            AppSizedboxes.h10,
            AuthMiniLinks(
              grayTxt: AppStrings.alreadyHaveAcc,
              blueTxt: AppStrings.signIn,
              onPressed: () => Navigate.replace(context, const LoginPage()),
            ),
          ],
        ),
      ),
    );
  }
}
