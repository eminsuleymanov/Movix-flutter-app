import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/routes/generator.dart';
import '../../../../cubits/login/cubit/login_cubit.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_paddings.dart';
import '../../../../utils/constants/app_strings.dart';
import '../../../../utils/constants/app_txt_styles.dart';
import '../../../../utils/constants/assets_paths.dart';
import '../../../widgets/global_button.dart';
import '../../../widgets/global_snackbar.dart';
import '../../home/home_view.dart';
import '../register/register_page.dart';
import '../widgets/auth_mini_links.dart';
import 'widgets/buttons/forgot_password_txt.dart';
import 'widgets/buttons/log_via_social.dart';
import 'widgets/inputs/login_email_input.dart';
import 'widgets/inputs/login_password_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.all16,
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if(state is LoginLoading){
               const CircularProgressIndicator.adaptive();
            }
            else if (state is LoginSuccess) {
              GlobalSnackbar.show(context, state.message!,
                  backgroundColor: AppColors.green);
              Future.delayed(const Duration(milliseconds: 1200), () {
                if (context.mounted) {
                  Navigate.replace(context, const HomeView());
                }
              });
            } else if (state is LoginError) {
              GlobalSnackbar.show(context, state.error,
                  backgroundColor: AppColors.red);
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
                      onTap: context.read<LoginCubit>().signIn,
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
