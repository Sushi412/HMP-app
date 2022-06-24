import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heath_matthews_physio/NavBar.dart';

import '../DynamicSize/size.dart';

class adminScreen extends StatefulWidget {
  const adminScreen({Key? key}) : super(key: key);

  @override
  _adminScreenState createState() => _adminScreenState();
}

class _adminScreenState extends State<adminScreen> {

  get svalue => null;
  List<String> _locations = ['01', '02', '03', '04','05', '06', '07', '08','09', '10', '11', '12'
    ,'13', '14', '15', '16','17', '18', '19', '20']; // Option 2
  String? _selectedLocation; // Option 2
  List<String> _healthCoach = ['Heath Matthew','Aayushi Chauhan',
    'hardik chauhan']; // Option 2
  String? _selectedheathCoach; // Option 2

  DateTime selectedDate = DateTime.now();
  _buildMaterialDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.day,
      helpText: 'Choose date',
      cancelText: 'Cancel',
      confirmText: 'Save',
      errorFormatText: 'Invalid date format',
      errorInvalidText: 'Invalid date format',
      fieldLabelText: 'Start date',
      fieldHintText: 'Year/Month/Date',
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF2F3F70)),
        title:  Text(
          "Admin Programs",
          style: GoogleFonts.dmSans(
            fontSize: DynamicSize.Aaheight(24),
            color: Color(0xFF193669),
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      drawer: NavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DynamicSize.Aaheight(20)),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: DynamicSize.Aaheight(500),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(DynamicSize.Aaheight(24)),
                        color: Color(0x329DBBEF),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, DynamicSize.Aaheight(3)),
                            color: Color.fromARGB(141, 0, 0, 0),
                            blurRadius: DynamicSize.Aaheight(0.3),
                          ),
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.white,
                            blurRadius: DynamicSize.Aaheight(0.3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(DynamicSize.Aaheight(20)),
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            Row(
                              children: [
                                InputChip(
                                    avatar: const Text('63'),
                                    label: const Text('Days'),
                                    backgroundColor: Colors.white,
                                    onPressed: () {}
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.start,
                            ),
                            Text("Core & Back \nFitness Program",style: GoogleFonts.dmSans(
                              fontSize: DynamicSize.Aaheight(18),
                              color: Color(0xFF2F3F70),
                              fontWeight: FontWeight.w500
                            ),),
                            SizedBox(
                              height: DynamicSize.Aaheight(16.0),
                            ),
                            Text("Are you tired of a stiff lower back? Are you tired of being told your core is weak all the time? If so, then this program is for you! Unlock the secrets to freedom of movement in just 6 minutes a day! ",style: GoogleFonts.dmSans(
                                fontSize: DynamicSize.Aaheight(12),
                                color: Colors.black,
                                fontWeight: FontWeight.w400
                            ),),
                            SizedBox(
                              height: DynamicSize.Aaheight(24.0),
                            ),
                            Text("Choose start day and date",style: GoogleFonts.dmSans(
                                fontSize: DynamicSize.Aaheight(13),
                                color: Color(0xFF2F3F70),
                                fontWeight: FontWeight.w500
                            ),),
                            SizedBox(
                              height: DynamicSize.Aaheight(10.0),
                            ),
                            Row(
                              children: [
                                Container(
                                  child: DropdownButton(
                                    hint: Center(
                                      child: Text(' Number of Days',style: GoogleFonts.dmSans(
                                          fontSize: DynamicSize.Aaheight(12),
                                      ),),
                                    ), // Not necessary for Option 1
                                    value: _selectedLocation,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedLocation = newValue.toString();
                                      });
                                    },
                                    items: _locations.map((location) {
                                      return DropdownMenuItem(
                                        child: new Text(location),
                                        value: location,
                                      );
                                    }).toList(),
                                  ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                    ),
                                ),
                                SizedBox(
                                  width: DynamicSize.Aawidth(16),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        child: GestureDetector(
                                          onTap: () {
                                            _buildMaterialDatePicker(context);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(DynamicSize.Aaheight(18)),
                                            child: Text(
                                                "${ selectedDate.toLocal()}".split(' ')[0] ?? 'Select Date',
                                                style: GoogleFonts.dmSans(
                                                    fontSize: DynamicSize.Aaheight(12),
                                                    color: Color(0xFF2F3F70)
                                                )
                                            ),
                                          ),

                                        ),
                                      ),
                                      Icon(FontAwesomeIcons.calendar,
                                        size: DynamicSize.Aaheight(18), //Icon Size
                                        color: Color(0xFF2F3F70), //Color Of Icon
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(
                              height: DynamicSize.Aaheight(16.0),
                            ),
                            Container(
                              child: DropdownButton(
                                hint: Text(' Select Health Coach',style: GoogleFonts.dmSans(fontSize: DynamicSize.Aaheight(12)),), // Not necessary for Option 1
                                value: _selectedheathCoach,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedheathCoach = newValue.toString();
                                  });
                                },
                                items: _healthCoach.map((location) {
                                  return DropdownMenuItem(
                                    child: new Text(location),
                                    value: location,
                                  );
                                }).toList(),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: DynamicSize.Aaheight(24.0),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: DynamicSize.Aaheight(50),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/program');
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFF193669),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          DynamicSize.Aaheight(15)),
                                    )
                                  // padding: EdgeInsets.symmetric(horizontal: 1),
                                ),
                                child: Text(
                                  'ADD PROGRAM',
                                  style: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: DynamicSize.Aaheight(15.0),
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: DynamicSize.Aawidth(0.8),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: DynamicSize.Aaheight(20.0),
              ),
              Container(
                height: DynamicSize.Aaheight(500),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(DynamicSize.Aaheight(24)),
                  color: Color(0x329DBBEF),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, DynamicSize.Aaheight(3)),
                      color: Color.fromARGB(141, 0, 0, 0),
                      blurRadius: DynamicSize.Aaheight(0.3),
                    ),
                    BoxShadow(
                      offset: Offset(0, 0),
                      color: Colors.white,
                      blurRadius: DynamicSize.Aaheight(0.3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(DynamicSize.Aaheight(20)),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Row(
                        children: [
                          InputChip(
                              avatar: const Text('63'),
                              label: const Text('Days'),
                              backgroundColor: Colors.white,
                              onPressed: () {}
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      Text("Core & Back \nFitness Program",style: GoogleFonts.dmSans(
                          fontSize: DynamicSize.Aaheight(18),
                          color: Color(0xFF2F3F70),
                          fontWeight: FontWeight.w500
                      ),),
                      SizedBox(
                        height: DynamicSize.Aaheight(16.0),
                      ),
                      Text("Are you tired of a stiff lower back? Are you tired of being told your core is weak all the time? If so, then this program is for you! Unlock the secrets to freedom of movement in just 6 minutes a day! ",style: GoogleFonts.dmSans(
                          fontSize: DynamicSize.Aaheight(12),
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                      ),),
                      SizedBox(
                        height: DynamicSize.Aaheight(24.0),
                      ),
                      Text("Choose start day and date",style: GoogleFonts.dmSans(
                          fontSize: DynamicSize.Aaheight(13),
                          color: Color(0xFF2F3F70),
                          fontWeight: FontWeight.w500
                      ),),
                      SizedBox(
                        height: DynamicSize.Aaheight(10.0),
                      ),
                      Row(
                        children: [
                          Container(
                            child: DropdownButton(
                              hint: Center(
                                child: Text(' Number of Days',style: GoogleFonts.dmSans(
                                  fontSize: DynamicSize.Aaheight(12),
                                ),),
                              ), // Not necessary for Option 1
                              value: _selectedLocation,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedLocation = newValue.toString();
                                });
                              },
                              items: _locations.map((location) {
                                return DropdownMenuItem(
                                  child: new Text(location),
                                  value: location,
                                );
                              }).toList(),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: DynamicSize.Aawidth(16),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      _buildMaterialDatePicker(context);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(DynamicSize.Aaheight(18)),
                                      child: Text(
                                          "${ selectedDate.toLocal()}".split(' ')[0] ?? 'Select Date',
                                          style: GoogleFonts.dmSans(
                                              fontSize: DynamicSize.Aaheight(12),
                                              color: Color(0xFF2F3F70)
                                          )
                                      ),
                                    ),

                                  ),
                                ),
                                Icon(FontAwesomeIcons.calendar,
                                  size: DynamicSize.Aaheight(18), //Icon Size
                                  color: Color(0xFF2F3F70), //Color Of Icon
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: DynamicSize.Aaheight(16.0),
                      ),
                      Container(
                        child: DropdownButton(
                          hint: Text(' Select Health Coach',style: GoogleFonts.dmSans(fontSize: DynamicSize.Aaheight(12)),), // Not necessary for Option 1
                          value: _selectedheathCoach,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedheathCoach = newValue.toString();
                            });
                          },
                          items: _healthCoach.map((location) {
                            return DropdownMenuItem(
                              child: new Text(location),
                              value: location,
                            );
                          }).toList(),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: DynamicSize.Aaheight(24.0),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: DynamicSize.Aaheight(50),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xFF193669),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    DynamicSize.Aaheight(15)),
                              )
                            // padding: EdgeInsets.symmetric(horizontal: 1),
                          ),
                          child: Text(
                            'ADD PROGRAM',
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: DynamicSize.Aaheight(15.0),
                              fontWeight: FontWeight.w400,
                              letterSpacing: DynamicSize.Aawidth(0.8),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      )
    );
  }
}
