import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movix/core/routes/generator.dart';
import 'package:movix/cubits/movie/cubit/movie_cubit.dart';
import 'package:movix/presentation/screens/detail/detail_screen.dart';
import 'package:movix/utils/constants/app_sizedboxes.dart';

import 'movie_box.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.h,
      child: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is MovieSuccess) {
            return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  return MovieBox(
                    movie: movie,
                    onTap: () => Navigate.to(context, DetailScreen(movie: movie)),
                  );
                },
                separatorBuilder: (_, i) => AppSizedboxes.w16,
                itemCount: state.movies.length);
          } else if (state is MovieError) {
            return Center(
                child: Text('Failedd to load movies: ${state.message}'));
          } else if (state is MovieNetworkError) {
            return Center(child: Text('Failedd to Network: ${state.message}'));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
