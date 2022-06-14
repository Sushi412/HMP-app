import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:heath_matthews_physio/DynamicSize/size.dart';
import 'package:heath_matthews_physio/screens/main_screen.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/loginScreen');
      },
      child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromARGB(178, 25, 54, 105),
                Colors.white,
                Color(0xFFEDC152)
              ])),
          child: Padding(
            padding: EdgeInsets.all(DynamicSize.Aaheight(78.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("images/HMP LOGO.png"),
              ],
            ),
          )
          // child: AnimatedSplashScreen(
          //
          //   splash: 'images/HMP LOGO.png',
          //   nextScreen: mainScreen(),
          //   splashTransition: SplashTransition.slideTransition,
          //   pageTransitionType: PageTransitionType.rightToLeft,
          // ),
          ),
    );
  }
}
