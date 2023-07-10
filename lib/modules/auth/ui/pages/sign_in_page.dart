import 'package:firebase_flutter_fujitsu/modules/auth/data/services/firestore_service_users.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        FirestoreDatabaseUsers().editUser(
          desc: 'holaaa Mundoooooo',
          uuid: '1222ddddaaaaa2',
        );
      }),
      body: Center(
        child: Text("SIGN IN"),
      ),
    );
  }
}
