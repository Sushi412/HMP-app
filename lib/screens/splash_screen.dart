import 'package:flutter/material.dart';
import 'package:heath_matthews_physio/DynamicSize/size.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateTologin();
  }

  _navigateTologin() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacementNamed(context, '/mainScreen');
  }

  @override
  Widget build(BuildContext context) {

    return Container(
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

//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, '/mainScreen');
//       },
//       child: Container(
//           decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                 Color.fromARGB(178, 25, 54, 105),
//                 Colors.white,
//                 Color(0xFFEDC152)
//               ])),
//           child: Padding(
//             padding: EdgeInsets.all(DynamicSize.Aaheight(78.0)),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset("images/HMP LOGO.png"),
//               ],
//             ),
//           )
//           // child: AnimatedSplashScreen(
//           //
//           //   splash: 'images/HMP LOGO.png',
//           //   nextScreen: mainScreen(),
//           //   splashTransition: SplashTransition.slideTransition,
//           //   pageTransitionType: PageTransitionType.rightToLeft,
//           // ),

          ),
        )
        // child: AnimatedSplashScreen(
        //
        //   splash: 'images/HMP LOGO.png',
        //   nextScreen: mainScreen(),
        //   splashTransition: SplashTransition.slideTransition,
        //   pageTransitionType: PageTransitionType.rightToLeft,
        // ),
        );
  }
}
