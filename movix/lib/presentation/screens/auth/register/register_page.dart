import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cubits/register/register_cubit.dart';
import '../login/login_page.dart';
import 'widgets/inputs/confirm_pasword_input.dart';
import 'widgets/inputs/register_email_input.dart';
import 'widgets/inputs/register_fullname_input.dart';
import 'widgets/inputs/register_password_input.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_paddings.dart';
import '../../../../utils/constants/app_strings.dart';
import '../../../../utils/constants/app_txt_styles.dart';

import '../../../../core/routes/generator.dart';
import '../../../widgets/global_button.dart';
import '../../../widgets/global_profile_avatar.dart';
import '../../../widgets/global_snackbar.dart';

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
            child: BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterLoading) {
                  const CircularProgressIndicator.adaptive();
                } else if (state is RegisterSuccess) {
                  GlobalSnackbar.show(context, state.message,
                      backgroundColor: AppColors.green);
                  Future.delayed(const Duration(milliseconds: 800), () {
                    if (context.mounted) {
                      Navigate.replace(context, const LoginPage());
                    }
                  });
                }
                else if (state is RegisterError) {
              GlobalSnackbar.show(context, state.error,
                  backgroundColor: AppColors.red);
            }
              },
              builder: (context, state) {
                return ListView(
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
                    Center(
                      child: GlobalButton(
                        text: AppStrings.signUp,
                        color: AppColors.purple,
                        onTap: context.read<RegisterCubit>().register,
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
