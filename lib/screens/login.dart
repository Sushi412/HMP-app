import 'package:flutter/material.dart';
// import 'package:dotted_line/dotted_line.dart';
import 'package:heath_matthews_physio/DynamicSize/size.dart';
import 'package:heath_matthews_physio/services/firebase_auth_methods.dart';
import 'package:heath_matthews_physio/utils/showSnackBar.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotPassEmailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    forgotPassEmailController.dispose();
    super.dispose();
  }

  //To Control PassWord Visibiltiy
  late bool _visibility;

  @override
  void initState() {
    super.initState();
    _visibility = false;
  }

  void LoginUser() {
    context
        .read<FirebaseAuthMethods>()
        .signInWithEmail(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            context: context)
        .then((String? msg) => msg != null
            ? ShowSnackBar(context, msg)
            : Navigator.pushReplacementNamed(context, '/wrapper'));
  }

  Future popUpConfirm(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DynamicSize.Faheight(16))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: DynamicSize.Fawidth(31),
                    top: DynamicSize.Faheight(24),
                    right: DynamicSize.Fawidth(31)),
                child: Image.asset('images/EmailSent.png'),
              ),

              //Msg
              SizedBox(height: DynamicSize.Faheight(24)),
              Padding(
                padding: EdgeInsets.only(
                    left: DynamicSize.Fawidth(16),
                    right: DynamicSize.Fawidth(16),
                    bottom: DynamicSize.Faheight(32)),
                child: Text(
                  "You will receive an email with intructions on how to reset your password in a few minutes.\n\nNote : Don't forget to check your spam mail box.\n\nThank you :)",
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: DynamicSize.Faheight(16),
                    fontWeight: FontWeight.w400,
                    letterSpacing: DynamicSize.Fawidth(0.5),
                    color: Color(0xFF193669),
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future popUpDialog(BuildContext context, FirebaseAuthMethods provider) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).pop(),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
              child: Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(DynamicSize.Faheight(16))),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: DynamicSize.Fawidth(31),
                            top: DynamicSize.Faheight(16),
                            right: DynamicSize.Fawidth(31)),
                        child: Image.asset(
                            'images/Illustration-forgot-password.png'),
                      ),

                      //Forgot password Text
                      SizedBox(height: DynamicSize.Faheight(24)),
                      Padding(
                        padding: EdgeInsets.only(left: DynamicSize.Fawidth(24)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: Color(0xFF193669),
                              fontFamily: 'DMSans',
                              fontSize: DynamicSize.Faheight(16),
                              fontWeight: FontWeight.w500,
                              letterSpacing: DynamicSize.Fawidth(1),
                            ),
                          ),
                        ),
                      ),

                      //Email Text
                      SizedBox(height: DynamicSize.Faheight(36)),
                      Padding(
                        padding: EdgeInsets.only(left: DynamicSize.Fawidth(24)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: Color(0xFF193669),
                              fontFamily: 'DMSans',
                              fontSize: DynamicSize.Faheight(12),
                              fontWeight: FontWeight.w700,
                              letterSpacing: DynamicSize.Fawidth(1),
                            ),
                          ),
                        ),
                      ),

                      //Email TextField
                      SizedBox(height: DynamicSize.Faheight(9)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: DynamicSize.Fawidth(24)),
                        child: TextField(
                          controller: forgotPassEmailController,
                          decoration: InputDecoration(
                            hintText: 'Email address',
                            hintStyle: TextStyle(
                              color: Color(0xFF636363),
                            ),
                            focusedBorder: new UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF193669)),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),

                      //Button
                      SizedBox(height: DynamicSize.Faheight(24)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: DynamicSize.Fawidth(24)),
                        child: SizedBox(
                          width: double.infinity,
                          height: DynamicSize.Faheight(39),
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                provider
                                    .sendPasswordResetEmail(
                                        forgotPassEmailController.text.trim())
                                    .then((String? msg) {
                                  if (msg == null) {
                                    Navigator.pop(context);
                                    popUpConfirm(context);
                                  } else {
                                    ShowSnackBar(context, msg);
                                  }
                                });
                              });

                              // Navigator.pop(context);
                              // popUpConfirm(context);
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                color: Color(0xFF193669),
                              ),
                              backgroundColor: Color(0xFFF0F2F4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      DynamicSize.Faheight(15))),
                            ),
                            child: Text(
                              'Send me reset password instructions',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: DynamicSize.Faheight(11),
                                letterSpacing: DynamicSize.Fawidth(0.8),
                                color: Color(0xFF193669),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: DynamicSize.Faheight(30)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Grettings
            SizedBox(height: DynamicSize.Faheight(150)),
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
              padding:
                  EdgeInsets.symmetric(horizontal: DynamicSize.Fawidth(19)),
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
                controller: emailController,
                style: TextStyle(
                  fontFamily: 'DMSams',
                  fontSize: DynamicSize.Faheight(14),
                  letterSpacing: DynamicSize.Fawidth(0),
                ),
                decoration: InputDecoration(
                  hintText: "Email address",
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.emailAddress,
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
                controller: passwordController,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  fontFamily: 'DMSams',
                  fontSize: DynamicSize.Faheight(14),
                  letterSpacing: DynamicSize.Fawidth(0),
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
                onTap: () =>
                    popUpDialog(context, context.read<FirebaseAuthMethods>()),
                child: Text(
                  "Forgot Password ?",
                  style: TextStyle(
                    fontFamily: "DMSans",
                    fontSize: DynamicSize.Faheight(15),
                    color: Color(0xFF193669),
                  ),
                ),
              ),
            ),

            //Sign In Button
            SizedBox(height: DynamicSize.Faheight(40)),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: DynamicSize.Fawidth(15)),
              child: SizedBox(
                width: double.infinity,
                height: DynamicSize.Faheight(50),
                child: TextButton(
                  onPressed: LoginUser,
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
                    'SIGN IN',
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

            //Register Button
            SizedBox(height: DynamicSize.Faheight(16)),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: DynamicSize.Fawidth(15)),
              child: SizedBox(
                width: double.infinity,
                height: DynamicSize.Faheight(50),
                child: TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/registerScreen'),
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF193669),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(DynamicSize.Faheight(15)),
                      )
                      // padding: EdgeInsets.symmetric(horizontal: 1),
                      ),
                  child: Text(
                    'REGISTER',
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
            // Row(
            //   children: [
            //     Text("No Account?",style: GoogleFonts.dmSans(
            //       fontSize: 12.0,
            //       color: Color(0xFF2F3F70)
            //     ),),
            //     Text("Sign Up",style: TextStyle(
            //       fontSize:12.0,
            //       fontWeight: FontWeight.w500,
            //       decoration: TextDecoration.underline,
            //       fontFamily: 'dmSams'
            //     ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
