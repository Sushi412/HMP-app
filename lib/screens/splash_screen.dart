import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:heath_matthews_physio/screens/main_screen.dart';
import 'package:page_transition/page_transition.dart';


class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/informationScreen');
      },
      child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF2F3F70),
                    Colors.white,
                    Color(0xFFF7D502)
                  ])),
          child: Padding(
            padding: EdgeInsets.all(78.0),
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