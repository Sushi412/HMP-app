import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heath_matthews_physio/DynamicSize/size.dart';

Color _inactiveColor = Colors.white;
Color _activeColor = Color(0xFFF0F2F4);
Color _maleCardColor = _inactiveColor;
Color _femaleCardColor = _inactiveColor;
bool _visibiltyM = false;
bool _visibiltyF = false;

void _update(int gender) {
  if (gender == 1) {
    _maleCardColor = _activeColor;
    _femaleCardColor = _inactiveColor;
    _visibiltyM = true;
    _visibiltyF = false;
    print('Male Selected');
  }
  if (gender == 2) {
    _femaleCardColor = _activeColor;
    _maleCardColor = _inactiveColor;
    _visibiltyM = false;
    _visibiltyF = true;
    print('Female Selected!');
  }
}

double currentSliderValue = 20;

class informationScreen extends StatefulWidget {
  const informationScreen({Key? key}) : super(key: key);

  @override
  _informationScreenState createState() => _informationScreenState();
}

class _informationScreenState extends State<informationScreen> {
  // double _currentSliderValue = 20;
  String _status = '50';
  Color _statusColor = Color(0xFF2F3F70);
  double _value = 50;
  final double minH = 50;
  final double maxH = 500;
  String _wstatus = '20';
  Color _wstatusColor = Color(0xFF2F3F70);
  double _wvalue = 20;
  final double minW = 20;
  final double maxW = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: DynamicSize.Aaheight(70),
              left: DynamicSize.Aawidth(42),
              right: DynamicSize.Aawidth(42),
              bottom: DynamicSize.Aaheight(42)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Greetings Text
              Text(
                "Give us some basic information",
                style: GoogleFonts.dmSans(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: DynamicSize.Aaheight(32.0),
                    color: Color(0xFF2F3F70),
                  ),
                ),
              ),

              //Gender Selection Row
              SizedBox(height: DynamicSize.Aaheight(5.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Male Card
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(DynamicSize.Aaheight(15.0)),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _update(1);
                            });
                          },
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              manWomenCard(
                                icon: Icon(
                                  Icons.man_rounded,
                                  color: Color(0xFF2F3F70),
                                  size: DynamicSize.Aaheight(50),
                                ),
                                cardColor: _maleCardColor,
                              ),
                              Visibility(
                                visible: _visibiltyM,
                                child: Positioned(
                                  top: DynamicSize.Aawidth(8),
                                  right: DynamicSize.Aawidth(10),
                                  child: Icon(
                                    Icons.check_circle_rounded,
                                    color: Color(0xFF2F3F70),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "Male",
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                            fontSize: DynamicSize.Aaheight(14),
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2F3F70),
                          ),
                        ),
                      )
                    ],
                  ),

                  //Female Card
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(DynamicSize.Aaheight(15.0)),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _update(2);
                            });
                          },
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              manWomenCard(
                                icon: Icon(
                                  Icons.woman_rounded,
                                  color: Color(0xFF2F3F70),
                                  size: DynamicSize.Aaheight(50),
                                ),
                                cardColor: _femaleCardColor,
                              ),
                              Visibility(
                                visible: _visibiltyF,
                                child: Positioned(
                                  top: DynamicSize.Aawidth(8),
                                  right: DynamicSize.Aawidth(10),
                                  child: Icon(
                                    Icons.check_circle_rounded,
                                    color: Color(0xFF2F3F70),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "Female",
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                            fontSize: DynamicSize.Aaheight(14),
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2F3F70),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),

              //Below Card Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Height Slider Section
                  SizedBox(height: DynamicSize.Aaheight(10.0)),
                  Text(
                    "Height",
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: DynamicSize.Aaheight(20.0),
                        color: Color(0xFF2F3F70),
                      ),
                    ),
                  ),
                  // Slider(
                  //   value: _currentSliderValue,
                  //   max: 500,
                  //   divisions: 500,
                  //   activeColor: Color(0xFF2F3F70),
                  //   inactiveColor: Colors.grey,
                  //   label: _currentSliderValue.round().toString(),
                  //   onChanged: (double value) {
                  //     setState(() {
                  //       _currentSliderValue = value;
                  //     });
                  //   },
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.man_rounded,
                          color: Color(0xFF2F3F70),
                          size: DynamicSize.Aaheight(30)),
                      Icon(Icons.man_rounded,
                          color: Color(0xFF2F3F70),
                          size: DynamicSize.Aaheight(50)),
                    ],
                  ),
                  Slider(
                    activeColor: Color(0xFF2F3F70),
                    inactiveColor: Color(0x26061428),
                    label: _value.round().toString(),
                    min: minH,
                    max: maxH,
                    value: _value,
                    divisions: 500,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                        _status = '${_value.round()}';
                        _statusColor = Color(0xFF2F3F70);
                      });
                    },
                    // onChangeStart: (value) {
                    //   setState(() {
                    //     _status = 'start';
                    //     _statusColor = Color(0xFF2F3F70);
                    //   });
                    // },
                    // onChangeEnd: (value) {
                    //   setState(() {
                    //     _status = '$_status';
                    //     _statusColor = Color(0xFF2F3F70);
                    //   });
                    // },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: DynamicSize.Aawidth(15)),
                    child: Text(
                      '$_status cm',
                      style: TextStyle(
                        color: _statusColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  //Weight Slider Section
                  SizedBox(height: DynamicSize.Aawidth(20.0)),
                  Text(
                    "Weight",
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                        color: Color(0xFF2F3F70),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        top: DynamicSize.Aaheight(10),
                        right: DynamicSize.Aawidth(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.man_rounded,
                            color: Color(0xFF2F3F70),
                            size: DynamicSize.Aaheight(40)),
                        // Image.asset(
                        //   'assets/Icons/man.png',
                        //   color: Color(0xFF2F3F70),
                        // ),
                        SvgPicture.asset(
                          'assets/Icons/man.svg',
                          height: DynamicSize.Aaheight(40),
                          color: Color(0xFF2F3F70),
                        ),
                      ],
                    ),
                  ),
                  Slider(
                    activeColor: Color(0xFF2F3F70),
                    inactiveColor: Color(0x26061428),
                    label: _wvalue.round().toString(),
                    min: minW,
                    max: maxW,
                    value: _wvalue,
                    // divisions: 180,
                    onChanged: (value) {
                      setState(() {
                        _wvalue = value;
                        _wstatus = '${_wvalue.round()}';
                        _wstatusColor = Color(0xFF2F3F70);
                      });
                    },
                    // onChangeStart: (value) {
                    //   setState(() {
                    //     _wstatus = 'start';
                    //     _wstatusColor = Color(0xFF2F3F70);
                    //   });
                    // },
                    // onChangeEnd: (value) {
                    //   setState(() {
                    //     _wstatus = '$_wstatus';
                    //     _wstatusColor = Color(0xFF2F3F70);
                    //   });
                    // },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: DynamicSize.Aawidth(15)),
                    child: Text(
                      '$_wstatus kg',
                      style: TextStyle(
                        color: _wstatusColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  //Age Section
                  SizedBox(height: DynamicSize.Aaheight(20.0)),
                  Text(
                    "Age",
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: DynamicSize.Aaheight(20.0),
                          color: Color(0xFF2F3F70)),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    cursorColor: Color(0xFF2F3F70),
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                      fontSize: DynamicSize.Aaheight(20.0),
                    ),
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: DynamicSize.Aaheight(20.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF2F3F70)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF2F3F70)),
                      ),
                      hintText: ("Enter your Age"),
                      fillColor: Color(0xFF2F3F70),
                    ),
                  ),

                  //Save Button
                  SizedBox(height: DynamicSize.Aaheight(30)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xFFF0F2F4),
                            side: BorderSide(
                              width: DynamicSize.Aawidth(2.0),
                              color: Color(0xFF193669),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  DynamicSize.Aaheight(15)),
                            )),
                        onPressed: () {
                          debugPrint('Received click');
                          Navigator.pushNamed(context, '/workout-page');
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: DynamicSize.Aaheight(13)),
                          child: Text(
                            "SAVE",
                            style: GoogleFonts.dmSans(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: DynamicSize.Aaheight(16.0),
                                color: Color(0xFF2F3F70),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class manWomenCard extends StatelessWidget {
  Icon icon;
  Color cardColor;
  manWomenCard({required this.icon, required this.cardColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius:
              BorderRadius.all(Radius.circular(DynamicSize.Aaheight(20.0))),
          border: Border.all(
              width: DynamicSize.Aawidth(1.0), color: Color(0x26061428))),
      height: DynamicSize.Aaheight(132),
      width: DynamicSize.Aawidth(132),
      child: icon,
    );
  }
}
