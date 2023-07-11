import 'package:firebase_flutter_fujitsu/modules/auth/cubits/auth_cubit.dart';
import 'package:firebase_flutter_fujitsu/modules/auth/cubits/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
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

            // AuthCubit().signUpWithEmailAndPassword(
            //   email: 'jose2@jose.com',
            //   password: '123456',
            // );

            context.read<UserCubit>().signInWithEmailAndPassword(
                  email: 'jose2@jose.com',
                  password: '123456',
                );
          }),
          body: (state.formUserState == FormUserState.loading)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    if (state.email != '')
                      Text(
                        state.email,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.red,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.aficiones.length,
                          itemBuilder: (context, index) {
                            return Text(state.aficiones[index]);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.amber,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.aficiones.length,
                          itemBuilder: (context, index) {
                            return Text(state.aficiones[index]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
