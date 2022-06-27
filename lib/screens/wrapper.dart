import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'AdminScreen.dart';
import 'login.dart';
import 'main_screen.dart';

class wrapper extends StatelessWidget {
  const wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(builder: (context, snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      else if (snapshot.hasError){
        return Scaffold(
          body: Center(
            child: Text("Oops Something Went Wrong,Please try again later"),
          ),
        );
      }
      else if(snapshot.hasData){
        return adminScreen();
      }
      else return mainScreen();
    },
        stream: FirebaseAuth.instance.authStateChanges());
  }
}
