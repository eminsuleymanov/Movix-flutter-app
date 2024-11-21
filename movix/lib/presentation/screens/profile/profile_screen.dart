import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movix/core/routes/generator.dart';
import 'package:movix/cubits/login/cubit/login_cubit.dart';
import 'package:movix/presentation/screens/auth/login/login_page.dart';
import 'package:movix/presentation/widgets/global_snackbar.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_sizedboxes.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/constants/app_txt_styles.dart';
import '../../widgets/global_profile_avatar.dart';
import 'widgets/profile_settings.dart';
import 'widgets/user_credentials.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPrimary,
        title: Text(
          AppStrings.profile,
          style: AppTxtStyles.montserrat500white,
        ),
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LogOut) {
            GlobalSnackbar.show(context, state.message,
                backgroundColor: AppColors.green);
                Navigate.replace(context, const LoginPage());
          } else if(state is LogOutError){
            GlobalSnackbar.show(context, state.message,
                backgroundColor: AppColors.red);

          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const GlobalProfileAvatar(),
              AppSizedboxes.h20,
              const UserCredentials(),
              AppSizedboxes.h25,
              const ProfileSettings()
            ],
          );
        },
      ),
    );
  }
}
