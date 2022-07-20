import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heath_matthews_physio/screens/LogoutScreen.dart';
import 'package:heath_matthews_physio/screens/excercise.dart';
import 'package:heath_matthews_physio/screens/programsMy.dart';
import 'package:heath_matthews_physio/screens/AdminScreen.dart';
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
import 'package:heath_matthews_physio/services/firebase_auth_methods.dart';
import 'package:heath_matthews_physio/wrapper.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => FirebaseAuthMethods(FirebaseAuth.instance)),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        )
      ],
      child: GetMaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => const Splash(),
          // '/': (context) => const workoutScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/wrapper': (context) => wrapper(),
          '/mainScreen': (context) => const mainScreen(),
          '/mainScreen2': (context) => const mainScreen2(),
          '/loginScreen': (context) => const Login(),
          '/registerScreen': (context) => const Register(),
          '/informationScreen': (context) => const informationScreen(),
          '/reg_name_and_dp': (context) => reg_name_and_dp(),
          '/myPrograms': (context) => const myPrograms(),
          '/adminScreen': (context) => adminScreen(),
          '/program': (context) => program(),
          '/workout-page': (context) => workoutScreen(),
          '/exercise': (context) => exercise(),
          '/workoutScreen': (context) => workoutScreen1(),
          '/logout': (context) => logoutScreen(),
          '/verification': (context) => verificationPage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Color(0xFF193669),
        ),
      ),
    );
  }
}
