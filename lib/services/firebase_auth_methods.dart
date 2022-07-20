import 'dart:async';
import 'dart:developer' as developer;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heath_matthews_physio/screens/register.dart';
import 'package:heath_matthews_physio/utils/showSnackBar.dart';

import '../utils/loadingspinner.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  //State Management
  Stream<User?> get authState => _auth.userChanges();

  //Email Sign Up Function
  Future<String?> singUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      loadingSpinner(context);
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.of(context, rootNavigator: true).pop();
      await sendVerification(context);
    } on FirebaseAuthException catch (e) {
      Navigator.of(context, rootNavigator: true).pop();
      return e.message;
    }
    developer.log('\x1B[32m------Passing Null--------\x1B[0m');
    return null;
  }

  //Email LogIn Function
  Future<String?> signInWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      loadingSpinner(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context, rootNavigator: true).pop();
      if (!_auth.currentUser!.emailVerified) {
        await sendVerification(context);
        // return "Email Not verified!";
      }
    } on FirebaseAuthException catch (e) {
      Navigator.of(context, rootNavigator: true).pop();
      return e.message;
    }
    developer.log('\x1B[32m------Passing Null--------\x1B[0m');
    return null;
  }

  //Send Email Verification
  Future<void> sendVerification(BuildContext context) async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      popUpVerificationMsg(context);
      final emailVerifyCompleter = Completer<void>();
      await Timer.periodic(
        Duration(seconds: 3),
        (timer) {
          developer.log(
              '\x1B[32m--------Email verification Pending---------\x1B[0m');
          _auth.currentUser!.reload();
          if (_auth.currentUser!.emailVerified) {
            emailVerifyCompleter.complete();
            timer.cancel();
          }
        },
      );
      await emailVerifyCompleter.future;
      developer.log('\x1B[32m------------Email Verified-----------\x1B[0m');
      Navigator.of(context, rootNavigator: true).pop();
      // Navigator.pushReplacementNamed(context, '/wrapper');
    } on FirebaseAuthException catch (e) {
      ShowSnackBar(context, e.message!);
    }
  }

  //Reset Password Email link
  Future<String?> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
    return null;
  }

  Future signOut(context) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      ShowSnackBar(context, e.message!);
    }
  }
}
