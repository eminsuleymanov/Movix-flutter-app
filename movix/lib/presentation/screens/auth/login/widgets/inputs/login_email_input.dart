import 'package:flutter/material.dart';

import '../../../../../../utils/constants/app_strings.dart';
import '../../../../../widgets/global_input.dart';

class LoginEmailInput extends StatelessWidget {

  const LoginEmailInput({ super.key });

   @override
   Widget build(BuildContext context) {
       return const GlobalInput(label: AppStrings.emailAddress, isSecure: false, prefixIcon: null,);
  }
}
