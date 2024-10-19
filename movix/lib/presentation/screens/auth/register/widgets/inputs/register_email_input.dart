import 'package:flutter/material.dart';
import 'package:movix/utils/constants/app_strings.dart';

import '../../../../../widgets/global_input.dart';

class RegisterEmailInput extends StatelessWidget {

  const RegisterEmailInput({ super.key });

   @override
   Widget build(BuildContext context) {
       return const GlobalInput(label: AppStrings.emailAddress, isSecure: false, prefixIcon: null,);
  }
}