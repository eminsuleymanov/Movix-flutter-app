import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/routes/generator.dart';
import '../../../cubits/movie/cubit/movie_cubit.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_sizedboxes.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/constants/app_txt_styles.dart';
import '../../../utils/constants/assets_paths.dart';
import '../../widgets/global_section_headlines.dart';
import '../search/search_screen.dart';
import '../search/widgets/searchbar_with_filter.dart';
import 'widgets/bannerSlider/banner_slider.dart';
import 'widgets/category_list.dart';
import 'widgets/movie_list.dart';

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
                  width: 50.h,
                  height: 50.h,
                ),
              ),
            ),
          ]),
      body: Padding(
        padding: AppPaddings.all16,
        child: ListView(children: [
          SearchbarWithFilter(onSearch: (query) {
            final movieCubit = context.read<MovieCubit>();
            movieCubit.searchMovies(query);
            Navigate.to(context, const SearchScreen()).then((_) {
              movieCubit.resetInput();
              movieCubit.getMovies();
            });
          }),
          AppSizedboxes.h20,
          const CategoryList(),
          AppSizedboxes.h25,
          GlobalSectionHeadlines(
            heading: AppStrings.nowPlaying,
            onPressed: () {},
          ),
          AppSizedboxes.h20,
          const BannerSlider(isTrending: true),
          AppSizedboxes.h25,
          GlobalSectionHeadlines(
            heading: AppStrings.trending,
            onPressed: () {},
          ),
          AppSizedboxes.h20,
          const MovieList(
            isTrending: true,
          ),
          AppSizedboxes.h25,
          GlobalSectionHeadlines(
            heading: AppStrings.mostViewed,
            onPressed: () {},
          ),
          AppSizedboxes.h20,
          const MovieList(
            isTrending: false,
          ),
          AppSizedboxes.h25
        ]),
      ),
    );
  }
}
