import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routes/generator.dart';
import '../../../../../cubits/movie/cubit/movie_cubit.dart';
import '../../../../../data/models/movie.dart';
import '../../../detail/detail_screen.dart';
import '../movie_box.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key, required this.isTrending});
  final bool isTrending;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MovieCubit>();

    return FutureBuilder<List<MovieResponse>>(
      future: isTrending ? cubit.getTrendingMovies() : cubit.getMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (snapshot.hasData) {
          final movies = snapshot.data!;
          return CarouselSlider.builder(
            itemCount: movies.length,
            itemBuilder: (context, index, realIndex) {
              final movie = movies[index];
              return MovieBox(
                movie: movie,
                width: 300,
                isSliderItem: true,
                onTap: () => Navigate.to(context, DetailScreen(movie: movie)),
              );
            },
            options: CarouselOptions(
              height: 250,
              enlargeCenterPage: true,
              autoPlay: false,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
              child: Text('Failed to load movies: ${snapshot.error}'));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
