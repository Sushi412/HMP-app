import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../DynamicSize/size.dart';
import 'NavBar.dart';

class exercise extends StatefulWidget {
  const exercise({Key? key}) : super(key: key);

  @override
  _exerciseState createState() => _exerciseState();
}

class _exerciseState extends State<exercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF2F3F70)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(DynamicSize.Aaheight(24.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Foam Rolling-Lower Back",
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w500,
                          fontSize: DynamicSize.Aaheight(24),
                          color: Color(0xFF2F3F70)),
                    ),
                    SizedBox(
                      height: DynamicSize.Aaheight(16),
                    ),
                    Text(
                      "Start by loosening tight muscles in your back before you start your exercises.Just 1 minute of rolling will be enough.",
                      style: GoogleFonts.dmSans(
                          fontSize: DynamicSize.Aaheight(15),
                          color: Color(0xFF2F3F70)),
                    ),
                    SizedBox(
                      height: DynamicSize.Aaheight(32),
                    ),
                    Container(
                      height: DynamicSize.Aaheight(184),
                      width: DynamicSize.Aawidth(386),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Image.asset("images/foam_rolling.png")],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    height: DynamicSize.Aaheight(433),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(DynamicSize.Aaheight(38)),
                        topRight: Radius.circular(DynamicSize.Aaheight(38)),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: DynamicSize.Aaheight(42),
                          left: DynamicSize.Aaheight(42),
                          right: DynamicSize.Aaheight(42)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Set-1',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'DMSans',
                              ),
                            ),
                            SizedBox(
                              height: DynamicSize.Aaheight(16),
                            ),
                            Text(
                              'Time-00:01:00',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'DMSans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: DynamicSize.Aaheight(16),
                            ),
                            Text(
                              'Side/Bilateral',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'DMSans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: DynamicSize.Aaheight(16),
                            ),
                            TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: '00-01-00',
                              ),
                            ),
                            SizedBox(
                              height: DynamicSize.Aaheight(16),
                            ),
                            Text(
                              'Rest Time - 00:00:00',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'DMSans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: DynamicSize.Aaheight(16),
                            ),
                            Text(
                              'Add Note to Exercise (Optional)',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontFamily: 'DMSans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              height: DynamicSize.Aaheight(117),
                              color: Colors.white,
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: DynamicSize.Aaheight(16),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: DynamicSize.Aaheight(39),
                              child: TextButton(
                                onPressed: () {
                                  // Navigator.pushNamed(context, '/informationScreen');
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFF193669),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          DynamicSize.Aaheight(15)),
                                    )
                                    // padding: EdgeInsets.symmetric(horizontal: 1),
                                    ),
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: DynamicSize.Aaheight(18),
                                    letterSpacing: DynamicSize.Aawidth(0.8),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
