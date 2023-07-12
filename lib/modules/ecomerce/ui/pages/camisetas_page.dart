import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CamisetasPage extends StatelessWidget {
  const CamisetasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Navigator.of(context).pop();
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Text("Estas son las camisetas que puedo ofrecerte,"),
      ),
    );
  }
}
