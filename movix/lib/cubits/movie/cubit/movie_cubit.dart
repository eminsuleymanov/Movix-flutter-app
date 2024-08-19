import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/movie.dart';
import '../../../data/services/movie_service.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  final MovieService _movieService = MovieService();
  final TextEditingController controller = TextEditingController();


  Future<List<MovieResponse>> getMovies() async {
  emit(MovieLoading());
  try {
    final movies = await _movieService.getMovies();
    emit(MovieSuccess(movies));
    return movies; 
  } on SocketException catch (e) {
    emit(MovieNetworkError(e.toString()));
    rethrow; 
  } catch (e) {
    emit(MovieError(e.toString()));
    rethrow; 
  }
}
Future<List<MovieResponse>> getTrendingMovies() async {
  emit(MovieLoading());
  try {
    final movies = await _movieService.getTrendingMovies();
    emit(MovieSuccess(movies));
    return movies; 
  } on SocketException catch (e) {
    emit(MovieNetworkError(e.toString()));
    rethrow; 
  } catch (e) {
    emit(MovieError(e.toString()));
    rethrow; 
  }
}


  Future<void> filterMoviesByGenre(String id) async {
    try {
      emit(MovieLoading());
      final movies = await _movieService.getMoviesByGenre(id);
      emit(MovieSuccess(movies));
    } on SocketException catch (e) {
      emit(MovieNetworkError(e.toString()));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> searchMovies(String query) async {
    try {
      emit(MovieLoading());
      final movies = await _movieService.getMovies(query: query);
      emit(MovieSuccess(movies));
      resetInput();
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  void resetInput() {
    controller.clear();
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
