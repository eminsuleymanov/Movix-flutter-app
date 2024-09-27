import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../data/models/movie.dart';
import '../../../utils/constants/app_strings.dart';
import '../../data/models/wishlist_movie.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  final Box<WishlistMovie> wishlistBox =
      Hive.box<WishlistMovie>(AppStrings.wishlist);

  bool isInWishlist(String movieId) {
    return wishlistBox.containsKey(movieId);
  }

  void toggleWishlist(MovieResponse movie) {
    try {
      emit(WishlistLoading());

      final wishlistMovie = WishlistMovie.fromMovieResponse(movie);
      log('Toggling wishlist for: ${wishlistMovie.title}');

      if (isInWishlist(wishlistMovie.id)) {
        wishlistBox.delete(wishlistMovie.id);
        emit(WishlistSuccess(
          wishlist: getWishlistMovies(),
          message: '${wishlistMovie.title} removed from wishlist',
        ));
      } else {
        wishlistBox.put(wishlistMovie.id, wishlistMovie);
        emit(WishlistSuccess(
          wishlist: getWishlistMovies(),
          message: '${wishlistMovie.title} added to wishlist',
        ));
      }
    } catch (e) {
      emit(WishlistError('Failed to update wishlist: $e'));
    }
  }

  List<WishlistMovie> getWishlistMovies() {
    return wishlistBox.values.toList();
  }
}
