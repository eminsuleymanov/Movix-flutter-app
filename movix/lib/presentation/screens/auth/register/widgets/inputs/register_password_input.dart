import 'package:flutter/material.dart';
import 'package:movix/utils/constants/app_strings.dart';

import '../../../../../widgets/global_input.dart';

class RegisterPasswordInput extends StatelessWidget {

  const RegisterPasswordInput({ super.key });

   @override
   Widget build(BuildContext context) {
       return const GlobalInput(isSecure: true,label: AppStrings.password, );
  }
}