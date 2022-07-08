import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_progress_indicator/widget/gradient_progress_indicator_widget.dart';
import 'package:heath_matthews_physio/screens/NavBar.dart';
import 'package:heath_matthews_physio/utils/loadingspinner.dart';
import 'package:heath_matthews_physio/utils/showSnackBar.dart';

import '../DynamicSize/size.dart';

class adminScreen extends StatefulWidget {
  const adminScreen({Key? key}) : super(key: key);

  @override
  _adminScreenState createState() => _adminScreenState();
}

class _adminScreenState extends State<adminScreen> {
  get svalue => null;

  List<String> _locations = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]; // Option 2
  String? _selectedLocation; // Option 2
  List<String> _healthCoach = [
    'Heath Matthew',
    'Aayushi Chauhan',
    'hardik chauhan'
  ]; // Option 2
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

  Stream<QuerySnapshot>? _programs;
  _getprograms() {
    final CollectionReference programsCollection =
        FirebaseFirestore.instance.collection('programs');
    _programs = programsCollection.snapshots();
  }

  @override
  void initState() {
    _getprograms();
    super.initState();
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
        title: Text(
          "Admin Programs",
          style: GoogleFonts.dmSans(
            fontSize: DynamicSize.Aaheight(24),
            color: Color(0xFF193669),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: NavBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _programs,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return SnackBar(content: Text(snapshot.error.toString()));
          }

          if (snapshot.connectionState == ConnectionState.active) {
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> listQueryDocumentSnapshot =
                querySnapshot.docs;
            return Column(
              children: [
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: listQueryDocumentSnapshot.length,
                      itemBuilder: (context, index) {
                        QueryDocumentSnapshot document =
                            listQueryDocumentSnapshot[index];
                        return _program(context, document);
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(
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
          );
        },
      ),
    );
  }

  Widget _program(BuildContext context, QueryDocumentSnapshot document) {
    List<String> title = document['name'].toString().split(" ");
    String textTitle = title.sublist(0, title.length ~/ 2).join(' ') +
        "\n" +
        title.sublist(title.length ~/ 2).join(' ');
    return Padding(
      padding: EdgeInsets.all(DynamicSize.Aaheight(20)),
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
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              // Total No.of Days of program
              Row(
                children: [
                  InputChip(
                      avatar: Text(document['no_of_days'].toString()),
                      label: const Text('Days'),
                      backgroundColor: Colors.white,
                      onPressed: () {}),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),

              // Program Name
              Text(
                textTitle,
                style: GoogleFonts.dmSans(
                    fontSize: DynamicSize.Aaheight(18),
                    color: Color(0xFF2F3F70),
                    fontWeight: FontWeight.w500),
              ),

              //Program Description
              SizedBox(
                height: DynamicSize.Aaheight(16.0),
              ),
              Text(
                document['description'],
                softWrap: true,
                style: GoogleFonts.dmSans(
                    fontSize: DynamicSize.Aaheight(12),
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),

              // Choose date
              SizedBox(
                height: DynamicSize.Aaheight(24.0),
              ),
              Text(
                "Choose start day and date",
                style: GoogleFonts.dmSans(
                    fontSize: DynamicSize.Aaheight(13),
                    color: Color(0xFF2F3F70),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: DynamicSize.Aaheight(10.0),
              ),
              Row(
                children: [
                  // No.of Days
                  Container(
                    padding: EdgeInsets.only(left: DynamicSize.Fawidth(4)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Center(
                          child: Text(
                            ' Number of Days',
                            style: GoogleFonts.dmSans(
                              fontSize: DynamicSize.Aaheight(12),
                            ),
                          ),
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
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),

                  //Date Picker
                  SizedBox(
                    width: DynamicSize.Aawidth(16),
                  ),
                  GestureDetector(
                    onTap: () {
                      _buildMaterialDatePicker(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: DynamicSize.Aawidth(14)),
                      child: Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: DynamicSize.Aaheight(18),
                              ),
                              child: Text(
                                  "${selectedDate.toLocal()}".split(' ')[0],
                                  style: GoogleFonts.dmSans(
                                      fontSize: DynamicSize.Aaheight(12),
                                      color: Color(0xFF2F3F70))),
                            ),
                          ),
                          SizedBox(width: DynamicSize.Aawidth(14)),
                          Icon(
                            FontAwesomeIcons.calendar,
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
                  ),
                ],
              ),

              //Coach Picker
              SizedBox(
                height: DynamicSize.Aaheight(16.0),
              ),
              Container(
                padding: EdgeInsets.only(left: DynamicSize.Fawidth(4)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: Text(
                      ' Select Health Coach',
                      style: GoogleFonts.dmSans(
                          fontSize: DynamicSize.Aaheight(12)),
                    ), // Not necessary for Option 1
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
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),

              //Add Program Button
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
                        borderRadius:
                            BorderRadius.circular(DynamicSize.Aaheight(15)),
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
    );
  }
}
