import 'package:firebase_flutter_fujitsu/core/router/app_router.dart';
import 'package:firebase_flutter_fujitsu/modules/ecomerce/cubits/bikes_cubit/bikes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BicicletasPage extends StatelessWidget {
  const BicicletasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(AppRoutes.formBicicletas.name);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Text("Estas son las bicicletas mas potentes"),
      ),
    );
  }
}
