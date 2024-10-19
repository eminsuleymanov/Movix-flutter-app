import 'package:flutter/material.dart';
import 'package:movix/utils/constants/app_paddings.dart';
import 'package:movix/utils/constants/app_strings.dart';
import 'package:movix/utils/constants/app_txt_styles.dart';

import '../../widgets/custom_basic_appbar.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomBasicAppbar(text: AppStrings.policy),
      body: Padding(
        padding: AppPaddings.all16,
        child: SafeArea(
          child: SingleChildScrollView(
            child:
                Text(AppStrings.policyText, style: AppTxtStyles.montRegWhite14),
          ),
        ),
      ),
    );
  }
}
