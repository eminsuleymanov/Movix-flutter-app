import 'package:flutter/material.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/constants/app_txt_styles.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(
        backgroundColor: AppColors.backgroundPrimary,
        title: Text(
          AppStrings.profile,
          style: AppTxtStyles.montRegWhite14,
        ),
      ),
           body: Container(),
       );
  }
}