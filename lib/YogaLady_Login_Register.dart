import 'package:flutter/material.dart';

class TextImage extends StatefulWidget{
  @override
  TextImageState createState() => new TextImageState();

}

class TextImageState extends State<TextImage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
           new Image(
              image: AssetImage('assets/YOGA LADY ILLUSTRATION.png'),
             height: 400,
          ),

              new Container(
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 35.0),
                child: new Center(
                child: RichText(
                text: TextSpan(
                text: 'Welcome to\nyour personal\nphysiotherapist',
                style: TextStyle(fontSize: 45.0, color: Color(0xFF1F2F70), fontFamily: 'DMSans',),
                    ),
                  ),
                )
              ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                      child: SizedBox(

                        width: 325,
                        height: 50,
                        child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF1F2F70),
                        ),
                          child: Text('LOGIN', style: TextStyle(fontSize: 15.0, fontFamily: 'DMSans',color: Colors.white),
                        ),)
                      ),
                    ),

                      SizedBox(
                          width: 325,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                            child: Text('REGISTER', style: TextStyle(fontSize: 15.0, fontFamily: 'DMSans',color: Color(0xFF1F2F70)),
                            ),)
                      ),
                ])
              )
          )

        );
  }
  }