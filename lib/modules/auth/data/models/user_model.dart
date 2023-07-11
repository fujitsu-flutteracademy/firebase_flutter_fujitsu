import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String uid;
  String? name;
  final String email;
  String? errorMessage;
  final bool isAdmin;

  UserModel({
    required this.uid,
    required this.email,
    this.isAdmin = false,
    this.errorMessage = '',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromFirebaseUser(UserCredential firebaseUser) {
    final String uid = firebaseUser.user?.uid ?? '';
    final String email = firebaseUser.user?.email ?? '';
    final bool isNewUser = firebaseUser.additionalUserInfo?.isNewUser ?? false;
    bool? isAnonymous = firebaseUser.user!.isAnonymous;
    String? photoUrl = firebaseUser.user!.photoURL;
    return UserModel(
      uid: uid,
      email: email,
    );
  }
}
