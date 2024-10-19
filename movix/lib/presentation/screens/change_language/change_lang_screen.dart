import 'package:flutter/material.dart';
import 'package:movix/presentation/screens/change_language/widgets/lang_option.dart';
import 'package:movix/utils/constants/app_sizedboxes.dart';
import 'package:movix/utils/constants/assets_paths.dart';

import '../../../utils/constants/app_strings.dart';
import '../../widgets/custom_basic_appbar.dart';

class ChangeLangScreen extends StatelessWidget {
  const ChangeLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomBasicAppbar(text: AppStrings.selectLanguage),
      body: Center(
        child: Column(
         mainAxisSize: MainAxisSize.min,
          children: [
            LangOption(
              language: AppStrings.english,
              imagePath: AssetsPaths.englishFlag,
              onTap: () {},
            ),
            AppSizedboxes.h45,
            LangOption(
              language: AppStrings.russian,
              imagePath: AssetsPaths.russianFlag,
              onTap: () {},
            ),
        
          ],
        ),
      ),
    );
  }
}
