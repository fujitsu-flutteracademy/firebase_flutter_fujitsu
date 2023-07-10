import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flutter_fujitsu/core/config/firebase_options.dart';
import 'package:firebase_flutter_fujitsu/modules/auth/ui/pages/sign_in_page.dart';
import 'package:flutter/material.dart';

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
    return const MaterialApp(
      home: SignInPage(),
    );
  }
}
