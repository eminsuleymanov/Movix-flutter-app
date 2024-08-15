import 'package:flutter/material.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_paddings.dart';
import '../../../../utils/constants/app_sizedboxes.dart';

class DetailActionBtn extends StatelessWidget {
  const DetailActionBtn({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });
  final IconData icon;
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppPaddings.h30v16,
        decoration: const BoxDecoration(
            color: AppColors.background2,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.yellow,
            ),
            AppSizedboxes.w8,
            Text(
              text,
              style: const TextStyle(color: AppColors.yellow, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
