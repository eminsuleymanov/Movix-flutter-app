import 'package:flutter/material.dart';

import '../../../../../widgets/global_input.dart';

class LoginEmailInput extends StatelessWidget {

  const LoginEmailInput({ super.key });

   @override
   Widget build(BuildContext context) {
       return const GlobalInput(label: "Email Address", isSecure: false, prefixIcon: null,);
  }
}
