import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_progress_indicator/widget/gradient_progress_indicator_widget.dart';
import 'package:heath_matthews_physio/DynamicSize/size.dart';
import 'package:heath_matthews_physio/screens/NavBar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class workoutScreen extends StatefulWidget {
  const workoutScreen({Key? key}) : super(key: key);

  @override
  State<workoutScreen> createState() => _workoutScreenState();
}

class _day {
  String programName; //Got
  int time; //Got
  int no_of_exercises; //Got
  String msg; //Got
  String date; //Got
  int day; //Got
  List<List<Object>> sections;
  List<List<dynamic>> exercises;
  _day(
      {required this.programName,
      required this.time,
      required this.no_of_exercises,
      required this.date,
      required this.day,
      required this.msg,
      required this.sections,
      required this.exercises});
}

class _workoutScreenState extends State<workoutScreen> {
  //Get Programs Details
  Future<_day> _getProgramDay(String programId, String myProgramId) async {
    var programDoc =
        FirebaseFirestore.instance.collection('programs').doc(programId);
    var program = await programDoc.get();

    List<String> title = program.data()!['name'].toString().split(" ");
    //programName
    String programName = title.sublist(0, title.length ~/ 2).join(' ') +
        "\n" +
        title.sublist(title.length ~/ 2).join(' ');

    final firebaseUser = Provider.of<User?>(context, listen: false);
    var myProgram = await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser!.uid)
        .collection('myprograms')
        .doc(myProgramId)
        .get();

    var startDay = myProgram.data()!['startDay'];
    var startDate =
        DateFormat('dd-MM-yyyy').parse(myProgram.data()!['startDate']);

    //date
    var currentDate = DateFormat('yyyy-MM-dd').parse(DateTime.now().toString());
    //Day
    var daysDifference = currentDate.difference(startDate).inDays + 1;

    var day = ((daysDifference - 1) + startDay).toString();

    var dayDoc = await programDoc.collection('days').doc(day).get();
    //time
    var time = dayDoc.data()!['time'];

    //no_of_exercises
    var total_exercises = dayDoc.data()!['no_of_exercises'];
    //msg
    var msg = dayDoc.data()!['msg'];

    var sections = await programDoc
        .collection('days')
        .doc(day)
        .collection('sections')
        .get();

    //Section List
    List<List<Object>> sectionslist = sections.docs
        .map((doc) =>
            <Object>[doc.data()["sectionName"], doc.data()["warm"] ? 1 : 0])
        .toList();
    var exerciseRef = FirebaseFirestore.instance.collection('exrecises');
    //Exercise List
    List<List<dynamic>> exercises = [];
    for (int i = 1; i <= sectionslist.length; i++) {
      var exerciseDoc = await programDoc
          .collection('days')
          .doc(day)
          .collection('sections')
          .doc(i.toString())
          .collection('exercises')
          .get();

      exercises.add(await Future.wait(List.from(exerciseDoc.docs.map(
          (document) async => await exerciseRef
              .doc(document['exid'])
              .get()
              .then((doc) => doc['name'])))));
    }

    _day detail = new _day(
        programName: programName,
        time: time,
        no_of_exercises: total_exercises,
        date: DateFormat('EEEE, MMMM dd yyyy').format(DateTime.now()),
        day: daysDifference,
        msg: msg,
        sections: sectionslist,
        exercises: exercises);
    return detail;
  }

  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF2F3F70)),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      drawer: NavBar(),
      body: FutureBuilder<_day>(
        future: _getProgramDay(
            routeData['adminProgramId'], routeData['myProgramId']),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                //Program Name
                Padding(
                  padding: EdgeInsets.only(left: DynamicSize.Azwidth(28)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        text: snapshot.data!.programName,
                        // text: 'Core & Back\nfitness program',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Color(0xFF1F2F70),
                          fontFamily: 'DMSans',
                        ),
                      ),
                    ),
                  ),
                ),

                //Time and No.of exercises
                SizedBox(height: DynamicSize.Azheight(12)),
                Padding(
                  padding: EdgeInsets.only(left: DynamicSize.Azwidth(28)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '|',
                            style: TextStyle(
                              fontSize: DynamicSize.Azheight(18.0),
                              color: Color(0xFF132B35),
                              fontFamily: 'DMSans',
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text:
                                '  ${snapshot.data!.time} min • ${snapshot.data!.no_of_exercises} exercises',
                            // text: '  45 min • 12 exercise',
                            style: TextStyle(
                              fontSize: DynamicSize.Azheight(13.0),
                              color: Color(0xFF132B35),
                              fontFamily: 'DMSans',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Date
                SizedBox(height: DynamicSize.Azheight(39.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(Icons.arrow_back_ios),
                    //   splashRadius: 0.1,
                    //   iconSize: DynamicSize.Azheight(17),
                    //   color: Color(0xFF6D7D8B),
                    // ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: DynamicSize.Azheight(17),
                        color: Color(0xFF6D7D8B),
                      ),
                    ),
                    SizedBox(width: DynamicSize.Azwidth(21)),
                    RichText(
                      text: TextSpan(
                        text: snapshot.data!.date,
                        // text: 'Tuesday, June 14 2022',
                        style: TextStyle(
                            fontSize: DynamicSize.Azheight(17),
                            color: Colors.black,
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(width: DynamicSize.Azwidth(21)),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: DynamicSize.Azheight(17),
                        color: Color(0xFF6D7D8B),
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(Icons.arrow_forward_ios),
                    //   splashRadius: 0.1,
                    //   iconSize: DynamicSize.Azheight(17),
                    //   color: Color(0xFF6D7D8B),
                    // ),
                  ],
                ),

                //Day
                SizedBox(height: DynamicSize.Azheight(5)),
                Container(
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Day ${snapshot.data!.day}',
                        style: TextStyle(
                          fontSize: DynamicSize.Azheight(18),
                          color: Color(0xFF1F2F70),
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),

                // Msg
                SizedBox(height: DynamicSize.Azheight(24)),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: DynamicSize.Azwidth(24)),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: snapshot.data!.msg,
                        // text:
                        // 'Congratulations you have just taken the first step to back fitness and core strength you never knew you had!',
                        style: TextStyle(
                          fontSize: DynamicSize.Azheight(15.0),
                          color: Color(0xFF193669),
                          fontFamily: 'DMSans',
                        ),
                      ),
                    ),
                  ),
                ),
                // GestureDetector(
                //   child: buildRoundedCard(),
                //   onTap: () {
                //     Navigator.pushNamed(context, '/exercise');
                //   },
                // ),
                // buildRoundedCards(),
                // buildRoundedCardes(),
                SizedBox(height: DynamicSize.Azheight(25)),
                // _section(context),
                // // Divider(),
                // _section(context),

                Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemCount: snapshot.data!.sections.length,
                        itemBuilder: ((context, index) {
                          return _section(context, index, snapshot);
                        })),
                  ),
                )
              ],
            );
          } else {
            return Container(
              child: Center(
                child: GradientProgressIndicator(
                  radius: 40,
                  duration: 1,
                  strokeWidth: 6,
                  gradientStops: [
                    0.0,
                    1,
                  ],
                  gradientColors: [
                    Color.fromRGBO(58, 225, 128, 0),
                    Color.fromRGBO(25, 54, 105, 1),
                  ],
                  child: SizedBox.shrink(),
                ),
              ),
            );
          }
        },
      ),
    );
  }

//   Widget buildRoundedCard() => Card(
//         shadowColor: Colors.grey[400],
//         elevation: 2,
//         clipBehavior: Clip.antiAlias,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(0),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//           ),
//           padding: EdgeInsets.fromLTRB(26.0, 10.0, 26.0, 34.0),
//           child: Column(
//             // crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
//                 child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.menu,
//                       size: 30,
//                       color: Colors.grey[300],
//                     ),
//                   ),
//                   Tab(icon: new Image.asset("images/Vector.png")),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
//                     child: Container(
//                         child: Center(
//                       child: RichText(
//                         text: TextSpan(
//                           text: 'Foam Rolling',
//                           style: TextStyle(
//                               fontSize: 16.0,
//                               color: Color(0xFF193669),
//                               fontFamily: 'DMSans',
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                     )),
//                   ),
//                 ]),
//               ),
//             ],
//           ),
//         ),
//       );

//   Widget buildRoundedCards() => Card(
//       shadowColor: Colors.grey[400],
//       elevation: 2,
//       clipBehavior: Clip.antiAlias,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(0),
//       ),
//       child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//           ),
//           padding: EdgeInsets.fromLTRB(26.0, 10.0, 26.0, 34.0),
//           child: Column(
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
//                   child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.menu,
//                         size: 30,
//                         color: Colors.grey[300],
//                       ),
//                     ),
//                     // Image.asset('images/Vector.png', height: 10.0,width: 10.0,),
//                     Tab(icon: new Image.asset("images/Vector.png")),
//                     Padding(
//                       padding:
//                           const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
//                       child: Container(
//                           child: Center(
//                         child: RichText(
//                           text: TextSpan(
//                             text: 'Mobility',
//                             style: TextStyle(
//                                 fontSize: 16.0,
//                                 color: Color(0xFF193669),
//                                 fontFamily: 'DMSans',
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       )),
//                     ),
//                   ]),
//                 ),
//               ])));

//   Widget buildRoundedCardes() => Card(
//       shadowColor: Colors.grey[400],
//       elevation: 2,
//       clipBehavior: Clip.antiAlias,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(0),
//       ),
//       child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//           ),
//           padding: EdgeInsets.fromLTRB(26.0, 10.0, 26.0, 34.0),
//           child: Column(
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
//                   child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.menu,
//                         size: 30,
//                         color: Colors.grey[300],
//                       ),
//                     ),
//                     // Image.asset('images/Vector.png', height: 10.0,width: 10.0,),
//                     Tab(icon: new Image.asset("images/Vectorflake.png")),
//                     Padding(
//                       padding:
//                           const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
//                       child: Container(
//                           child: Center(
//                         child: RichText(
//                           text: TextSpan(
//                             text: 'Flexibility',
//                             style: TextStyle(
//                                 fontSize: 16.0,
//                                 color: Color(0xFF193669),
//                                 fontFamily: 'DMSans',
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       )),
//                     ),
//                   ]),
//                 ),
//               ])));
// }

  Widget _section(
      BuildContext context, int index, AsyncSnapshot<_day> snapshot) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: EdgeInsets.symmetric(
                vertical: DynamicSize.Azheight(10),
                horizontal: DynamicSize.Azwidth(26)),
            leading: Wrap(
              spacing: DynamicSize.Azwidth(30),
              children: [
                Icon(
                  Icons.menu_rounded,
                  color: Color(0xFFE0E0E0),
                ),
                int.parse(snapshot.data!.sections[index][1].toString()) == 1
                    ? SvgPicture.asset('images/fire.svg')
                    : SvgPicture.asset('images/snowflake.svg'),
              ],
            ),
            title: Text(
              snapshot.data!.sections[index][0].toString(),
              style: TextStyle(
                fontSize: DynamicSize.Azheight(16),
                fontWeight: FontWeight.w500,
                fontFamily: 'DMSans',
                color: Color(0xFF193669),
              ),
            ),
            children: snapshot.data!.exercises[index]
                .map((e) => Column(
                      children: [
                        SizedBox(height: DynamicSize.Azheight(24)),
                        Padding(
                          padding: EdgeInsets.only(
                              left: DynamicSize.Azwidth(97),
                              right: DynamicSize.Azwidth(24)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    SvgPicture.asset('images/bullet.svg'),
                                    SizedBox(width: DynamicSize.Azwidth(16)),
                                    Flexible(
                                      child: Text(
                                        e.toString(),
                                        // 'Foam Rolling Front Hip',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'DMSans',
                                          color: Color(0xFF193669),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  child: Row(
                                    children: [
                                      Text('View'),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: DynamicSize.Azheight(13),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
                .toList(),
            // children: [
            //   SizedBox(height: DynamicSize.Azheight(24)),
            //   Padding(
            //     padding: EdgeInsets.only(
            //         left: DynamicSize.Azwidth(97),
            //         right: DynamicSize.Azwidth(24)),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Expanded(
            //           child: Row(
            //             children: [
            //               SvgPicture.asset('images/bullet.svg'),
            //               SizedBox(width: DynamicSize.Azwidth(16)),
            //               Flexible(
            //                 child: Text(
            //                   'Foam Rolling Front Hip',
            //                   style: TextStyle(
            //                     fontWeight: FontWeight.w500,
            //                     fontFamily: 'DMSans',
            //                     color: Color(0xFF193669),
            //                   ),
            //                   overflow: TextOverflow.ellipsis,
            //                   maxLines: 1,
            //                   softWrap: true,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         GestureDetector(
            //           onTap: () {},
            //           child: Container(
            //             child: Row(
            //               children: [
            //                 Text('View'),
            //                 Icon(
            //                   Icons.arrow_forward_ios_rounded,
            //                   size: DynamicSize.Azheight(13),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),

            //   // SizedBox(height: DynamicSize.Azheight(24)),
            //   // Padding(
            //   //   padding: EdgeInsets.only(
            //   //       left: DynamicSize.Azwidth(97),
            //   //       right: DynamicSize.Azwidth(24)),
            //   //   child: Row(
            //   //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   //     children: [
            //   //       Expanded(
            //   //         child: Row(
            //   //           children: [
            //   //             SvgPicture.asset('images/bullet.svg'),
            //   //             SizedBox(width: DynamicSize.Azwidth(16)),
            //   //             Flexible(
            //   //               child: Text(
            //   //                 'Foam Rolling Back Hip',
            //   //                 style: TextStyle(
            //   //                   fontWeight: FontWeight.w500,
            //   //                   fontFamily: 'DMSans',
            //   //                   color: Color(0xFF193669),
            //   //                 ),
            //   //                 overflow: TextOverflow.ellipsis,
            //   //                 maxLines: 1,
            //   //                 softWrap: true,
            //   //               ),
            //   //             ),
            //   //           ],
            //   //         ),
            //   //       ),
            //   //       GestureDetector(
            //   //         onTap: () {},
            //   //         child: Container(
            //   //           child: Row(
            //   //             children: [
            //   //               Text('View'),
            //   //               Icon(
            //   //                 Icons.arrow_forward_ios_rounded,
            //   //                 size: DynamicSize.Azheight(13),
            //   //               ),
            //   //             ],
            //   //           ),
            //   //         ),
            //   //       ),
            //   //     ],
            //   //   ),
            //   // ),
            // ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
