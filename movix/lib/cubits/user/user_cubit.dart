import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final TextEditingController editNameController = TextEditingController();
  final TextEditingController editEmailController = TextEditingController();
  final TextEditingController editPasswordController = TextEditingController();
  final TextEditingController editConPasswordController =
      TextEditingController();

  Future<void> fetchUserData() async {
    emit(UserLoading());
    try {
      final user = _firebaseAuth.currentUser;

      if (user != null) {
        emit(UserSuccess(user: user));
      } else {
        emit(UserError(error: 'No user found'));
      }
    } catch (e) {
      emit(UserError(error: "Failed to fetch user data."));
    }
  }

  Future<void> signOut() async {
    emit(UserLoading());
    try {
      await _firebaseAuth.signOut();
      final authBox = Hive.box('auth');
      authBox.put('isLoggedIn', false);

      emit(LogOut("Logged out successfully"));
    } catch (e) {
      emit(LogOutError(e.toString()));
    }
  }

  Future<void> editUserProfile() async {
    try {
      emit(UserLoading());

      final user = _firebaseAuth.currentUser;

      if (user == null) {
        emit(UserError(error: "User not found."));
        return;
      }

      final displayName = editNameController.text.trim();
      final email = editEmailController.text.trim();
      final password = editPasswordController.text.trim();
      final confirmPassword = editConPasswordController.text.trim();

      if (displayName.isNotEmpty && displayName != user.displayName) {
        await user.updateDisplayName(displayName);
      }

      if (email.isNotEmpty && email != user.email) {
        await user.verifyBeforeUpdateEmail(email);
      }

      if (password.isNotEmpty) {
        if (password != confirmPassword) {
          emit(UserError(error: "Passwords do not match."));
          return;
        }
        await user.updatePassword(password);
      }

      await user.reload();
      emit(UserSuccess(
          user: _firebaseAuth.currentUser!,
          message: "Profile updated successfully."));
    } catch (e) {
      emit(UserError(error: "Failed to update profile: ${e.toString()}"));
    }
  }

  void resetControllers() {
    editNameController.clear();
    editEmailController.clear();
    editPasswordController.clear();
    editConPasswordController.clear();
  }

  @override
  Future<void> close() {
    editNameController.dispose();
    editEmailController.dispose();
    editPasswordController.dispose();
    editConPasswordController.dispose();
    return super.close();
  }
}
