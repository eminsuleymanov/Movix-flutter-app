class UserModel {
  final String uid;
  final String? displayName;
  final String? email;
  final String? photoUrl;

  UserModel({
    required this.uid,
    this.displayName,
    this.email,
    this.photoUrl,
  });

  factory UserModel.fromDoc(String uid, Map<String, dynamic> data) {
    return UserModel(
      uid: uid,
      displayName: data['displayName'],
      email: data['email'],
      photoUrl: data['photoUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'email': email,
      'photoUrl': photoUrl,
    };
  }
}
