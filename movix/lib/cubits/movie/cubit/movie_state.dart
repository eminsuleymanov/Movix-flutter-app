part of 'movie_cubit.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieSuccess extends MovieState {
  final List<MovieResponse> movies;
  MovieSuccess(this.movies);
}

class MovieError extends MovieState {
  final String message;
  MovieError(this.message);
}

class MovieNetworkError extends MovieState {
  final String message;
  MovieNetworkError(this.message);
}
