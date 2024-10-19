import 'package:flutter/material.dart';
import 'package:movix/utils/constants/app_sizedboxes.dart';
import 'package:movix/utils/constants/app_txt_styles.dart';

class LangOption extends StatelessWidget {
  const LangOption({
    super.key,
    required this.language,
    required this.imagePath,
    required this.onTap,
  });

  final String language;
  final String imagePath;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 70,
            height: 70,
          ),
          AppSizedboxes.h16,
          Text(language, style: AppTxtStyles.monts20white500),
        ],
      ),
    );
  }
}
