import 'package:flutter/material.dart';

import '../../../../../../utils/constants/app_strings.dart';
import '../../../../../widgets/global_input.dart';

class EmailInput extends StatelessWidget {

  const EmailInput({ super.key });

   @override
   Widget build(BuildContext context) {
       return const GlobalInput(isSecure: false, label: AppStrings.emailAddress);
  }
}