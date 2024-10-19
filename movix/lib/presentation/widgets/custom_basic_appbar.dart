import 'package:flutter/material.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_txt_styles.dart';

class CustomBasicAppbar extends StatelessWidget implements PreferredSizeWidget{

  const CustomBasicAppbar({ super.key, required this.text });
  final String text;
   @override
   Widget build(BuildContext context) {
       return AppBar(
        title: Text(
          text,
          style: AppTxtStyles.monts20white500,
        ),
        backgroundColor: AppColors.backgroundPrimary,
        foregroundColor:  AppColors.white,
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}