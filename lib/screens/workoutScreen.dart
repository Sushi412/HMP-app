import 'package:flutter/material.dart';
import 'package:heath_matthews_physio/DynamicSize/size.dart';

import 'NavBar.dart';

class workoutScreen1 extends StatefulWidget {
  const workoutScreen1({Key? key}) : super(key: key);

  @override
  _workoutScreen1State createState() => _workoutScreen1State();
}

class _workoutScreen1State extends State<workoutScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF2F3F70)),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      drawer: NavBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(DynamicSize.Aaheight(28)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Core & Back\nfitness program',
                    style: TextStyle(
                        fontSize: DynamicSize.Aaheight(24),
                        color: Color(0xFF1F2F70),
                        fontFamily: 'DMSans',
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: DynamicSize.Aaheight(12)),
                RichText(
                  text: TextSpan(
                    text: '|  45 min • 12 exercise',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Color(0xFF132B35),
                      fontFamily: 'DMSans',
                    ),
                  ),
                ),
                SizedBox(height: DynamicSize.Aaheight(38)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Tuesday, June 14 2022',
                        style: TextStyle(
                            fontSize: DynamicSize.Aaheight(17),
                            color: Colors.black,
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Day1',
                        style: TextStyle(
                            fontSize: DynamicSize.Aaheight(17),
                            color: Color(0xFF1F2F70),
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: DynamicSize.Aaheight(24)),
                RichText(
                  text: TextSpan(
                    text:
                        'Congratulations you have just taken the first step to back fitness and core strength you never knew you had! ',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF193669),
                      fontFamily: 'DMSans',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              GestureDetector(
                child: buildRoundedCard(),
                onTap: () {
                  Navigator.pushNamed(context, '/exercise');
                },
              ),
              buildRoundedCards(),
              buildRoundedCardes(),
            ],
          )
        ],
      ),
    );
  }
}

Widget buildRoundedCard() => Card(
    shadowColor: Colors.grey[400],
    elevation: 2,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
    child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.fromLTRB(26.0, 10.0, 26.0, 34.0),
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                Tab(icon: new Image.asset("images/Vector.png")),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                  child: Container(
                      child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Foam Rolling',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF193669),
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )),
                ),
              ]),
            ])));

Widget buildRoundedCards() => Card(
    shadowColor: Colors.grey[400],
    elevation: 2,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
    child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.fromLTRB(26.0, 10.0, 26.0, 34.0),
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                  // Image.asset('images/Vector.png', height: 10.0,width: 10.0,),
                  Tab(icon: new Image.asset("images/Vector.png")),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                    child: Container(
                        child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Mobility',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF193669),
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )),
                  ),
                ]),
              ),
            ])));

Widget buildRoundedCardes() => Card(
    shadowColor: Colors.grey[400],
    elevation: 2,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
    child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.fromLTRB(26.0, 10.0, 26.0, 34.0),
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                  // Image.asset('images/Vector.png', height: 10.0,width: 10.0,),
                  Tab(icon: new Image.asset("images/Vectorflake.png")),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                    child: Container(
                        child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Flexibility',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF193669),
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )),
                  ),
                ]),
              ),
            ])));
