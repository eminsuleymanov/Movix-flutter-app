import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/routes/generator.dart';
import '../../../cubits/movie/cubit/movie_cubit.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_sizedboxes.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/constants/app_txt_styles.dart';
import '../../widgets/movie_list_tile.dart';
import '../home/home_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
    required this.query,
  });

  final String query;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.searchResults),
        backgroundColor: AppColors.backgroundPrimary,
        foregroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigate.back(context, const HomeScreen());
            log('Back to home screen triggered');
            context.read<MovieCubit>().resetInput();
          },
        ),
      ),
      body: Padding(
        padding: AppPaddings.all16,
        child: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieSuccess) {
              return ListView.separated(
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  final movies = state.movies;
                  return MovieListTile(movie: movies[index]);
                },
                separatorBuilder: (ctx, i) => AppSizedboxes.h16,
              );
            } else if (state is MovieError) {
              return Center(
                  child: Text(
                'No movies found ',
                style: AppTxtStyles.monts20white500,
              ));
            } else {
              return Center(
                  child: Text(
                'Unexpected error',
                style: AppTxtStyles.monts20white500,
              ));
            }
          },
        ),
      ),
    );
  }
}
