import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/user/user_cubit.dart';
import '../../../../utils/constants/app_sizedboxes.dart';
import '../../../../utils/constants/app_txt_styles.dart';

class UserCredentials extends StatelessWidget {
  const UserCredentials({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserSuccess) {
          final user = state.user;
          return Column(
            children: [
              Text(
                user.displayName ?? 'No Name',
                style: AppTxtStyles.montserrat300Grey,
              ),
              AppSizedboxes.h16,
              Text(
                user.email ?? 'No Email',
                style: AppTxtStyles.montRegWhite14,
              ),
            ],
          );
        } else if (state is UserLoading) {
          return const CircularProgressIndicator.adaptive();
        } else if (state is UserError) {
          return Text(
            state.error,
            style: AppTxtStyles.montserrat300Grey,
          );
        } else {
          return Text(
            "Unexpected error occurred.",
            style: AppTxtStyles.montserrat300Grey,
          );
        }
      },
    );
  }
}
