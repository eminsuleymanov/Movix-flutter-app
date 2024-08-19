part of 'category_cubit.dart';
 
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class CategoryLoading extends CategoryState {}
final class CategorySuccess extends CategoryState {
   final List<CategoryResponse> categories;
   final String selectedIndex;

  CategorySuccess(this.categories, {this.selectedIndex = '669d5d204364d09c32350a92'});

}
final class CategoryError extends CategoryState {
   final String message;

  CategoryError(this.message);
}
final class CategoryNetworkError extends CategoryState {}
