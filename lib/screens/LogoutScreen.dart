import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heath_matthews_physio/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

import '../DynamicSize/size.dart';

class logoutScreen extends StatelessWidget {
  const logoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "are you sure you want to log out?",
              style: GoogleFonts.dmSans(
                  fontSize: 20,
                  color: Color(0xFF2F3F70),
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: DynamicSize.Fawidth(15)),
              child: SizedBox(
                width: double.infinity,
                height: DynamicSize.Faheight(50),
                child: TextButton(
                  onPressed: () async {
                    context.read<FirebaseAuthMethods>().signOut(context);
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/mainScreen', (route) => false);
                  },

                  // Navigator.pushNamedAndRemoveUntil(
                  // context, '/adminScreen', (route) => false),

                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF193669),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(DynamicSize.Faheight(15)),
                      )
                      // padding: EdgeInsets.symmetric(horizontal: 1),
                      ),
                  child: Text(
                    'SIGN OUT',
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: DynamicSize.Faheight(15),
                      letterSpacing: DynamicSize.Fawidth(0.5),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
