import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Aquí puedes chatear con el Admin si tienes alguna duda",
        ),
      ),
    );
  }
}
