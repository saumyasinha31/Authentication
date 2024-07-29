import 'package:authentication/CreateAccount.dart';
import 'package:authentication/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:authentication/Methods.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height / 20),
            Container(
              alignment: Alignment.centerLeft,
              width: size.width / 1.2,
              child: IconButton(
                onPressed: () {}, // Add back navigation or functionality
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            SizedBox(height: size.height / 50),
            Container(
              width: size.width / 1.3,
              child: Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: size.width / 1.3,
              child: Text(
                "Sign in to Continue!",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: size.height / 10),
            Container(
              width: size.width,
              alignment: Alignment.center,
              child: field(size, "email", Icons.account_box, _email),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 19.0),
              child: Container(
                width: size.width,
                alignment: Alignment.center,
                child: field(size, "password", Icons.lock, _password),
              ),
            ),
            SizedBox(height: size.height / 10),
            customButton(size),
            SizedBox(height: size.height / 20),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => CreateAccount()),
              ),
              child: Text(
                "Create a new Account",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () async {
        if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
          setState(() {
            isLoading = true;
          });

          User? user = await logIn(_email.text, _password.text);
          if (user != null) {
            print("Login Successful");
            setState(() {
              isLoading = false;
            });
            Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
            // Navigate to the next screen or home screen
          } else {
            print("Login Failed");
            setState(() {
              isLoading = false;
            });
          }
        } else {
          print("Please fill in all fields");
        }
      },
      child: Container(
        height: size.height / 14,
        width: size.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue[700],
        ),
        alignment: Alignment.center,
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget field(Size size, String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height: size.height / 11,
      width: size.width / 1.1,
      child: TextField(
        controller: cont,
        obscureText: hintText == "password",
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
