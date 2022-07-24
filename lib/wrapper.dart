import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_progress_indicator/widget/gradient_progress_indicator_widget.dart';
import 'package:heath_matthews_physio/screens/programsMy.dart';
import 'package:heath_matthews_physio/screens/reg_name_and_dp.dart';
import 'package:provider/provider.dart';
import 'screens/AdminScreen.dart';
import 'screens/main_screen.dart';

class wrapper extends StatelessWidget {
  const wrapper({Key? key}) : super(key: key);

  Future<Map<String, dynamic>?> getDoc(User firebaseUser) async {
    var record = await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .get();
    return record.data();
  }

  Future<bool> getSubcollectionMyprograms(User firebaseUser) async {
    var value = await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .collection('myprograms')
        .limit(1)
        .get();
    return value.docs.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null && firebaseUser.emailVerified) {
      return FutureBuilder<Map<String, dynamic>?>(
          future: getDoc(firebaseUser),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == null) {
                return reg_name_and_dp();
              } else {
                return FutureBuilder<bool>(
                    future: getSubcollectionMyprograms(firebaseUser),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data!)
                          return program();
                        else
                          return adminScreen();
                      } else {
                        return Scaffold(
                          body: Center(
                            child: GradientProgressIndicator(
                              radius: 40,
                              duration: 1,
                              strokeWidth: 6,
                              gradientStops: [
                                0.0,
                                1,
                              ],
                              gradientColors: [
                                Color.fromRGBO(58, 225, 128, 0),
                                Color.fromRGBO(25, 54, 105, 1),
                              ],
                              child: SizedBox.shrink(),
                            ),
                          ),
                        );
                      }
                    }));
              }
            } else {
              return Scaffold(
                body: Center(
                  child: GradientProgressIndicator(
                    radius: 40,
                    duration: 1,
                    strokeWidth: 6,
                    gradientStops: [
                      0.0,
                      1,
                    ],
                    gradientColors: [
                      Color.fromRGBO(58, 225, 128, 0),
                      Color.fromRGBO(25, 54, 105, 1),
                    ],
                    child: SizedBox.shrink(),
                  ),
                ),
              );
            }
          });
    } else
      return mainScreen();
  }
}