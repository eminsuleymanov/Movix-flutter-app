import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movix/utils/constants/app_colors.dart';
import 'package:movix/utils/constants/app_paddings.dart';
import 'package:movix/utils/constants/app_sizedboxes.dart';
import 'package:movix/utils/constants/app_strings.dart';
import 'package:movix/utils/constants/app_txt_styles.dart';

class SearchbarWithFilter extends StatelessWidget {
  const SearchbarWithFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.background2,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: TextField(
              style: AppTxtStyles.montserratRegularWhite16,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: AppPaddings.h12,
                  child: Icon(
                    Icons.search_rounded,
                    color: AppColors.white,
                    size: 26,
                  ),
                ),
                hintText: AppStrings.searchMovie,
                hintStyle: AppTxtStyles.montserratRegularWhite16,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        AppSizedboxes.w20,
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Icon(Icons.tune_rounded, color: AppColors.white),
        ),
      ],
    );
  }
}
