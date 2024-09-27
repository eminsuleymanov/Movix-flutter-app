import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movix/data/models/movie.dart';

import '../../../cubits/wishlist/wishlist_cubit.dart';
import '../../../data/models/wishlist_movie.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/constants/app_txt_styles.dart';
import '../../widgets/movie_list_tile.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistCubit = context.read<WishlistCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.wishlist,
          style: AppTxtStyles.monts20white500,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: wishlistCubit.wishlistBox.listenable(),
        builder: (context, Box<WishlistMovie> box, _) {
          final wishlistMovies = box.values.toList();

          if (wishlistMovies.isEmpty) {
            return const Center(child: Text('Your wishlist is empty.'));
          }
          return ListView.builder(
            itemCount: wishlistMovies.length,
            itemBuilder: (context, index) {
              final movie = wishlistMovies[index];
              return MovieListTile(movie: movie as MovieResponse);
            },
          );
        },
      ),
    );
  }
}
