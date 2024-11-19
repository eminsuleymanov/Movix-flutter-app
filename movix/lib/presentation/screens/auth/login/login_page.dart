import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movix/core/routes/generator.dart';
import 'package:movix/cubits/login/cubit/login_cubit.dart';
import 'package:movix/presentation/screens/auth/login/widgets/buttons/forgot_password_txt.dart';
import 'package:movix/presentation/screens/auth/login/widgets/buttons/log_via_social.dart';
import 'package:movix/presentation/screens/auth/login/widgets/inputs/login_email_input.dart';
import 'package:movix/presentation/screens/auth/login/widgets/inputs/login_password_input.dart';
import 'package:movix/presentation/screens/auth/register/register_page.dart';
import 'package:movix/presentation/screens/auth/widgets/auth_mini_links.dart';
import 'package:movix/presentation/screens/home/home_screen.dart';
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
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigate.replace(context, const HomeScreen());
            } else if(state is LoginError){
              ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            return ListView(
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
                20.verticalSpace,
                const LoginEmailInput(),
                28.verticalSpace,
                const LoginPasswordInput(),
                const ForgotPasswordTxt(),
                34.verticalSpace,
                if (state is LoginLoading)
                    const Center(child: CircularProgressIndicator())
                  else
                    Center(
                  child: GlobalButton(
                    text: AppStrings.login,
                    color: AppColors.purple,
                    onTap: context.read<LoginCubit>().signin,
                  ),
                ),
                AuthMiniLinks(
                  grayTxt: AppStrings.createNewAcc,
                  blueTxt: AppStrings.signUp,
                  onPressed: () => Navigate.to(context, const RegisterPage()),
                ),
                26.verticalSpace,
                const LogViaSocial()
              ],
            );
          },
        ),
      ),
    );
  }
}
