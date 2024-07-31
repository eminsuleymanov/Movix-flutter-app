import 'dart:developer';

import 'package:dio/dio.dart';

import '../../utils/constants/endpoints.dart';
import '../../utils/extensions/int_extension.dart';
import '../models/movie.dart';

class MovieService {
  final Dio _dio = Dio();

  Future<List<MovieResponse>> getMovies() async {
    const moviesEndpoint = Endpoints.movies;
    try {
      final response = await _dio.get(moviesEndpoint);
      if (response.statusCode.isSuccess) {
        List<MovieResponse> movies = (response.data['data'] as List)
            .map((movieJson) => MovieResponse.fromJson(movieJson))
            .toList();
        return movies;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      log("$e");
      throw Exception('Failed to load movies');
    }
  }

  Future<List<MovieResponse>> getMoviesByGenre(String genreId) async {
    const endpoint = Endpoints.movieByGenre;
    try {
      final response = await _dio.get('$endpoint/$genreId');

      if (response.statusCode == 200) {
        List<MovieResponse> movies = (response.data['data'] as List)
            .map((movieJson) => MovieResponse.fromJson(movieJson))
            .toList();
        return movies;
      } else {
        throw Exception('Failed to load movies by genre');
      }
    } catch (e) {
      log("$e");
      throw Exception('Failed to load movies by genre');
    }
  }
}
