import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/generator.dart';
import '../../../cubits/movie/cubit/movie_cubit.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_sizedboxes.dart';
import '../../../utils/constants/app_txt_styles.dart';
import '../../../utils/extensions/locale_extension.dart';
import '../../widgets/global_profile_avatar.dart';
import '../../widgets/global_section_headlines.dart';
import '../search/search_screen.dart';
import '../search/widgets/searchbar_with_filter.dart';
import 'widgets/bannerSlider/banner_slider.dart';
import 'widgets/category_list.dart';
import 'widgets/movie_list.dart';
import 'widgets/viewAll/view_all_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            context.l10n.findYourBest,
            style: AppTxtStyles.montserrat500white,
          ),
          backgroundColor: AppColors.backgroundPrimary,
          centerTitle: false,
          toolbarHeight: 80.h,
          automaticallyImplyLeading: false,
          actions: const [
            Padding(
              padding: AppPaddings.r16,
              child: GlobalProfileAvatar(inEditScreen: false, radius: 25,)
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
            heading: context.l10n.nowPlaying,
            onPressed: () => Navigate.to(context, const ViewAllScreen()),
          ),
          AppSizedboxes.h20,
          const BannerSlider(isTrending: true),
          AppSizedboxes.h25,
          GlobalSectionHeadlines(
            heading: context.l10n.trending,
            onPressed: () => Navigate.to(context, const ViewAllScreen()),
          ),
          AppSizedboxes.h20,
          const MovieList(
            isTrending: true,
          ),
          AppSizedboxes.h25,
          GlobalSectionHeadlines(
            heading: context.l10n.mostViewed,
            onPressed: () => Navigate.to(context, const ViewAllScreen()),
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
