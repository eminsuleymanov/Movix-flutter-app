import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movix/cubits/category/cubit/category_cubit.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/constants/app_txt_styles.dart';
import '../../../utils/constants/assets_paths.dart';
import '../../widgets/global_section_headlines.dart';
import 'widgets/bannerSlider/banner_slider.dart';
import 'widgets/category_list.dart';
import 'widgets/searchbar_with_filter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            AppStrings.findYourBest,
            style: AppTxtStyles.montserrat500white,
          ),
          backgroundColor: AppColors.backgroundPrimary,
          centerTitle: false,
          toolbarHeight: 80.h,
          actions: [
            Padding(
              padding: AppPaddings.r16,
              child: CircleAvatar(
                radius: 25.r,
                child: SvgPicture.asset(
                  AssetsPaths.avatar,
                  width: 50.w,
                  height: 50.h,
                ),
              ),
            ),
          ]),
      body: Padding(
        padding: AppPaddings.all16,
        child: Column(
          children: [
            const SearchbarWithFilter(),
            20.verticalSpace,
            BlocProvider(
              create: (_) => CategoryCubit()..getCategories(),
              child: const CategoryList(),
            ),
            25.verticalSpace,
            GlobalSectionHeadlines(
              heading: AppStrings.nowPlaying,
              onPressed: () {},
            ),
            BannerSlider(),
          ],
        ),
      ),
    );
  }
}
