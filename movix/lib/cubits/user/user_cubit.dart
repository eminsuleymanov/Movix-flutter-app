import 'dart:developer';
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
  final TextEditingController editPasswordController = TextEditingController();
  final TextEditingController editConPasswordController =
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

    final photoUrl = await uploadProfilePhoto(); 
    if (photoUrl != null) {
      await user.updatePhotoURL(photoUrl);
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set({
          'displayName': displayName.isNotEmpty ? displayName : user.displayName,
          'email': email.isNotEmpty ? email : user.email,
          'photoUrl': photoUrl ?? '',
        }, SetOptions(merge: true));

    await user.reload();

    fetchUserData();

    emit(UserSuccess(
      userModel: UserModel(
        uid: user.uid,
        displayName: displayName.isNotEmpty ? displayName : user.displayName,
        email: email.isNotEmpty ? email : user.email,
        photoUrl: photoUrl ?? '',
      ),
      message: "Profile updated successfully.",
    ));
    resetControllers();
  } catch (e) {
    emit(UserError(error: "Failed to update profile: $e"));
  }
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
      emit(UserImageUploadedError(error: 'No image selected'));
    }

    emit(UserLoading());
    final user = _firebaseAuth.currentUser;
    try {
      if (user == null) {
        log("User not authenticated.");
      }
      final ref =
          FirebaseStorage.instance.ref('profile_photos/${user!.uid}.jpg');
      await ref.putFile(imageFile!);

      final downloadUrl = await ref.getDownloadURL();
      log('url goturdu $downloadUrl');
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({'photoUrl': downloadUrl});

      log('all done');
      return downloadUrl;
    } catch (e) {
      emit(UserImageUploadedError(error: 'Failed to upload image.$e'));
      return null;
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
    profilePhoto.close();
    return super.close();
  }
}
