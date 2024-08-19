import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/generator.dart';
import '../../../../cubits/movie/cubit/movie_cubit.dart';
import '../../detail/detail_screen.dart';
import '../../../../utils/constants/app_sizedboxes.dart';

import '../../../../data/models/movie.dart';
import 'movie_box.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key, this.isTrending = false});
  final bool isTrending;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MovieCubit>();

    return SizedBox(
        height: 210.h,
        child: FutureBuilder<List<MovieResponse>>(
          future: isTrending ? cubit.getTrendingMovies() : cubit.getMovies(),
          builder: (context, snapshot) {
            // Check the connection state
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            // Handle the case where the Future has data
            else if (snapshot.hasData) {
              final movies = snapshot.data!;
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return MovieBox(
                    movie: movie,
                    onTap: () =>
                        Navigate.to(context, DetailScreen(movie: movie)),
                  );
                },
                separatorBuilder: (_, i) => AppSizedboxes.w16,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Failed to load movies: ${snapshot.error}'),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ));
  }
}
