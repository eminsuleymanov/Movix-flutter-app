import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController resetPassword = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signin() async {
    if (email.text.isEmpty || password.text.isEmpty) {
      emit(LoginError('Please fill in all fields.'));
      return;
    }
    emit(LoginLoading());
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      emit(LoginSuccess(userCredential.user));
    } on FirebaseAuthException catch (e) {
      emit(LoginError(e.message ?? 'An unknown error occurred.'));
    } catch (e) {
      emit(LoginError('Something went wrong. Please try again.'));
    }
  }

  Future<void> reset() async {
    if (resetPassword.text.isEmpty) {
      emit(LoginError('Please fill in all fields.'));
      return;
    }

    try {
      final signInMethods = await FirebaseAuth.instance
          .fetchSignInMethodsForEmail(resetPassword.text.trim());

      if (signInMethods.isEmpty) {
        emit(LoginError(
            'This email is not authorized. Please check the email address.'));
      } else {
        await _firebaseAuth.sendPasswordResetEmail(email: resetPassword.text);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        emit(LoginError(
            'The email address is invalid. Please enter a valid email.'));
      } else {
        emit(LoginError('An error occurred: ${e.message}'));
      }
    } catch (e) {
      emit(LoginError('An unexpected error occurred. Please try again.'));
    }
  }
}
