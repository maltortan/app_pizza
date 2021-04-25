

import 'package:firebase_auth/firebase_auth.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizzaaa/screens/homeScreen.dart';
import 'package:provider/provider.dart';

import '../screens/loginScreen.dart';
import '../screens/signupScreen.dart';

class SignInAuth extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomeScreen();
    }
    return LoginScreen();
  }
}

class SignupWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomeScreen();
    }
    return SignupScreen();
  }
}
