import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movix/cubits/login/cubit/login_cubit.dart';
import 'package:movix/presentation/widgets/global_button.dart';
import 'package:movix/presentation/widgets/global_input.dart';
import 'package:movix/utils/constants/app_colors.dart';
import 'package:movix/utils/constants/app_paddings.dart';
import 'package:movix/utils/constants/app_sizedboxes.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/constants/app_txt_styles.dart';

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
        child: Column(
          children: [
            AppSizedboxes.h20,
            GlobalInput(
              isSecure: false,
              label: "Type your email to reset password",
              controller: context.read<LoginCubit>().resetPassword,
            ),
            AppSizedboxes.h20,
            const GlobalButton(
              text: AppStrings.sendLink,
              color: AppColors.purple,
            )
          ],
        ),
      ),
    );
  }
}
