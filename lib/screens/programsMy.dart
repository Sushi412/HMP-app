import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:iconify_flutter/icons/bx.dart';

import '../DynamicSize/size.dart';
import '../NavBar.dart';

class program extends StatefulWidget {
  const program({Key? key}) : super(key: key);

  @override
  _programState createState() => _programState();
}

class _programState extends State<program> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF2F3F70)),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'My Programs',
          style: TextStyle(
            color: Color(0xFF193669),
            fontFamily: 'DMSans',
            fontSize: DynamicSize.Faheight(24),
            fontWeight: FontWeight.w700,
            letterSpacing: DynamicSize.Fawidth(0.4),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: DynamicSize.Fawidth(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Search Bar
            SizedBox(height: DynamicSize.Faheight(40)),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: DynamicSize.Fawidth(18)),
              height: DynamicSize.Faheight(48),
              decoration: BoxDecoration(
                color: Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(DynamicSize.Faheight(24)),
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  prefixIcon: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.search_rounded,
                      color: Color(0xFF000000),
                    ),
                  ),
                  hintText: 'Search Keywords',
                  hintStyle: TextStyle(
                    color: Color(0xFF89807A),
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.w500,
                    fontSize: DynamicSize.Faheight(15),
                    letterSpacing: DynamicSize.Fawidth(0.5),
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontFamily: 'DMSans',
                  fontWeight: FontWeight.w500,
                  fontSize: DynamicSize.Faheight(16),
                  letterSpacing: DynamicSize.Fawidth(0.5),
                ),
                textInputAction: TextInputAction.search,
              ),
            ),

            //Programs Text
            SizedBox(height: DynamicSize.Faheight(16)),
            Padding(
              padding: EdgeInsets.only(left: DynamicSize.Fawidth(12)),
              child: Text(
                'Programs',
                style: TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: DynamicSize.Faheight(16),
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF767676),
                ),
              ),
            ),

            //List
            SizedBox(height: DynamicSize.Faheight(24)),
            Expanded(
              child: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return programContainer(context, index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
List<Color> _fadeColorList = [
  Color.fromRGBO(210, 65, 110, 0.1),
  Color.fromRGBO(112, 66, 201, 0.1),
  Color.fromRGBO(13, 177, 173, 0.1),
];
List<Color> _DarkColorList = [
  Color.fromRGBO(210, 65, 110, 1),
  Color.fromRGBO(112, 66, 201, 1),
  Color.fromRGBO(13, 177, 173, 1),
];

Widget programContainer(context, index) {
  return Padding(
    padding: EdgeInsets.only(bottom: DynamicSize.Faheight(24)),
    child: Container(
      height: DynamicSize.Faheight(202),
      width: DynamicSize.Fawidth(334),
      padding: EdgeInsets.symmetric(
          vertical: DynamicSize.Faheight(12),
          horizontal: DynamicSize.Fawidth(11)),
      decoration: BoxDecoration(
        color: _fadeColorList[index % 3],
        borderRadius: BorderRadius.circular(DynamicSize.Faheight(20)),
      ),
      child: ListView(
        children: [
          Row(
            children: [
              Container(
                width: DynamicSize.Fawidth(58),
                padding:
                EdgeInsets.symmetric(vertical: DynamicSize.Faheight(6)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(DynamicSize.Faheight(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                      offset: Offset(0, 4),
                      blurRadius: DynamicSize.Faheight(2),
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    '63 Days',
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: DynamicSize.Faheight(10),
                      fontWeight: FontWeight.w500,
                      letterSpacing: DynamicSize.Fawidth(0.1),
                    ),
                  ),
                ),
              ),
              SizedBox(width: DynamicSize.Fawidth(10)),
              Container(
                width: DynamicSize.Fawidth(51),
                padding:
                EdgeInsets.symmetric(vertical: DynamicSize.Faheight(6)),
                decoration: BoxDecoration(
                  color: Color(0xFF329A4E),
                  borderRadius: BorderRadius.circular(DynamicSize.Faheight(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                      offset: Offset(0, 4),
                      blurRadius: DynamicSize.Faheight(2),
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    'Active',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'DMSans',
                      fontSize: DynamicSize.Faheight(10),
                      fontWeight: FontWeight.w500,
                      letterSpacing: DynamicSize.Fawidth(0.1),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: DynamicSize.Faheight(16)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: DynamicSize.Fawidth(5)),
            child: Text(
              'Core & Back\nFitness Program',
              style: TextStyle(
                color: _DarkColorList[index % 3],
                fontFamily: 'DMSans',
                fontSize: DynamicSize.Faheight(17),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: DynamicSize.Faheight(14)),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: DynamicSize.Fawidth(5)),
                child: Text(
                  'Health Coach  -  ',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontFamily: 'DMSans',
                    fontSize: DynamicSize.Faheight(11),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                'Dr. Heath Matthew',
                style: TextStyle(
                  color: _DarkColorList[index % 3],
                  fontFamily: 'DMSans',
                  fontSize: DynamicSize.Faheight(11),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: DynamicSize.Faheight(8)),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: DynamicSize.Fawidth(5)),
                child: Text(
                  'Start Date  -  ',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontFamily: 'DMSans',
                    fontSize: DynamicSize.Faheight(11),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                '10-06-2022',
                style: TextStyle(
                  color: _DarkColorList[index % 3],
                  fontFamily: 'DMSans',
                  fontSize: DynamicSize.Faheight(11),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: DynamicSize.Faheight(14)),
          Row(
            children: [
              Container(
                height: DynamicSize.Faheight(32),
                width: DynamicSize.Fawidth(156),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context,'/workoutScreen');
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(_DarkColorList[index % 3]),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(DynamicSize.Faheight(18)),
                      ),
                    ),
                    splashFactory: InkRipple.splashFactory,
                    overlayColor: MaterialStateProperty.all(
                        Color.fromRGBO(232, 70, 60, 0.3)),
                  ),
                  child: Text(
                    'Start Workout',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'DMSans',
                      fontSize: DynamicSize.Faheight(12),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              //Edit Button
              SizedBox(width: DynamicSize.Fawidth(18)),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    // color: Colors.amber,
                    alignment: Alignment.centerLeft,
                    width: DynamicSize.Fawidth(48),
                    height: DynamicSize.Fawidth(36),
                    child: GestureDetector(
                      onTap: () => print('Edit Button'),
                      child: Iconify(
                        Bx.bx_edit,
                        color: _DarkColorList[index % 3],
                        size: 27,
                      ),
                    ),
                  ),
                  Tooltip(
                    message: 'Edit',
                    showDuration: Duration(seconds: 3),
                    triggerMode: TooltipTriggerMode.tap,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: DynamicSize.Faheight(14),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'DmSans',
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius:
                        BorderRadius.circular(DynamicSize.Faheight(75)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0, DynamicSize.Faheight(4)),
                            blurRadius: DynamicSize.Faheight(4),
                          ),
                        ]),
                    child: Icon(
                      Icons.info_outline_rounded,
                      size: DynamicSize.Faheight(17),
                      color: Color(0xFFC8C8C8),
                    ),
                  ),
                ],
              ),

              //Delete Button
              SizedBox(width: DynamicSize.Fawidth(18)),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: DynamicSize.Fawidth(50),
                    height: DynamicSize.Fawidth(35),
                    child: GestureDetector(
                      onTap: () => print('Delete Button'),
                      child: Container(
                        height: DynamicSize.Faheight(27),
                        width: DynamicSize.Faheight(27),
                        decoration: BoxDecoration(
                          color: Color(0xFFFF0909),
                          borderRadius:
                          BorderRadius.circular(DynamicSize.Faheight(8)),
                        ),
                        child: Center(
                          child: Iconify(
                            AntDesign.delete_outlined,
                            color: Colors.white,
                            size: DynamicSize.Faheight(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Tooltip(
                    message: 'Delete',
                    showDuration: Duration(seconds: 3),
                    triggerMode: TooltipTriggerMode.tap,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: DynamicSize.Faheight(14),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'DmSans',
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius:
                        BorderRadius.circular(DynamicSize.Faheight(75)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0, DynamicSize.Faheight(4)),
                            blurRadius: DynamicSize.Faheight(4),
                          ),
                        ]),
                    child: Icon(
                      Icons.info_outline_rounded,
                      size: DynamicSize.Faheight(17),
                      color: Color(0xFFC8C8C8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      )
    ),
  );
}

