import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:grouped_list/grouped_list.dart';
// import 'package:folding_cell/folding_cell.dart';
import 'package:get/get.dart';
import 'package:heath_matthews_physio/NavBar.dart';
import 'package:heath_matthews_physio/fireicon_icons.dart';

class workoutScreen extends StatefulWidget {
  const workoutScreen({Key? key}) : super(key: key);

  @override
  State<workoutScreen> createState() => _workoutScreenState();
}

class _workoutScreenState extends State<workoutScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF2F3F70)),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      drawer: NavBar(),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
          children:<Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(28.0, 24.0, 178.0, 15.0),
              child: Container(
                child : Align(
                  alignment: Alignment.centerLeft,
                    child:RichText(
                    text: TextSpan(
                    text: 'Core & Back\nfitness program',
                      style: TextStyle(fontSize: 24.0, color: Color(0xFF1F2F70), fontFamily: 'DMSans',),
                  ),
                )
              ), ),),
            Padding(
              padding: const EdgeInsets.fromLTRB(28.0, 0.0, 225.0, 38.0),
              child: Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        text: '|  45 min • 12 exercise',
                        style: TextStyle(fontSize: 13.0, color: Color(0xFF132B35), fontFamily: 'DMSans',),
                          ),
                        ),
                      )
                  ),
            ),
            Padding(
            padding: const EdgeInsets.fromLTRB(75.0, 0.0, 75.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.arrow_back_ios),
                ),

                  Container(
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'Tuesday, June 14 2022',
                            style: TextStyle(fontSize: 17.0, color: Colors.black, fontFamily: 'DMSans', fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                ),

                IconButton(
                  onPressed: (){},
                    icon: Icon(Icons.arrow_forward_ios),
                ),
                ],
                ),
          ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 24.0),
              child: Container(
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Day1',
                      style: TextStyle(fontSize: 17.0, color: Color(0xFF1F2F70), fontFamily: 'DMSans', fontWeight: FontWeight.w500),
                    ),
                  ),
                )
            ),
          ),

            Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 50.0),
              child: Container(
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Congratulations you have just taken the first step to\nback fitness and core strength you never knew you\nhad! ',
                      style: TextStyle(fontSize: 14.0, color: Color(0xFF193669),fontFamily: 'DMSans',),
                  ),
                )
            ),
            ),
          ),


                buildRoundedCard(),
                buildRoundedCards(),
                buildRoundedCardes(),
          ],)
    ),
      )

    );
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
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Row(
             mainAxisSize: MainAxisSize.max,
             children: <Widget>[
              IconButton(
              onPressed: (){},
               icon: Icon(Icons.menu, size: 30,color: Colors.grey[300],),
            ),
               Tab(icon: new Image.asset("images/Vector.png")),
              Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                child: Container(
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Foam Rolling',
                        style: TextStyle(fontSize: 16.0, color: Color(0xFF193669), fontFamily: 'DMSans', fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
              ),
            ),
      ]),
    ),
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
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.menu, size: 30,color: Colors.grey[300],),
                        ),
                        // Image.asset('images/Vector.png', height: 10.0,width: 10.0,),
                        Tab(icon: new Image.asset("images/Vector.png")),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                          child: Container(
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Mobility',
                                    style: TextStyle(fontSize: 16.0, color: Color(0xFF193669), fontFamily: 'DMSans', fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                          ),
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
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.menu, size: 30,color: Colors.grey[300],),
                        ),
                        // Image.asset('images/Vector.png', height: 10.0,width: 10.0,),
                        Tab(icon: new Image.asset("images/Vectorflake.png")),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                          child: Container(
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Flexibility',
                                    style: TextStyle(fontSize: 16.0, color: Color(0xFF193669), fontFamily: 'DMSans', fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                          ),
                        ),
                      ]),
                ),
              ])));
}






