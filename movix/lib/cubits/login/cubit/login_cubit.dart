import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController resetPasswordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  Future<void> signIn() async {
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
      emit(LoginSuccess(
          user: userCredential.user,
          message: "${email.text} has successfully logged in"));
          resetControllers();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        emit(LoginError('An Invalid email format'));
        log('Firebase Authentication Exception: ${e.code}/////////////');
      } else if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        emit(LoginError('Email or password is incorrect'));
        log('Firebase Authentication Exception: ${e.code}/////////////');
      }
    } catch (e) {
      emit(LoginError('Something went wrong. Please try again.'));
    }
  }

  Future<void> resetPassword() async {
    final email = resetPasswordController.text.trim();

    if (email.isEmpty) {
      emit(ResetPasswordError('Please enter an email.'));
      return;
    }

    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      emit(ResetPasswordSuccess('Password reset email sent successfully.'));
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(ResetPasswordError('No account found with this email.'));
      } else if(e.code == 'invalid-email'){
        emit(ResetPasswordError('Failed to send reset email: ${e.message}'));
      }
    } catch (e) {
      emit(ResetPasswordError('An unexpected error occurred.'));
    }
  }



  

  void resetControllers() {
    email.clear();
    password.clear();
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    resetPasswordController.dispose();
    return super.close();
  }
}

