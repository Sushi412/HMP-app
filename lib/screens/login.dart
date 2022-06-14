import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:heath_matthews_physio/DynamicSize/size.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //To Control PassWord Visibiltiy
  late bool _visibility;

  @override
  void initState() {
    super.initState();
    _visibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Grettings
          SizedBox(height: DynamicSize.Faheight(92)),
          Container(
            child: Text(
              "Welcome Back",
              style: TextStyle(
                fontFamily: 'DMSams',
                fontSize: DynamicSize.Faheight(30),
                fontWeight: FontWeight.w700,
                color: Color(0xff193669),
                letterSpacing: DynamicSize.Fawidth(0.5),
              ),
            ),
          ),
          SizedBox(height: DynamicSize.Faheight(17)),
          Container(
            margin: EdgeInsets.symmetric(horizontal: DynamicSize.Fawidth(17)),
            child: Text(
              'Hey, nice seeing you again !! Please login/register to continue further',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'DMSans',
                fontSize: DynamicSize.Faheight(14),
                fontWeight: FontWeight.w600,
                color: Color(0xff193669),
                letterSpacing: DynamicSize.Fawidth(0.5),
              ),
            ),
          ),

          //User Credentials
          SizedBox(height: DynamicSize.Faheight(60)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: DynamicSize.Fawidth(19)),
            margin: EdgeInsets.symmetric(horizontal: DynamicSize.Fawidth(25)),
            alignment: Alignment.center,
            height: DynamicSize.Faheight(50),
            decoration: BoxDecoration(
              color: Color(0xFFF3F3F3),
              borderRadius: BorderRadius.circular(DynamicSize.Faheight(15)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, DynamicSize.Faheight(2)),
                  color: Color.fromARGB(141, 0, 0, 0),
                  blurRadius: DynamicSize.Faheight(3),
                ),
                BoxShadow(
                  offset: Offset(DynamicSize.Fawidth(-2), 0),
                  color: Color(0xFFF3F3F3),
                  blurRadius: DynamicSize.Faheight(1),
                ),
                BoxShadow(
                  offset: Offset(DynamicSize.Fawidth(2), 0),
                  color: Color(0xFFF3F3F3),
                  blurRadius: DynamicSize.Faheight(1),
                ),
              ],
            ),
            child: TextField(
              style: TextStyle(
                fontFamily: 'DMSams',
                fontSize: DynamicSize.Faheight(18),
                letterSpacing: DynamicSize.Fawidth(0.5),
              ),
              decoration: InputDecoration(
                hintText: "Username, Email & Phone Number",
                border: InputBorder.none,
              ),
            ),
          ),

          //Password field
          SizedBox(height: DynamicSize.Faheight(15)),
          Container(
            padding: EdgeInsets.only(
                left: DynamicSize.Fawidth(19), right: DynamicSize.Fawidth(8)),
            margin: EdgeInsets.symmetric(horizontal: DynamicSize.Fawidth(25)),
            alignment: Alignment.center,
            height: DynamicSize.Faheight(50),
            decoration: BoxDecoration(
              color: Color(0xFFF3F3F3),
              borderRadius: BorderRadius.circular(DynamicSize.Faheight(15)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, DynamicSize.Faheight(2)),
                  color: Color.fromARGB(141, 0, 0, 0),
                  blurRadius: DynamicSize.Faheight(3),
                ),
                BoxShadow(
                  offset: Offset(DynamicSize.Fawidth(-2), 0),
                  color: Color(0xFFF3F3F3),
                  blurRadius: DynamicSize.Faheight(1),
                ),
                BoxShadow(
                  offset: Offset(DynamicSize.Fawidth(2), 0),
                  color: Color(0xFFF3F3F3),
                  blurRadius: DynamicSize.Faheight(1),
                ),
              ],
            ),
            child: TextField(
              style: TextStyle(
                fontFamily: 'DMSams',
                fontSize: DynamicSize.Faheight(18),
                letterSpacing: DynamicSize.Fawidth(0.5),
              ),
              decoration: InputDecoration(
                hintText: "Password",
                border: InputBorder.none,
                suffixIcon: IconButton(
                  splashRadius: 1,
                  splashColor: Colors.transparent,
                  icon: Icon(
                      _visibility ? Icons.visibility_off : Icons.visibility),
                  color: Color(_visibility ? (0xFF193669) : (0xFF666161)),
                  onPressed: () => setState(() => _visibility = !_visibility),
                ),
              ),
              obscureText: !_visibility,
            ),
          ),

          //Forgot Password Button
          SizedBox(height: DynamicSize.Faheight(13)),
          Container(
            padding: EdgeInsets.only(right: DynamicSize.Fawidth(36)),
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => print('Tapped'),
              child: Text(
                "Forgot Password ?",
                style: TextStyle(
                  fontFamily: "DMSans",
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  fontSize: DynamicSize.Faheight(15),
                  color: Color(0xFF193669),
                ),
              ),
            ),
          ),

          //Sign In Button
          SizedBox(height: DynamicSize.Faheight(40)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: DynamicSize.Fawidth(15)),
            child: SizedBox(
              width: double.infinity,
              height: DynamicSize.Faheight(50),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF193669),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(DynamicSize.Faheight(15)),
                    )
                    // padding: EdgeInsets.symmetric(horizontal: 1),
                    ),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    fontSize: DynamicSize.Faheight(22),
                    letterSpacing: DynamicSize.Fawidth(0.8),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          //Register Button
          SizedBox(height: DynamicSize.Faheight(16)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: DynamicSize.Fawidth(15)),
            child: SizedBox(
              width: double.infinity,
              height: DynamicSize.Faheight(50),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF193669),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(DynamicSize.Faheight(15)),
                    )
                    // padding: EdgeInsets.symmetric(horizontal: 1),
                    ),
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    fontSize: DynamicSize.Faheight(22),
                    letterSpacing: DynamicSize.Fawidth(0.8),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          //Or Sign Up With
          SizedBox(height: DynamicSize.Faheight(28)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Gradient Line
              DottedLine(
                direction: Axis.horizontal,
                lineLength: DynamicSize.Fawidth(120),
                lineThickness: DynamicSize.Faheight(3.0),
                dashLength: DynamicSize.Fawidth(3.0),
                dashGradient: [Color(0x00C4C4C4), Color(0xFF193669)],
                dashGapLength: 0.0,
                dashGapGradient: [Color(0x00C4C4C4), Color(0xFF193669)],
                dashGapRadius: 0.0,
              ),

              //Text : Or Sign Up with
              Text(
                "Or Sign In With",
                style: TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: DynamicSize.Faheight(14),
                  fontWeight: FontWeight.w500,
                  letterSpacing: DynamicSize.Fawidth(0.5),
                  color: Color(0xFF555252),
                ),
              ),

              //Gardient Line
              DottedLine(
                direction: Axis.horizontal,
                lineLength: DynamicSize.Fawidth(120),
                lineThickness: DynamicSize.Faheight(3.0),
                dashLength: DynamicSize.Fawidth(3.0),
                dashGradient: [Color(0xFF193669), Color(0x00C4C4C4)],
                dashGapLength: 0.0,
                dashGapGradient: [Color(0xFF193669), Color(0x00C4C4C4)],
                dashGapRadius: 0.0,
              )
            ],
          ),

          //Different Sign In Options
          SizedBox(height: DynamicSize.Faheight(29)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Google
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  elevation: 0,
                ),
                child: CircleAvatar(
                  radius: DynamicSize.Faheight(25),
                  backgroundColor: Color(0xFFECE9EC),
                  child: CircleAvatar(
                    radius: DynamicSize.Faheight(18),
                    backgroundColor: Color(0xFFECE9EC),
                    foregroundImage: AssetImage('assets/Icons/google.png'),
                  ),
                ),
              ),

              //Facebook
              // SizedBox(width: 5),
              // ElevatedButton(
              //   onPressed: () {},
              //   style: ElevatedButton.styleFrom(
              //     shape: CircleBorder(),
              //     elevation: 0,
              //   ),
              //   child: CircleAvatar(
              //     radius: 25,
              //     backgroundColor: Color(0xFFECE9EC),
              //     child: CircleAvatar(
              //       radius: 18,
              //       backgroundColor: Color(0xFFECE9EC),
              //       foregroundImage: AssetImage('assets/Icons/facebook.png'),
              //     ),
              //   ),
              // ),

              //Apple
              SizedBox(width: DynamicSize.Fawidth(5)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  elevation: 0,
                ),
                child: CircleAvatar(
                  radius: DynamicSize.Faheight(25),
                  backgroundColor: Color(0xFFECE9EC),
                  child: CircleAvatar(
                    radius: DynamicSize.Faheight(18),
                    backgroundColor: Color(0xFFECE9EC),
                    foregroundImage: AssetImage('assets/Icons/apple.png'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
