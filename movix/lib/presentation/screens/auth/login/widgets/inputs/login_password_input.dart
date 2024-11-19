import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movix/cubits/login/cubit/login_cubit.dart';
import '../../../../../widgets/global_input.dart';
import '../../../../../../utils/constants/app_strings.dart';

class LoginPasswordInput extends StatelessWidget {
  const LoginPasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return GlobalInput(
      isSecure: true,
      label: AppStrings.password,
      controller: cubit.password,
    );
  }
}
