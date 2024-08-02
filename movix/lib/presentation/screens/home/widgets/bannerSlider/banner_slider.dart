import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/movie/cubit/movie_cubit.dart';
import 'movie_slider_item.dart';


class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (state is MovieSuccess) {
          return CarouselSlider.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index, realIndex) {
                final movie = state.movies[index];
                return MovieSliderItem(
                  movie: movie,
                );
              },
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                enlargeFactor: .35
              ));
        } else if (state is MovieError) {
          return Center(
              child: Text('Failedd to load movies: ${state.message}'));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
