import 'package:flutter/material.dart';
import 'package:movix/utils/constants/app_colors.dart';
import 'package:movix/utils/constants/app_paddings.dart';
import 'package:movix/utils/constants/app_txt_styles.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    super.key,
    required this.category,
    required this.isSelected,
    this.onTap,
  });
  final String category;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: isSelected
                ? AppColors.lightBlueGradient1
                : AppColors.background2,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: AppPaddings.h24,
          child: Center(
            child: Text(
              category,
              style: AppTxtStyles.montserratRegularWhite16,
            ),
          ),
        ),
      ),
    );
  }
}
