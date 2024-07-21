// import 'package:dio/dio.dart';
// import 'movie.dart'; // Import your movie model

// class MovieService {
//   final Dio _dio = Dio();
//   final String _baseUrl = 'http://your-backend-url'; // Replace with your backend URL

//   Future<List<Movie>> getMoviesByGenre(String genreId) async {
//     try {
//       final response = await _dio.get('$_baseUrl/api/movies/genre/$genreId');

//       if (response.statusCode == 200) {
//         List<Movie> movies = (response.data['data'] as List)
//             .map((movieJson) => Movie.fromJson(movieJson))
//             .toList();
//         return movies;
//       } else {
//         throw Exception('Failed to load movies');
//       }
//     } catch (e) {
//       print(e);
//       throw Exception('Failed to load movies');
//     }
//   }
// }
