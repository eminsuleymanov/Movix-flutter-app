import 'dart:developer';

import 'package:dio/dio.dart';

import '../../utils/constants/endpoints.dart';
import '../../utils/extensions/int_extension.dart';
import '../models/movie.dart';

class MovieService {
  final Dio _dio = Dio();

  Future<List<MovieResponse>> getMovies({String? query}) async {
    const moviesEndpoint = Endpoints.movies;
    try {
      final response = await _dio.get(moviesEndpoint,
          queryParameters: query != null ? {'title': query} : null);
      if (response.statusCode.isSuccess) {
        List<MovieResponse> movies = (response.data['data'] as List)
            .map((movieJson) => MovieResponse.fromJson(movieJson))
            .toList();
        return movies;
      } else {
        throw Exception(
            'Failed to load movies: status code is ${response.statusCode}');
      }
    } catch (e) {
      log("Service Error: $e");
      throw Exception('Failed to load movies');
    }
  }

  Future<List<MovieResponse>> getMoviesByGenre(String genreId) async {
    const endpoint = Endpoints.movieByGenre;
    try {
      final response = await _dio.get('$endpoint/$genreId');

      if (response.statusCode.isSuccess) {
        List<MovieResponse> movies = (response.data['data'] as List)
            .map((movieJson) => MovieResponse.fromJson(movieJson))
            .toList();
        return movies;
      } else if (response.statusCode == 404) {
        log('No movies found for genre ID: $genreId');
        throw Exception('No movies found for the selected genre.');
      } else {
        throw Exception(
            'Failed to load movies by genre. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log("Service genre error: $e");
      throw Exception('Error occurred while fetching movies by genre.');
    }
  }

  Future<List<MovieResponse>> getTrendingMovies() async {
    const endpoint = Endpoints.trendingMovies;
    try {
      final response = await _dio.get(endpoint);

      if (response.statusCode == 200) {
        List<MovieResponse> movies = (response.data['data'] as List)
            .map((movieJson) => MovieResponse.fromJson(movieJson))
            .toList();
        return movies;
      } else {
        throw Exception('Failed to load trending movies');
      }
    } catch (e) {
      log("Service trending error: $e");
      throw Exception('error fetching trending movies');
    }
  }
}
