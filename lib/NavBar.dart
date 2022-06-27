import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text(
              "Set Profile Details",
              style: GoogleFonts.dmSans(
                fontSize: 20.0,
                color: Color(0xFF193669),
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/reg_name_and_dp');
            },
          ),
          ListTile(
            title: Text(
              "Logout",
              style: GoogleFonts.dmSans(
                fontSize: 20.0,
                color: Color(0xFF193669),
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/logout');
            },
          ),
          ListTile(
            title: Text(
              "verification",
              style: GoogleFonts.dmSans(
                fontSize: 20.0,
                color: Color(0xFF193669),
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/verification');
            },
          )


        ],
      ),

    );
  }
}
