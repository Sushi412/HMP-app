import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heath_matthews_physio/screens/information_screen.dart';
import 'package:heath_matthews_physio/screens/login.dart';
import 'package:heath_matthews_physio/screens/main_screen.dart';
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
        '/loginScreen': (context) => const Login(),
        '/mainScreen': (context) => const mainScreen(),
        '/informationScreen': (context) => const informationScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
