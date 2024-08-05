import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/movie/cubit/movie_cubit.dart';
import '../movie_box.dart';

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
                return MovieBox(
                  movie: movie,
                  width: 300,
                  isSliderItem: true,
                ); 
              },
              options: CarouselOptions(
                height: 250,
                enlargeCenterPage: true,
                autoPlay: false,
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
