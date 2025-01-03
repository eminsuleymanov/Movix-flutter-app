import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubits/login/cubit/login_cubit.dart';
import '../../../../../../utils/extensions/locale_extension.dart';
import '../../../../../widgets/global_input.dart';

class LoginEmailInput extends StatelessWidget {
  const LoginEmailInput({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return  GlobalInput(
      label: context.l10n.emailAddress,
      controller: cubit.email,
      isSecure: false,
      prefixIcon: null,
    );
  }
}
