import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/category.dart';
import '../../../data/services/category_service.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  final CategoryService _categoryService = CategoryService();
  void getCategories() async {
    try {
      emit(CategoryLoading());
      final categories = await _categoryService.getCategories();
      if (categories.isNotEmpty) {
        categories.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
       
        emit(CategorySuccess(categories));
      } else {
        emit(CategoryError("No categories found"));
      }
    } on SocketException catch (_) {
      emit(CategoryNetworkError());
    } catch (e) {
      emit(CategoryError("Failed to load categories: $e"));
    }
  }

  void selectCategory(String id) {
    if (state is CategorySuccess) {
      final successState = state as CategorySuccess;
      emit(CategorySuccess(successState.categories, selectedIndex: id));
    }
  }
}
