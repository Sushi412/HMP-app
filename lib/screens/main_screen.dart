import 'package:flutter/material.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  get floatingActionButton => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Image.asset('images/YOGA LADY ILLUSTRATION.png'),
                  new Container(
                    padding: EdgeInsets.all(30),
                    child: new Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Welcome to\nyour personal\nphysiotherapist',
                          style: TextStyle(
                            fontSize: 34.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F2F70),
                            fontFamily: 'DMSans',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 30.0),
        child: FloatingActionButton(
          backgroundColor: Color(0xFF1F2F70),
          onPressed: () {
            Navigator.pushNamed(context, '/mainScreen2');
          },
          child: const Icon(
            Icons.arrow_forward,
            size: 37.0,
          ),
        ),
      ),
    );
  }
}
