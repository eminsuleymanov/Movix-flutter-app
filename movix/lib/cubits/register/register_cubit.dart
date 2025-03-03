import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RegisterCubit() : super(RegisterInitial());

  Future<void> register() async {
    emit(RegisterLoading());

    final fields = <String, TextEditingController>{
      'Full Name': fullnameController,
      'Email': emailController,
      'Password': passwordController,
      'Confirm Password': confirmPasswordController,
    };

    for (final entry in fields.entries) {
      final label = entry.key;
      final controller = entry.value;

      if (controller.text.trim().isEmpty) {
        emit(RegisterError("fill in this field $label."));
        return;
      }
    }

    if (passwordController.text != confirmPasswordController.text) {
      emit(RegisterError("Passwords do not match."));
      return;
    }

    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      await userCredential.user
          ?.updateDisplayName(fullnameController.text.trim());

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'uid': userCredential.user!.uid,
        'displayName': fullnameController.text.trim(),
        'email': emailController.text.trim(),
        'photoUrl': '',
        'createdAt': FieldValue.serverTimestamp(),
      });

      emit(RegisterSuccess(
          "Registration successful! Welcome, ${fullnameController.text}."));

      resetControllers();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(RegisterError(
            "This email is already in use. Please try another one."));
      } else if (e.code == 'invalid-email') {
        emit(RegisterError("The email address is not valid."));
      } else if (e.code == 'weak-password') {
        emit(RegisterError(
            "The password provided is too weak. Please use a stronger password."));
      } else {
        emit(RegisterError(e.message ?? "An unknown error occurred."));
      }
    } catch (e) {
      emit(RegisterError(
          "An unexpected error occurred. Please try again later."));
    }
  }

  void resetControllers() {
    fullnameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  Future<void> close() {
    fullnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
