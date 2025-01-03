import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/movie/cubit/movie_cubit.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_paddings.dart';
import '../../../../utils/constants/app_sizedboxes.dart';
import '../../../../utils/constants/app_txt_styles.dart';
import '../../../../utils/extensions/locale_extension.dart';

class SearchbarWithFilter extends StatelessWidget {
  const SearchbarWithFilter({
    super.key,
    required this.onSearch,
  });

  final Function(String) onSearch;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MovieCubit>(); 
    return Row(
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.background2,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: TextField(
              controller: cubit.controller,
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
                hintText: context.l10n.searchMovie,
                hintStyle: AppTxtStyles.montserratRegularWhite16,
                border: InputBorder.none,
              ),
              onSubmitted: (value) {
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
