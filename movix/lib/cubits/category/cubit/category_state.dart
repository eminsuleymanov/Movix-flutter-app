part of 'category_cubit.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryResponse> categories;
  final String selectedIndex;

  CategorySuccess(this.categories,
      {this.selectedIndex = '669d5d204364d09c32350a92'});
}

class CategoryError extends CategoryState {
  final String message;

  CategoryError(this.message);
}

class CategoryNetworkError extends CategoryState {}
