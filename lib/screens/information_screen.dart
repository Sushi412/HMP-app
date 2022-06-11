import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Color inactiveColor=Colors.grey;
Color activeColor=Colors.white;
Color maleCardColor=inactiveColor;
Color femaleCardColor=inactiveColor;
void update(int gender){
  if(gender==1){
    if(maleCardColor==inactiveColor){
      maleCardColor=activeColor;
      femaleCardColor=inactiveColor;
    }
    else
      {
        maleCardColor=inactiveColor;
        femaleCardColor=activeColor;
      }
  }
  if(gender==2){
    if(femaleCardColor==inactiveColor){
      femaleCardColor=activeColor;
      maleCardColor=inactiveColor;
    }
    else
    {
      femaleCardColor=inactiveColor;
      maleCardColor=activeColor;
    }
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
  String _status = 'idle';
  Color _statusColor = Color(0xFF2F3F70);
  double _value = 20;
  String _wstatus = 'idle';
  Color _wstatusColor = Color(0xFF2F3F70);
  double _wvalue = 20;

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 82,left: 42,right: 42,bottom: 42),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Give us some basic information",style:GoogleFonts.dmSans(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 32.0,
                  color: Color(0xFF2F3F70)
                )
              ),),
              SizedBox(height: 5.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding:EdgeInsets.all(15.0),
                        child: GestureDetector(
                            onTap: (){
                              setState(() {
                                update(1);
                              });
                            },
                            child: manWomenCard(icon:Icon(FontAwesomeIcons.person,size: 50.0,), cardColor: femaleCardColor)),
                      ),
                      Text("Male",style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2F3F70)
                          )
                      ),)

                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              update(2);
                            });
                          },
                          child: manWomenCard(icon: Icon(FontAwesomeIcons.personDress,size: 50.0), cardColor: maleCardColor,

                          ),
                        ),
                      ),
                      Text("Female",style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2F3F70)
                          )
                      ),)

                    ],
                  ),

                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Height",style:GoogleFonts.dmSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                          color: Color(0xFF2F3F70)
                      )
                  ),),
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
                  Slider(
                    activeColor: Color(0xFF2F3F70),
                    inactiveColor: Colors.grey,
                    label: _value.round().toString(),
                    min: 0.0,
                    max: 500.0,
                    value: _value,
                    divisions: 500,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                        _status = '${_value.round()}';
                        _statusColor = Color(0xFF2F3F70);
                      });
                    },
                    onChangeStart: (value) {
                      setState(() {
                        _status = 'start';
                        _statusColor = Color(0xFF2F3F70);
                      });
                    },
                    onChangeEnd: (value) {
                      setState(() {
                        _status = '$_status';
                        _statusColor = Color(0xFF2F3F70);
                      });
                    },
                  ),
                  Text(
                    '$_status cm',
                    style: TextStyle(color: _statusColor,fontWeight: FontWeight.w500,),
                  ),
                  SizedBox(height: 10.0,),
                  Text("Weight",style:GoogleFonts.dmSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                          color: Color(0xFF2F3F70)
                      )
                  ),),
                  Slider(
                    activeColor: Color(0xFF2F3F70),
                    inactiveColor: Colors.grey,
                    label: _wvalue.round().toString(),
                    min: 0.0,
                    max: 500.0,
                    value: _wvalue,
                    divisions: 500,
                    onChanged: (value) {
                      setState(() {
                        _wvalue = value;
                        _wstatus = '${_wvalue.round()}';
                        _wstatusColor = Color(0xFF2F3F70);
                      });
                    },
                    onChangeStart: (value) {
                      setState(() {
                        _wstatus = 'start';
                        _wstatusColor = Color(0xFF2F3F70);
                      });
                    },
                    onChangeEnd: (value) {
                      setState(() {
                        _wstatus = '$_wstatus';
                        _wstatusColor = Color(0xFF2F3F70);
                      });
                    },
                  ),
                  Text(
                    '$_wstatus kg',
                    style: TextStyle(color: _wstatusColor,fontWeight: FontWeight.w500,),
                  ),
                  SizedBox(height: 10.0,),
                  Text("Age",style:GoogleFonts.dmSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                          color: Color(0xFF2F3F70)
                      )
                  ),),
                  TextField(
                    keyboardType: TextInputType.number,
                    cursorColor: Color(0xFF2F3F70),
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,

                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:Color(0xFF2F3F70) ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF2F3F70)),
                      ),
                      hintText: ("Enter your Age"),
                      fillColor: Color(0xFF2F3F70),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(width: 2.0, color: Color(0xFF2F3F70)),
                          ),
                        onPressed: () {
                          debugPrint('Received click');
                        },
                        child: const Text("SAVE",style:TextStyle(
                          color: Color(0xFF2F3F70),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500
                        ))
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
    manWomenCard({required this.icon,required this.cardColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius:BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(width: 5.0,color: Color(0xFF2F3F70))
      ),
      height: 132.0,
      width: 132.0,
      child:icon

    );
  }
}