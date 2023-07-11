import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_fujitsu/modules/auth/data/models/user_model.dart';

class FirebaseAuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel?> singnUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final myFirebaseUSer = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((UserCredential user) => UserModel.fromFirebaseUser(user));
      return myFirebaseUSer;
    } on FirebaseAuthException catch (e) {
      print(e);
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel?> singnInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final myFirebaseUSer = await _firebaseAuth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((UserCredential user) => UserModel.fromFirebaseUser(user));
      return myFirebaseUSer;
    } on FirebaseAuthException catch (e) {
      print(e);
      return UserModel(
        uid: '',
        email: email,
        errorMessage: e.message,
      );
    } catch (e) {
      print(e);
      return UserModel(
        uid: '',
        email: email,
        errorMessage: 'Error no controlado',
      );
    }
  }
}
