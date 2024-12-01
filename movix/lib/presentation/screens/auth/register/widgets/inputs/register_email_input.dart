import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubits/register/register_cubit.dart';
import '../../../../../../utils/constants/app_strings.dart';
import '../../../../../widgets/global_input.dart';

class RegisterEmailInput extends StatelessWidget {
  const RegisterEmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
    return GlobalInput(
      label: AppStrings.emailAddress,
      controller: registerCubit.emailController,
      isSecure: false,
      prefixIcon: null,
    );
  }
}
