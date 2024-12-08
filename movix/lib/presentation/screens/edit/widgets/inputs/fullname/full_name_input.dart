import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movix/presentation/widgets/global_input.dart';
import 'package:movix/utils/constants/app_strings.dart';

import '../../../../../../cubits/user/user_cubit.dart';

class FullNameInput extends StatelessWidget {
  const FullNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    return GlobalInput(
      label: AppStrings.fullName,
      controller: userCubit.editNameController,
      isSecure: false,
      prefixIcon: null,
    );
  }
}
