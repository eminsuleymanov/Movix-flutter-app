import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/models/movie.dart';
import '../../../data/services/movie_service.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  final MovieService _movieService = MovieService();
  final _moviesSubject = BehaviorSubject<List<MovieResponse>>();
  final TextEditingController controller = TextEditingController();
  Stream<List<MovieResponse>> get moviesStream => _moviesSubject.stream;

  void getMovies() async {
    emit(MovieLoading());
    try {
      final movies = await _movieService.getMovies();
      _moviesSubject.add(movies);

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
  void resetInput(){
    controller.clear();
  }
  @override
  Future<void> close() {
    _moviesSubject.close();
    controller.dispose();
    return super.close();
  }
}
