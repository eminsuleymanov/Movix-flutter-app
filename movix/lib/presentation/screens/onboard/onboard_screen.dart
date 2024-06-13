import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movix/core/routes/generator.dart';
import 'package:movix/presentation/screens/auth/widgets/auth_mini_links.dart';
import 'package:movix/presentation/widgets/global_button.dart';
import 'package:movix/utils/constants/app_colors.dart';
import 'package:movix/utils/constants/app_paddings.dart';
import 'package:movix/utils/constants/app_strings.dart';
import 'package:movix/utils/constants/app_txt_styles.dart';
import 'package:movix/utils/constants/assets_paths.dart';

import '../auth/login/login_page.dart';

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
            SizedBox(height: 20.h),
            Text(
              AppStrings.newExperience,
              style: AppTxtStyles.montserrat500white,
            ),
            SizedBox(height: 20.h),
            Text(
              AppStrings.onboardGreytxt,
              style: AppTxtStyles.montserrat300Grey,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 60.h,
            ),
            GlobalButton(
              onTap: () {},
              text: AppStrings.getStarted,
              gradientColor1: AppColors.lightBlueGradient1,
              gradientColor2: AppColors.lightBlueGradient2,
            ),
            SizedBox(height: 10.h,),
            AuthMiniLinks(grayTxt: AppStrings.alreadyHaveAcc,blueTxt: AppStrings.signIn,onPressed: () => Navigate.to(context, const LoginPage()),),
          ],
        ),
      ),
    );
  }
}
