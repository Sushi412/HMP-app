import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/AdminScreen.dart';
import 'screens/main_screen.dart';
import 'dart:developer' as developer;

class wrapper extends StatelessWidget {
  const wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    developer.log('\x1B[32mUser : ${firebaseUser}\x1B[0m');
    if (firebaseUser != null && firebaseUser.emailVerified) {
      print('Navigate to Admin Screen');
      return adminScreen();
    } else {
      print('Navigate to Main Screen');
      return mainScreen();
    }
  }
}
