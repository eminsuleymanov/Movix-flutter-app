part of 'category_cubit.dart';
 
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class CategoryLoading extends CategoryState {}
final class CategorySuccess extends CategoryState {
   final List<CategoryResponse> categories;
   final int selectedIndex;

  CategorySuccess(this.categories, {this.selectedIndex = 0});

}
final class CategoryError extends CategoryState {
   final String message;

  CategoryError(this.message);
}
final class CategoryNetworkError extends CategoryState {}
