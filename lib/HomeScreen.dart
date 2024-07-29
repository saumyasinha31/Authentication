import 'package:authentication/Methods.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => logOut(context),
            child: Text("LogOut"),
        ),
      ),
    );
  }
}
