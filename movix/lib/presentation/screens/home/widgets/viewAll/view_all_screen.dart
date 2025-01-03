import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/movie/cubit/movie_cubit.dart';
import '../../../../../utils/constants/app_paddings.dart';
import '../../../../../utils/constants/app_sizedboxes.dart';
import '../../../../../utils/constants/app_txt_styles.dart';
import '../../../../../utils/extensions/locale_extension.dart';
import '../../../../widgets/custom_basic_appbar.dart';
import '../../../../widgets/movie_list_tile.dart';

class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBasicAppbar(text: context.l10n.allMovies),
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
