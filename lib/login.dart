import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}


TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Column(
        children: [
          TextField(
            
          )
        ],
      ),
    );
  }
}
