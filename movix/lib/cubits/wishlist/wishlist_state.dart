part of 'wishlist_cubit.dart';

abstract class WishlistState {}
class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistSuccess extends WishlistState {
  final List<WishlistMovie> wishlist;
  final String message;

  WishlistSuccess({required this.wishlist, this.message = ''});
}

class WishlistError extends WishlistState {
  final String message;

  WishlistError(this.message);
}
