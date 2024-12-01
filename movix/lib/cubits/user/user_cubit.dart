import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

   User? currentUser;

    Future<void> fetchUserData() async {
    emit(UserLoading());
    try {
      currentUser = _firebaseAuth.currentUser;
      if (currentUser == null) {
        emit(UserError(error: "No user is currently logged in."));
      } else {
        emit(UserSuccess(user: currentUser));
      }
    } catch (e) {
      emit(UserError(error: "Failed to fetch user data."));
    }
  }

  Future<void> signOut() async {
    emit(UserLoading());
    try {
      await _firebaseAuth.signOut();
      emit(LogOut("Logged out successfully"));
    } catch (e) {
      emit(LogOutError(e.toString()));
    }
  }

}
