part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final User? user; 
  final String? message;
  LoginSuccess({this.user, this.message});
}

final class LoginError extends LoginState {
  final String error;
  LoginError(this.error);
}


final class ResetPasswordError extends LoginState {
  final String error;
  ResetPasswordError(this.error);
}
final class ResetPasswordSuccess extends LoginState {
  final String message;
  ResetPasswordSuccess(this.message);
}


// final class LogOut extends LoginState{
//   final String message;

//   LogOut(this.message);
// }
// final class LogOutError extends LoginState{
//   final String message;

//   LogOutError(this.message);
// }