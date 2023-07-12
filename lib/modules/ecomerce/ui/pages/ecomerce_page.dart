import 'package:firebase_flutter_fujitsu/core/router/app_router.dart';
import 'package:firebase_flutter_fujitsu/modules/auth/cubits/user_cubit/user_cubit.dart';
import 'package:firebase_flutter_fujitsu/modules/ecomerce/cubits/bikes_cubit/bikes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EcomercePage extends StatelessWidget {
  const EcomercePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BikesCubit>(
        create: (context) => BikesCubit()..init(),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
            title: BlocBuilder<UserCubit, UserState>(
              builder: (context, stateUser) {
                return Text(stateUser.nombre);
              },
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'B1',
                onPressed: () {
                  context.goNamed(AppRoutes.camisetas.name);
                },
                child: Icon(Icons.tab),
              ),
              SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                heroTag: 'B2',
                onPressed: () {
                  context.goNamed(AppRoutes.bicicletas.name);
                },
                child: Icon(Icons.bike_scooter),
              )
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          body: Center(
            child: Text("Esta es mi Tienda"),
          ),
        ));
  }
}
