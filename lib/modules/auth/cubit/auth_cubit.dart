import 'package:firebase_flutter_fujitsu/modules/auth/data/models/user_model.dart';
import 'package:firebase_flutter_fujitsu/modules/auth/data/services/auth_firebase_user.dart';
import 'package:firebase_flutter_fujitsu/modules/auth/data/services/firestore_service_users.dart';

class AuthCubit {
  FirebaseAuthRepository firebaseAuthRepository = FirebaseAuthRepository();
  FirestoreDatabaseUsers firestoreDatabaseUsers = FirestoreDatabaseUsers();
  Future<UserModel> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final newUser = await firebaseAuthRepository.singnUpWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(newUser);
    if (newUser != null) {
      await firestoreDatabaseUsers.createNewUser(
        uidUser: newUser.uid,
        nameUser: newUser.name ?? '',
        email: newUser.email,
        isAdmin: newUser.isAdmin,
      );

      print(newUser);
    }

    //emit()
    return newUser!;
  }
}
