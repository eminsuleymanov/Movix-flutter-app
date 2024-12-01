part of 'user_cubit.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
  final User? user;
  final String? message;
  UserSuccess({this.user, this.message});
}

final class UserError extends UserState {
  final String error;

  UserError({required this.error});
}

final class LogOut extends UserState{
  final String message;

  LogOut(this.message);
}
final class LogOutError extends UserState{
  final String message;

  LogOutError(this.message);
}
