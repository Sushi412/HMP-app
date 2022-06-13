import 'package:flutter/material.dart';
import 'YogaLady_Login_Register.dart';
void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,

        body: Container(
            child: Center(
                child: Column(
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/YOGA LADY ILLUSTRATION.png'),
                        alignment: Alignment.topCenter,
                        height: 400.0,
                      ),
                      new Container(
                          padding: EdgeInsets.all(30),
                          child: new Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'Welcome to\nyour personal\nphysiotherapist',
                                style: TextStyle(fontSize: 45.0, color: Color(0xFF1F2F70), fontFamily: 'DMSans',),
                              ),
                            ),
                          )
                      ),
                    ])
            )
        ),

        floatingActionButton: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 30.0),
          child: FloatingActionButton(

          backgroundColor: Color(0xFF1F2F70),
            onPressed: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (_)=> new TextImage()),);
            },
            child: const Icon(Icons.arrow_forward,size: 37.0,),
    ),
        )
    );
  }
}
