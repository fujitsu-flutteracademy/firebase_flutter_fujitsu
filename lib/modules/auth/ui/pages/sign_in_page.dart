import 'package:firebase_flutter_fujitsu/modules/auth/cubit/auth_cubit.dart';
import 'package:firebase_flutter_fujitsu/modules/auth/data/services/auth_firebase_user.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        // await FirestoreDatabaseUsers().createNewUser(
        //   uidUser: '123456',
        //   nameUser: 'Jose',
        // );
        // final newUser =
        //     await FirestoreDatabaseUsers().getUserById(uid: '123456');

        // print(newUser!.name);

        // final response =
        //     await FirebaseAuthRepository().singnUpWithEmailAndPassword(
        //   email: 'jose@jose.com',
        //   password: '123456',
        // );
        // print(response);
        AuthCubit().signInWithEmailAndPassword(
          email: 'jose2@jose.com',
          password: '123456',
        );
      }),
      body: Center(
        child: Text("SIGN IN"),
      ),
    );
  }
}
