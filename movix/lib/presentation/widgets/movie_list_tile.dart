import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movix/cubits/wishlist/wishlist_cubit.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_paddings.dart';
import '../../utils/constants/app_sizedboxes.dart';
import '../../utils/constants/app_txt_styles.dart';
import '../../utils/interfaces/movie_interface.dart';

class MovieListTile extends StatelessWidget {
  const MovieListTile({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final wishlistCubit = context.read<WishlistCubit>();
    final isInWishlist = wishlistCubit.isInWishlist(movie.id);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: ColoredBox(
        color: AppColors.background2,
        child: Padding(
          padding: AppPaddings.v12,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120.w,
                height: 140.h,
                child: Image.network(
                  movie.poster,
                  fit: BoxFit.contain,
                ),
              ),
              AppSizedboxes.w16,
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: AppTxtStyles.montserratRegularWhite16,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          AppSizedboxes.h6,
                          Text(
                            movie.country,
                            style: AppTxtStyles.montserratRegularGray,
                          ),
                          AppSizedboxes.h6,
                          Text(
                            movie.genres.join(', '),
                            style: AppTxtStyles.montserratRegularBlue,
                          ),
                          AppSizedboxes.h6,
                          Text(
                            movie.rated,
                            style: AppTxtStyles.montRegWhite14,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        wishlistCubit.toggleWishlist(movie );
                      },
                      color: AppColors.yellow,
                      icon: Icon(
                        isInWishlist
                    ? FontAwesomeIcons.solidHeart
                    : FontAwesomeIcons.heart,
                        size: 20, 
                      ),
                      visualDensity: VisualDensity.compact,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
