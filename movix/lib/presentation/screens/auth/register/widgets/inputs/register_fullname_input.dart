import 'package:flutter/material.dart';

import '../../../../../../utils/constants/app_strings.dart';
import '../../../../../widgets/global_input.dart';

class RegisterFullnameInput extends StatelessWidget {

  const RegisterFullnameInput({ super.key });

   @override
   Widget build(BuildContext context) {
       return const GlobalInput(label: AppStrings.fullName, isSecure: false, prefixIcon: null,);
  }
}