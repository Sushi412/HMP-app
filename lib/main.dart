import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heath_matthews_physio/screens/LogoutScreen.dart';
import 'package:heath_matthews_physio/screens/excercise.dart';
import 'package:heath_matthews_physio/screens/programsMy.dart';
import 'package:heath_matthews_physio/screens/AdminScreen.dart';
import 'package:heath_matthews_physio/screens/excerciseScreen.dart';
import 'package:heath_matthews_physio/screens/information_screen.dart';
import 'package:heath_matthews_physio/screens/login.dart';
import 'package:heath_matthews_physio/screens/mainScreen2.dart';
import 'package:heath_matthews_physio/screens/main_screen.dart';
import 'package:heath_matthews_physio/screens/myPrograms.dart';
import 'package:heath_matthews_physio/screens/reg_name_and_dp.dart';
import 'package:heath_matthews_physio/screens/register.dart';
import 'package:heath_matthews_physio/screens/verificationPage.dart';

import 'package:heath_matthews_physio/screens/workout-page.dart';
import 'package:heath_matthews_physio/screens/workoutScreen.dart';


import 'screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(home: MyApp()),
  );
}
final navigatorKey=GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
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
        '/program':(context)=>program(),

        '/workout-page':(context)=>workoutScreen(),
        // '/exerciseScreen':(context)=>excerciseScreen(),
        '/exercise':(context)=>exercise(),
        '/workoutScreen':(context)=>workoutScreen1(),
        '/logout':(context)=>logoutScreen(),
        '/verification':(context)=>verificationPage(),

      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Color(0xFF193669),
      ),
    );
  }
}
