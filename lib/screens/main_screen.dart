import 'package:flutter/material.dart';
class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.tealAccent,
        body: Text("main screen"),
      ),
    );
  }
}