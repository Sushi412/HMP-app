import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../DynamicSize/size.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
//To Control PassWord Visibiltiy
  late bool _visibility;
  final emailController= TextEditingController();
  final passwordController=TextEditingController();

  Future popUpVerificationMsg(BuildContext context) {
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
                  "A confirmation email has been sent to your email.\n\nPlease check your email for the same.\n\nNote : Don’t forget to check your spam mail box.",
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

  @override
  void initState() {
    super.initState();
    _visibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: DynamicSize.Fawidth(48),
                top: DynamicSize.Faheight(44),
                right: DynamicSize.Fawidth(48)),
            child: Container(
              height: DynamicSize.Faheight(294),
              child: Image(
                image: AssetImage('images/GirlUsingTheFingerprint.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.95,
            minChildSize: 0.95,
            builder: (context, controller) {
              return SingleChildScrollView(
                reverse: true,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(DynamicSize.Faheight(38)),
                      topRight: Radius.circular(DynamicSize.Faheight(38)),
                    ),
                  ),
                  child: Column(
                    children: [
                      //Register Text
                      SizedBox(height: DynamicSize.Faheight(30)),
                      Text(
                        'Register',
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: DynamicSize.Faheight(22),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF193669),
                        ),
                      ),

                      //Let's get you registered with us Text
                      SizedBox(height: DynamicSize.Faheight(30)),
                      Padding(
                        padding: EdgeInsets.only(left: DynamicSize.Fawidth(29)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Let's get you registered with us :)",
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: DynamicSize.Faheight(16),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF193669),
                            ),
                          ),
                        ),
                      ),

                      //Email TextField
                      SizedBox(height: DynamicSize.Faheight(12)),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: DynamicSize.Fawidth(19)),
                        margin: EdgeInsets.symmetric(
                            horizontal: DynamicSize.Fawidth(29)),
                        alignment: Alignment.center,
                        height: DynamicSize.Faheight(50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(DynamicSize.Faheight(15)),
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
                            fontSize: DynamicSize.Faheight(15),
                            letterSpacing: DynamicSize.Fawidth(0),
                          ),
                          decoration: InputDecoration(
                            hintText: "Email address",
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),

                      //Create Password TextField
                      SizedBox(height: DynamicSize.Faheight(12)),
                      Container(
                        padding: EdgeInsets.only(
                            left: DynamicSize.Fawidth(19),
                            right: DynamicSize.Fawidth(8)),
                        margin: EdgeInsets.symmetric(
                            horizontal: DynamicSize.Fawidth(29)),
                        alignment: Alignment.center,
                        height: DynamicSize.Faheight(50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(DynamicSize.Faheight(15)),
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
                          style: TextStyle(
                            fontFamily: 'DMSams',
                            fontSize: DynamicSize.Faheight(14),
                            letterSpacing: DynamicSize.Fawidth(0),
                          ),
                          decoration: InputDecoration(
                            hintText: "Create Password",
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              splashRadius: 1,
                              splashColor: Colors.transparent,
                              icon: Icon(_visibility
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              color: Color(
                                  _visibility ? (0xFF193669) : (0xFF666161)),
                              onPressed: () =>
                                  setState(() => _visibility = !_visibility),
                            ),
                          ),
                          obscureText: !_visibility,
                        ),
                      ),

                      //Confirm Password TextField
                      SizedBox(height: DynamicSize.Faheight(12)),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: DynamicSize.Fawidth(19)),
                        margin: EdgeInsets.symmetric(
                            horizontal: DynamicSize.Fawidth(29)),
                        alignment: Alignment.center,
                        height: DynamicSize.Faheight(50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(DynamicSize.Faheight(14)),
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
                            fontSize: DynamicSize.Faheight(14),
                            letterSpacing: DynamicSize.Fawidth(0),
                          ),
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            border: InputBorder.none,
                          ),
                          obscureText: true,
                        ),
                      ),

                      //Register Button
                      SizedBox(height: DynamicSize.Faheight(22)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: DynamicSize.Fawidth(29)),
                        child: SizedBox(
                          width: double.infinity,
                          height: DynamicSize.Faheight(50),
                          child: TextButton(
                            onPressed: (){
                              signUp().then((_){
                                Navigator.pushNamed(context, '/adminScreen');
                              });
                            },
                                // () => popUpVerificationMsg(context),
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF193669),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      DynamicSize.Faheight(15)),
                                )
                                // padding: EdgeInsets.symmetric(horizontal: 1),
                                ),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: DynamicSize.Faheight(18),
                                letterSpacing: DynamicSize.Fawidth(0.8),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //Sign In Button
                      SizedBox(height: DynamicSize.Faheight(12)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: DynamicSize.Fawidth(29)),
                        child: SizedBox(
                          width: double.infinity,
                          height: DynamicSize.Faheight(50),
                          child: TextButton(
                            onPressed: () => Navigator.pop(context),
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF193669),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      DynamicSize.Faheight(15)),
                                )
                                // padding: EdgeInsets.symmetric(horizontal: 1),
                                ),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: DynamicSize.Faheight(18),
                                letterSpacing: DynamicSize.Fawidth(0.8),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future signUp()async {
    //final isValid=formKey.currentState!.validate();
    //if (!isValid) return;
    // showDialog(context: context, builder: (context)=>Center(
    //   child: CircularProgressIndicator(),
    // ));
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    }
    on FirebaseAuthException catch(e){
      print(e);
      //print(Errors.show(e.code));
      // Utils.showSnackBar(e.message);
    }
   // navigatorKey.currentState!.popUntil((route)=>route.isFirst);
  }
}
