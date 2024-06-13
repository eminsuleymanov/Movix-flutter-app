import 'package:flutter/material.dart';
import 'package:movix/presentation/widgets/global_input.dart';

class LoginPasswordInput extends StatelessWidget {

  const LoginPasswordInput({ super.key });

   @override
   Widget build(BuildContext context) {
       return const GlobalInput(isSecure: true,label: "Password", );
  }
}