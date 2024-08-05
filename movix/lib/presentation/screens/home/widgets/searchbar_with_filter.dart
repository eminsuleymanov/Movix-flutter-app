import 'package:flutter/material.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_paddings.dart';
import '../../../../utils/constants/app_sizedboxes.dart';
import '../../../../utils/constants/app_strings.dart';
import '../../../../utils/constants/app_txt_styles.dart';

class SearchbarWithFilter extends StatelessWidget {
  const SearchbarWithFilter({
    super.key,
    required this.onSearch,
  });

  final Function(String) onSearch;
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.background2,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: TextField(
              controller: searchController,
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
              onSubmitted: (value) {
                value = searchController.text;
                if (value.isNotEmpty) {
                  onSearch(value);
                }
              },
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
