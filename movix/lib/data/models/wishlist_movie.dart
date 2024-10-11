import 'package:hive/hive.dart';

import '../../utils/interfaces/movie_interface.dart';

part 'wishlist_movie.g.dart';

@HiveType(typeId: 0)
class WishlistMovie extends HiveObject implements Movie {
  @override
  @HiveField(0)
  final String id;

  @override
  @HiveField(1)
  final String title;

  @override
  @HiveField(2)
  final String country;

  @override
  @HiveField(3)
  final List<String> genres;

  @override
  @HiveField(4)
  final String rated;

  @override
  @HiveField(5)
  final String poster;

  WishlistMovie({
    required this.id,
    required this.title,
    required this.country,
    required this.genres,
    required this.rated,
    required this.poster,
  });

  factory WishlistMovie.fromMovieResponse(Movie movie) {
    return WishlistMovie(
      id: movie.id,
      title: movie.title,
      country: movie.country,
      genres: movie.genres,
      rated: movie.rated,
      poster: movie.poster,
    );
  }
}
