import 'package:firebase_flutter_fujitsu/core/router/app_router.dart';
import 'package:firebase_flutter_fujitsu/modules/auth/cubits/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: Row(
            children: [
              FloatingActionButton(
                heroTag: 'B1',
                child: Icon(
                  Icons.shop,
                ),
                onPressed: () {
                  context.goNamed(AppRoutes.ecomerce.name);
                },
              ),
              SizedBox(
                width: 20.0,
              ),
              FloatingActionButton(
                heroTag: 'B2',
                child: Icon(
                  Icons.chat,
                ),
                onPressed: () {
                  context.goNamed(AppRoutes.chat.name);
                },
              ),
            ],
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "¡Bienvenid@!",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  state.nombre,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
