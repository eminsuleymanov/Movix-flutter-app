import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/routes/generator.dart';
import '../../../cubits/login/cubit/login_cubit.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_sizedboxes.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/constants/app_txt_styles.dart';
import '../../widgets/global_button.dart';
import '../../widgets/global_input.dart';
import '../../widgets/global_snackbar.dart';
import '../auth/login/login_page.dart';

class ResetScreen extends StatelessWidget {
  const ResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background2,
        foregroundColor: AppColors.white,
        title: Text(
          AppStrings.resetPassword,
          style: AppTxtStyles.monts20white500,
        ),
      ),
      body: Padding(
        padding: AppPaddings.all16,
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccess) {
              GlobalSnackbar.show(context, state.message,backgroundColor: AppColors.green);
              Navigate.replace(context, const LoginPage());

            } 
            else if(state is ResetPasswordError){
               GlobalSnackbar.show(context, state.error,backgroundColor: AppColors.red);
            }
          },
          builder: (context, state) {
            final loginCubit = context.read<LoginCubit>();
            return Column(
              children: [
                AppSizedboxes.h20,
                GlobalInput(
                  isSecure: false,
                  label: "Type your email to reset password",
                  controller: loginCubit.resetPasswordController,
                ),
                AppSizedboxes.h20,
                GlobalButton(
                  text: AppStrings.sendLink,
                  color: AppColors.purple,
                  onTap: loginCubit.resetPassword,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
