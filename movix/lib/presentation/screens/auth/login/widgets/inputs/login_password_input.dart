import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubits/login/cubit/login_cubit.dart';
import '../../../../../../utils/extensions/locale_extension.dart';
import '../../../../../widgets/global_input.dart';

class LoginPasswordInput extends StatelessWidget {
  const LoginPasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return GlobalInput(
      isSecure: true,
      label: context.l10n.password,
      controller: cubit.password,
    );
  }
}
