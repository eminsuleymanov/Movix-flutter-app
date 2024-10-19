import 'package:flutter/material.dart';
import 'package:movix/presentation/widgets/global_input.dart';
import 'package:movix/utils/constants/app_strings.dart';

class FullNameInput extends StatelessWidget {

  const FullNameInput({ super.key });

   @override
   Widget build(BuildContext context) {
       return const GlobalInput(isSecure: false, label: AppStrings.fullName);
  }
}