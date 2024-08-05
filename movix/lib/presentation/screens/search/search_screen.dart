import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movix/utils/constants/app_strings.dart';

import '../../../cubits/movie/cubit/movie_cubit.dart';
import '../../../utils/constants/app_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
    required this.query,
  });

  final String query;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.searchResults),
        backgroundColor: AppColors.backgroundPrimary,
        foregroundColor: AppColors.white,
      ),
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieSuccess) {
            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movies = state.movies;
                return ListTile(title: Text(movies[index].title));
              },
            );
          } else if (state is MovieError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No movies found.'));
          }
        },
      ),
    );
  }
}
