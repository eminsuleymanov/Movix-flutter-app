import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubits/register/register_cubit.dart';
import '../../../../../../utils/constants/app_strings.dart';
import '../../../../../widgets/global_input.dart';

class ConfirmPaswordInput extends StatelessWidget {
  const ConfirmPaswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();

    return GlobalInput(
      controller: registerCubit.confirmPasswordController,
      isSecure: true,
      label: AppStrings.confirmPassword,
    );
  }
}
