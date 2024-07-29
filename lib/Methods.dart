import 'package:authentication/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<User?> createAccount(
    String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    // Create a new user with the provided email and password
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;

    if (user != null) {
      // Set the display name
      await user.updateDisplayName(name);
      await user.reload();
      user = _auth.currentUser;

      print("Account Creation Successful");
      return user;
    } else {
      print("Account Creation Failed");
      return null;
    }
  } catch (e) {
    print("Error: $e");
    return null;
  }
}

Future<User?> logIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;

    if (user != null) {
      print("Login Successful");
      return user;
    } else {
      print("Login Failed");
      return null;
    }
  } catch (e) {
    print("Error: $e");
    return null;
  }
}

Future<void> logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    await _auth.signOut().then((value){
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    });
    print("Logout Successful");
  } catch (e) {
    print("Error during logout: $e");
  }
}
