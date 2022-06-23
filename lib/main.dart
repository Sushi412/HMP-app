import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heath_matthews_physio/screens/AdminScreen.dart';
import 'package:heath_matthews_physio/screens/excerciseScreen.dart';
import 'package:heath_matthews_physio/screens/information_screen.dart';
import 'package:heath_matthews_physio/screens/login.dart';
import 'package:heath_matthews_physio/screens/mainScreen2.dart';
import 'package:heath_matthews_physio/screens/main_screen.dart';
import 'package:heath_matthews_physio/screens/myPrograms.dart';
import 'package:heath_matthews_physio/screens/reg_name_and_dp.dart';
import 'package:heath_matthews_physio/screens/register.dart';

import 'package:heath_matthews_physio/screens/workout-page.dart';


import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const Splash(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/mainScreen': (context) => const mainScreen(),
        '/mainScreen2': (context) => const mainScreen2(),
        '/loginScreen': (context) => const Login(),
        '/registerScreen': (context) => const Register(),
        '/informationScreen': (context) => const informationScreen(),
        '/mainScreen2': (context) => const mainScreen2(),

        '/reg_name_and_dp': (context) => reg_name_and_dp(),
        '/myPrograms': (context) => const myPrograms(),

     
        '/adminScreen':(context)=>adminScreen(),

        '/workout-page':(context)=>workoutScreen(),
        '/exerciseScreen':(context)=>excerciseScreen()

      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Color(0xFF193669),
      ),
    );
  }
}
