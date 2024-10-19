import 'package:flutter/material.dart';
import '../../../../../widgets/global_input.dart';
import '../../../../../../utils/constants/app_strings.dart';

class LoginPasswordInput extends StatelessWidget {

  const LoginPasswordInput({ super.key });

   @override
   Widget build(BuildContext context) {
       return const GlobalInput(isSecure: true,label: AppStrings.password, );
  }
}