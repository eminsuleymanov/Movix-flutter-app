import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final TextEditingController editNameController = TextEditingController();
  final TextEditingController editEmailController = TextEditingController();
  final TextEditingController editOldPasswordController =
      TextEditingController();
  final TextEditingController editNewPasswordController =
      TextEditingController();

  final ImagePicker _picker = ImagePicker();
  final BehaviorSubject<File?> profilePhoto = BehaviorSubject<File?>();

  Future<void> fetchUserData() async {
    try {
      emit(UserLoading());
      final currentUser = _firebaseAuth.currentUser;

      if (currentUser == null) {
        emit(UserError(error: "User not logged in."));
        return;
      }

      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      if (!userDoc.exists) {
        emit(UserError(error: "User data not found."));
        return;
      }

      final data = userDoc.data();
      if (data != null) {
        final userModel = UserModel.fromDoc(userDoc.id, data);

        emit(UserSuccess(
          userModel: userModel,
          message: "User data loaded successfully.",
        ));
      } else {
        emit(UserError(error: "User data is empty."));
      }
    } catch (e) {
      emit(UserError(error: "Failed to load user data: $e"));
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
    emit(UserLoading());

    final user = _firebaseAuth.currentUser;
    if (user == null) {
      emit(UserError(error: "User not found."));
      return;
    }

    final displayName = editNameController.text.trim();
    final email = editEmailController.text.trim();
    final oldPassword = editOldPasswordController.text.trim();
    final newPassword = editNewPasswordController.text.trim();

    try {
      if (displayName.isNotEmpty && displayName != user.displayName) {
        await user.updateDisplayName(displayName);
      }
    } catch (e) {
      emit(UserError(error: "Failed to update display name: $e"));
      return;
    }

    try {
      if (email.isNotEmpty && email != user.email) {
        await user.verifyBeforeUpdateEmail(email);
      }
    } catch (e) {
      emit(UserError(error: "Failed to update email: $e"));
      return;
    }

    try {
      if (newPassword.isNotEmpty) {
        if (oldPassword == newPassword) {
          emit(UserError(
              error: "New password cannot be the same as the old password."));
          return;
        }

        final credential = EmailAuthProvider.credential(
          email: user.email!,
          password: oldPassword,
        );
        await user.reauthenticateWithCredential(
            credential); 
        await user.updatePassword(newPassword);
      }
    } catch (e) {
      emit(UserError(error: "Failed to update password: $e"));
      return;
    }

    String? photoUrl;
    try {
      photoUrl = await uploadProfilePhoto();
      if (photoUrl != null) {
        await user.updatePhotoURL(photoUrl);
      }
    } catch (e) {
      emit(UserError(error: "Failed to upload photo: $e"));
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'displayName': displayName.isNotEmpty ? displayName : user.displayName,
        'email': email.isNotEmpty ? email : user.email,
        'photoUrl': photoUrl ?? user.photoURL,
      }, SetOptions(merge: true));
    } catch (e) {
      emit(UserError(error: "Failed to update Firestore: $e"));
      return;
    }
    try {
      await user.reload();
      fetchUserData();

      emit(UserSuccess(
        userModel: UserModel(
          uid: user.uid,
          displayName: displayName.isNotEmpty ? displayName : user.displayName,
          email: email.isNotEmpty ? email : user.email,
          photoUrl: photoUrl ?? user.photoURL ?? '',
        ),
        message: "Profile updated successfully.",
      ));
    } catch (e) {
      emit(UserError(error: "Failed to reload user data: $e"));
      return;
    }
    resetControllers();
  }

  Future<void> pickProfilePhoto() async {
    emit(UserImageLoading());
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profilePhoto.add(File(pickedFile.path));
        emit(UserImagePickedSuccess());
      } else {
        emit(UserImageUploadedError(error: 'No image selected.'));
      }
    } catch (e) {
      emit(UserImageUploadedError(error: 'Failed to pick an image: $e'));
    }
  }

  Future<String?> uploadProfilePhoto() async {
    final File? imageFile = profilePhoto.value;
    if (imageFile == null) {
      return null;
    }

    emit(UserLoading());
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      emit(UserError(error: "User not authenticated."));
      return null;
    }

    try {
      final ref =
          FirebaseStorage.instance.ref('profile_photos/${user.uid}.jpg');
      await ref.putFile(imageFile);
      final downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      emit(UserImageUploadedError(error: 'Failed to upload image: $e'));
      return null;
    }
  }

  void resetControllers() {
    editNameController.clear();
    editEmailController.clear();
    editOldPasswordController.clear();
    editNewPasswordController.clear();
  }

  @override
  Future<void> close() {
    editNameController.dispose();
    editEmailController.dispose();
    editOldPasswordController.dispose();
    editNewPasswordController.dispose();
    profilePhoto.close();
    return super.close();
  }
}
