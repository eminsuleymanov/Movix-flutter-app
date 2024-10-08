import 'package:flutter/material.dart';

import '../../../data/models/movie.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_sizedboxes.dart';
import '../../../utils/constants/app_txt_styles.dart';
import '../../widgets/custom_blur_effect.dart';
import 'widgets/actor_list.dart';
import 'widgets/detail_actions.dart';
import 'widgets/movie_info_summary.dart';
import 'widgets/movie_info_text.dart';
import 'widgets/movie_ratings.dart';
import 'widgets/rated_box.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.movie});

  final MovieResponse movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
              pinned: true,
              iconTheme: const IconThemeData(color: AppColors.white),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Image.network(
                      movie.poster,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    const CustomBlurEffect(),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: AppPaddings.all16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: AppTxtStyles.montserrat500white,
                    ),
                    AppSizedboxes.h20,
                    Row(
                      children: [
                        RatedBox(rated: movie.rated),
                        AppSizedboxes.w8,
                        MovieInfoText(
                          year: movie.year,
                          genres: movie.genres,
                          runtime: movie.runtime,
                        ),
                      ],
                    ),
                    AppSizedboxes.h6,
                    MovieRatings(ratings: movie.ratings),
                    AppSizedboxes.h6,
                    MovieInfoSummary(
                      movie: movie,
                    ),
                    AppSizedboxes.h20,
                    ActorList(actors: movie.actors),
                    AppSizedboxes.h20,
                    DetailActions(trailerUrl: movie.videoUrl,movie: movie,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
