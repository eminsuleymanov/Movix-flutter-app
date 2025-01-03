part of 'user_cubit.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
   final UserModel userModel;
  final String message;

  UserSuccess({required this.userModel, required this.message});
}

final class UserError extends UserState {
  final String error;

  UserError({required this.error});
}

final class UserImageLoading extends UserState {}

final class UserImagePickedSuccess extends UserState {}

final class UserImageUploaded extends UserState {
  final String message;

  UserImageUploaded({required this.message});
}

final class UserImageUploadedError extends UserState {
  final String error;

  UserImageUploadedError({required this.error});
}

final class LogOut extends UserState {
  final String message;

  LogOut(this.message);
}

final class LogOutError extends UserState {
  final String message;

  LogOutError(this.message);
}
