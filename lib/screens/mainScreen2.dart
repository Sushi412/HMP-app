import 'package:flutter/material.dart';
import 'package:heath_matthews_physio/DynamicSize/size.dart';

class mainScreen2 extends StatefulWidget {
  const mainScreen2({Key? key}) : super(key: key);

  @override
  _mainScreen2State createState() => _mainScreen2State();
}

class _mainScreen2State extends State<mainScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
                left: DynamicSize.Azwidth(20.0),
                top: 0.0,
                right: DynamicSize.Azwidth(20.0),
                bottom: DynamicSize.Azheight(20.0)),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Image(
                  image: AssetImage('images/YOGA LADY ILLUSTRATION.png'),
                  height: DynamicSize.Azheight(400),
                ),
                new Container(
                  padding: EdgeInsets.fromLTRB(
                      DynamicSize.Azwidth(10.0),
                      DynamicSize.Azheight(20.0),
                      DynamicSize.Azwidth(10.0),
                      DynamicSize.Azheight(35.0)),
                  child: new Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Welcome to\nyour personal\nphysiotherapist',
                        style: TextStyle(
                          fontSize: DynamicSize.Azheight(45.0),
                          color: Color(0xFF1F2F70),
                          fontFamily: 'DMSans',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0.0, 0.0, 0.0, DynamicSize.Azheight(25.0)),
                  child: SizedBox(
                    height: DynamicSize.Azheight(50),
                    width: DynamicSize.Azwidth(325),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/loginScreen');
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF1F2F70),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  DynamicSize.Azheight(15)))),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: DynamicSize.Azheight(15.0),
                            fontFamily: 'DMSans',
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: DynamicSize.Azwidth(325),
                  height: DynamicSize.Azheight(50),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registerScreen');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(DynamicSize.Azheight(15)),
                        side: BorderSide(color: Color(0xFF1F2F70)),
                      ),
                    ),
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: DynamicSize.Azheight(15),
                        fontFamily: 'DMSans',
                        color: Color(0xFF1F2F70),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),


//     return  Scaffold(
//         backgroundColor: Colors.white,


        //                 Padding(
        //                   padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
        //                   child: SizedBox(
        //                      height: 50 ,
        //                     width: 325,
        //                     child: ElevatedButton(
        //                       onPressed: () {
        //                         Navigator.pushNamed(context, '/loginScreen');
        //                       },
        //                       style: ElevatedButton.styleFrom(
        //                           primary: Color(0xFF1F2F70),
        //                           shape: RoundedRectangleBorder(
        //                               borderRadius: BorderRadius.circular(15)
        //                           )
        //                       ),
        //                       child: Text('LOGIN', style: TextStyle(fontSize: 15.0, fontFamily: 'DMSans',color: Colors.white),
        //                       ),),
        //                   ),
        //                 ),
        //
        //                 SizedBox(
        //                   width: 325,
        //                   height: 50,
        //                   child: ElevatedButton(
        //                       onPressed: () {
        //                         Navigator.pushNamed(context, '/reg_name_and_dp');
        //                       },
        //                       style: ElevatedButton.styleFrom(
        //                           primary: Colors.white,
        //                           shape: RoundedRectangleBorder(
        //                               borderRadius: BorderRadius.circular(15),
        //                               side: BorderSide(color: Color(0xFF1F2F70))
        //                           )
        //                       ),
        //                       child: Text('REGISTER', style: TextStyle(fontSize: 15.0, fontFamily: 'DMSans',color: Color(0xFF1F2F70)),
        //                       )                       ),
        //                 ),
        //               ]),
        //         )
        //     )
        // )

//         body: Container(
//             child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 20.0, top: 0.0, right: 20.0, bottom: 20.0),
//                   child: Column(
//                     // crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: <Widget>[
//                         new Image(
//                           image: AssetImage('images/YOGA LADY ILLUSTRATION.png'),
//                           height: 400,
//                         ),

//                         new Container(
//                             padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 35.0),
//                             child: new Center(
//                               child: RichText(
//                                 text: TextSpan(
//                                   text: 'Welcome to\nyour personal\nphysiotherapist',
//                                   style: TextStyle(fontSize: 45.0, color: Color(0xFF1F2F70), fontFamily: 'DMSans',),
//                                 ),
//                               ),
//                             )
//                         ),

//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
//                           child: SizedBox(
//                             height: 50 ,
//                             width: 325,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 Navigator.pushNamed(context, '/loginScreen');
//                               },
//                               style: ElevatedButton.styleFrom(
//                                   primary: Color(0xFF1F2F70),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15)
//                                   )
//                               ),
//                               child: Text('LOGIN', style: TextStyle(fontSize: 15.0, fontFamily: 'DMSans',color: Colors.white),
//                               ),),
//                           ),
//                         ),

//                         SizedBox(
//                           width: 325,
//                           height: 50,
//                           child: ElevatedButton(
//                               onPressed: () {
//                                 Navigator.pushNamed(context, '/informationScreen');
//                               },
//                               style: ElevatedButton.styleFrom(
//                                   primary: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15),
//                                       side: BorderSide(color: Color(0xFF1F2F70))
//                                   )
//                               ),
//                               child: Text('REGISTER', style: TextStyle(fontSize: 15.0, fontFamily: 'DMSans',color: Color(0xFF1F2F70)),
//                               )                       ),
//                         ),
//                       ]),
//                 )
//             )
//         )




    );
  }
}
