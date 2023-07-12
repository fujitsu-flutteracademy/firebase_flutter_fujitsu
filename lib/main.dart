import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flutter_fujitsu/core/config/firebase_options.dart';
import 'package:firebase_flutter_fujitsu/core/router/app_router.dart';
import 'package:firebase_flutter_fujitsu/modules/auth/cubits/user_cubit/user_cubit.dart';
import 'package:firebase_flutter_fujitsu/modules/auth/ui/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => UserCubit(),
      child: MaterialApp.router(
        //Routes
        routerConfig: goRouter,
      ),
    );
  }
}
