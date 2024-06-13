import 'package:flutter/material.dart';

import '../../../../../widgets/global_input.dart';

class RegisterFullnameInput extends StatelessWidget {

  const RegisterFullnameInput({ super.key });

   @override
   Widget build(BuildContext context) {
       return const GlobalInput(label: "Full name", isSecure: false, prefixIcon: null,);
  }
}