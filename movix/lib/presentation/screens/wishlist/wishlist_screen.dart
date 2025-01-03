import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../cubits/wishlist/wishlist_cubit.dart';
import '../../../data/models/wishlist_movie.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_sizedboxes.dart';
import '../../../utils/constants/app_txt_styles.dart';
import '../../../utils/extensions/locale_extension.dart';
import '../../widgets/movie_list_tile.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistCubit = context.read<WishlistCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPrimary,
        automaticallyImplyLeading: false,
        title: Text(
          context.l10n.wishlist,
          style: AppTxtStyles.monts20white500,
        ),
      ),
      body: Padding(
        padding: AppPaddings.all10,
        child: ValueListenableBuilder(
          valueListenable: wishlistCubit.wishlistBox.listenable(),
          builder: (context, Box<WishlistMovie> box, _) {
            final wishlistMovies = box.values.toList();
        
            if (wishlistMovies.isEmpty) {
              return Center(child: Text('Your wishlist is empty.',style: AppTxtStyles.monts20white500,));
            }
            return ListView.separated(
              itemCount: wishlistMovies.length,
              separatorBuilder: (_, i) => AppSizedboxes.h6,
              itemBuilder: (context, index) {
                final movie = wishlistMovies[index];
                return MovieListTile(movie: movie );
              },
            );
          },
        ),
      ),
    );
  }
}
