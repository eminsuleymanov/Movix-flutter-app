import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController resetPasswordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

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

      final authBox = Hive.box('auth');
      authBox.put('isLoggedIn', true);

      emit(LoginSuccess(
          user: userCredential.user,
          message: "${email.text} has successfully logged in"));
      resetControllers();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        emit(LoginError('An Invalid email format'));
        log('Firebase Authentication Exception: ${e.code}');
      } else if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        emit(LoginError('Email or password is incorrect'));
        log('Firebase Authentication Exception: ${e.code}');
      }
    } catch (e) {
      emit(LoginError('Something went wrong. Please try again.'));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());

    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        emit(LoginError('Google sign in canceled'));
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      final user = userCredential.user;
      if (user == null) {
        emit(LoginError("Google sign in failed: no user returned"));
        return;
      }

      final docRef =
          FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        await docRef.set({
          'uid': user.uid,
          'displayName': user.displayName ?? '',
          'email': user.email ?? '',
          'photoUrl': user.photoURL ?? '',
          'createdAt': FieldValue.serverTimestamp(),
        });
      } else {
        await docRef.set({
          'displayName': user.displayName ?? '',
          'photoUrl': user.photoURL ?? '',
        }, SetOptions(merge: true));
      }

  
      final authBox = Hive.box('auth');
      authBox.put('isLoggedIn', true);

      emit(LoginSuccess(
        user: user,
        message: "Signed in with Google as ${user.email}",
      ));
    } on FirebaseAuthException catch (e) {
      emit(LoginError("Google sign in error: ${e.message}"));
    } catch (e) {
      emit(LoginError("Something went wrong: $e"));
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
      } else if (e.code == 'invalid-email') {
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
