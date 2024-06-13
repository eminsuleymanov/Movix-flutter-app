import 'package:flutter/material.dart';

import '../../../../../widgets/global_input.dart';

class ConfirmPaswordInput extends StatelessWidget {

  const ConfirmPaswordInput({ super.key });

   @override
   Widget build(BuildContext context) {
       return const GlobalInput(isSecure: true,label: "Password", );
  }
}