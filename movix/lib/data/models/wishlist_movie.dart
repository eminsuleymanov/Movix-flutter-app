import 'package:hive/hive.dart';
import 'movie.dart';

part 'wishlist_movie.g.dart';

@HiveType(typeId: 0) 
class WishlistMovie extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String country;

  @HiveField(3)
  final List<String> genres;  // Change this to List<String>

  @HiveField(4)
  final String rated;

  WishlistMovie({
    required this.id,
    required this.title,
    required this.country,
    required this.genres,
    required this.rated,
  });

  factory WishlistMovie.fromMovieResponse(MovieResponse movie) {
    return WishlistMovie(
      id: movie.id,
      title: movie.title,
      country: movie.country,
      genres: movie.genres.map((genre) => genre.name).toList(),  // Keep this as List<String>
      rated: movie.rated,  
    );
  }
}
