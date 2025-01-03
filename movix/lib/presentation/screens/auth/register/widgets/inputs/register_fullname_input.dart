import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubits/register/register_cubit.dart';
import '../../../../../../utils/extensions/locale_extension.dart';
import '../../../../../widgets/global_input.dart';

class RegisterFullnameInput extends StatelessWidget {
  const RegisterFullnameInput({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit= context.read<RegisterCubit>();
    return  GlobalInput(
      label: context.l10n.fullName,
      controller: registerCubit.fullnameController,
      isSecure: false,
      prefixIcon: null,
    );
  }
}
