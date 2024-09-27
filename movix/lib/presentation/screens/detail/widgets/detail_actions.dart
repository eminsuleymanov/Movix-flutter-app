import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../cubits/wishlist/wishlist_cubit.dart';
import '../../../../data/models/movie.dart';
import '../../../../utils/constants/app_sizedboxes.dart';
import '../../../../utils/constants/app_strings.dart';
import 'detail_action_btn.dart';
import 'movie_trailer_dialog.dart';

class DetailActions extends StatelessWidget {
  const DetailActions({
    super.key,
    required this.trailerUrl,
    required this.movie,
  });

  final String trailerUrl;
  final MovieResponse movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DetailActionBtn(
          icon: Icons.local_movies_rounded,
          text: AppStrings.trailer,
          onTap: () {
            if (trailerUrl.isEmpty) {
              const snackBar = SnackBar(
                content: Text('Movie trailer not available'),
                backgroundColor: Colors.orange,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              showDialog(
                context: context,
                builder: (context) => MovieTrailerDialog(trailerUrl: trailerUrl),
              );
            }
          },
        ),
        AppSizedboxes.w20,
        BlocListener<WishlistCubit, WishlistState>(
          listener: (context, state) {
            if (state is WishlistSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: state.message.contains('removed')
                      ? Colors.red
                      : Colors.green,
                ),
              );
            }
          },
          child: BlocBuilder<WishlistCubit, WishlistState>(
            builder: (context, state) {
              final wishlistCubit = context.read<WishlistCubit>();
              final isInWishlist = wishlistCubit.isInWishlist(movie.id);

              return DetailActionBtn(
                icon: isInWishlist
                    ? FontAwesomeIcons.solidHeart
                    : FontAwesomeIcons.heart,
                text: isInWishlist ? 'Remove' : AppStrings.wishlist,
                onTap: () {
                  log("clicked wishlist");
                  wishlistCubit.toggleWishlist(movie);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
