import 'package:firebase_flutter_fujitsu/modules/auth/data/models/user_model.dart';
import 'package:firebase_flutter_fujitsu/modules/auth/data/services/auth_firebase_user.dart';
import 'package:firebase_flutter_fujitsu/modules/auth/data/services/firestore_service_users.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState.initial()) {
    findUserById();
  }

  FirebaseAuthRepository firebaseAuthRepository = FirebaseAuthRepository();
  FirestoreDatabaseUsers firestoreDatabaseUsers = FirestoreDatabaseUsers();

  Future<void> signUpWithEmailAndPassword(
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

      emit(
        state.copyWith(
          nombre: newUser.name ?? '',
          uid: newUser.uid,
          email: newUser.email,
        ),
      );
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(state.copyWith(formUserState: FormUserState.loading));
    final newUser = await firebaseAuthRepository.singnInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(newUser);
    if (newUser != null) {
      print(newUser);

      emit(
        state.copyWith(
          nombre: newUser.name ?? '',
          uid: newUser.uid,
          email: newUser.email,
        ),
      );
    }

    emit(state.copyWith(formUserState: FormUserState.initial));
  }

  Future<void> findUserById() async {
    UserModel? myUser = await firestoreDatabaseUsers.getUserById(
        uid: "fgCWwqR98gVoaQ799zinUuSNdkL2");

    if (myUser != null) {
      emit(
        state.copyWith(
          nombre: myUser.name ?? '',
          uid: myUser.uid,
          email: myUser.email,
        ),
      );
    }
  }
}
