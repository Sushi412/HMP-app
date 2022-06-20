import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heath_matthews_physio/NavBar.dart';
import '../DynamicSize/size.dart';
class adminProgramScreen extends StatefulWidget {

  const adminProgramScreen({Key? key}) : super(key: key);

  @override
  _adminProgramScreenState createState() => _adminProgramScreenState();
}

class _adminProgramScreenState extends State<adminProgramScreen> {
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(

        child: Scaffold(
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
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(height: DynamicSize.Aaheight(44)),
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
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: InputChip(
                                      avatar: const Text('63'),
                                      label: const Text('Days'),
                                      backgroundColor: Colors.white,
                                      onPressed: () {}),
                                ),
                                SizedBox(height: DynamicSize.Aaheight(6)),
                                Text(
                                  "Core & Back \n"
                                      "Fitness Program",
                                  style: GoogleFonts.dmSans(
                                    fontSize: DynamicSize.Aaheight(22),
                                    color: Color(0xFF193669),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: DynamicSize.Aaheight(16)),
                                Text(
                                  "Are you tired of a stiff lower back? Are you tired of being told your core is weak all the time? If so, then this program is for you! Unlock the secrets to freedom of movement in just 6 minutes a day! ",
                                  style: GoogleFonts.dmSans(
                                    fontSize: DynamicSize.Aaheight(12),
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: DynamicSize.Aaheight(24)),
                                Text(
                                  "Choose start day and date",
                                  style: GoogleFonts.dmSans(
                                    fontSize: DynamicSize.Aaheight(14),
                                    color: Color(0xFF193669),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Expanded(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child:  Expanded(
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: DynamicSize.Aawidth(10),
                                                          ),
                                                          Expanded(
                                                            child: DropdownButton(
                                                              hint: Text('Number of Days',style: GoogleFonts.dmSans(
                                                                fontSize: DynamicSize.Aaheight(12)
                                                              ),), // Not necessary for Option 1
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
                                                          SizedBox(
                                                            width: DynamicSize.Aawidth(8),
                                                          ),
                                                        ],
                                                      ),
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
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: DynamicSize.Aaheight(4),
                                            ),

                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0),
                                                  ),
                                                ),
                                                child: Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 14, bottom: 14,right: 8, left:8),
                                                    child: Expanded(
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: DynamicSize.Aawidth(8),
                                                          ),
                                                          Theme(
                                                            data: ThemeData(
                                                                primaryColor: Color(0xFF2F3F70),
                                                                buttonColor: Color(0xFF2F3F70)
                                                            ),
                                                            child: Container(
                                                              child: GestureDetector(
                                                                onTap: () {
                                                                  _buildMaterialDatePicker(context);
                                                                },
                                                                child: Text(
                                                                    "${selectedDate.toLocal()}".split(' ')[0] ?? 'Select Date',
                                                                    style: GoogleFonts.dmSans(
                                                                        fontSize: DynamicSize.Aaheight(12),
                                                                        color: Color(0xFF2F3F70)
                                                                    )
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: DynamicSize.Aawidth(4),
                                                          ),
                                                          Icon(FontAwesomeIcons.calendar,
                                                            size: DynamicSize.Aaheight(18), //Icon Size
                                                            color: Color(0xFF2F3F70), //Color Of Icon
                                                          ),
                                                          SizedBox(
                                                            width: DynamicSize.Aawidth(4),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: DynamicSize.Aaheight(9),
                                ),
                                Expanded(
                                  child: Container(

                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                      ),
                                      child:  Expanded(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: DynamicSize.Aawidth(14),
                                            ),
                                            Expanded(
                                              child: DropdownButton(
                                                hint: Text('Select Health Coach',style: GoogleFonts.dmSans(fontSize: DynamicSize.Aaheight(12)),), // Not necessary for Option 1
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
                                            SizedBox(
                                              width: DynamicSize.Aawidth(3),
                                            ),
                                          ],
                                        ),
                                      )
                                  ),
                                ),
                                SizedBox(
                                    height: DynamicSize.Aaheight(16)
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: DynamicSize.Aawidth(2)),
                                        child: SizedBox(
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
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                  ),
                  SizedBox(height: DynamicSize.Aaheight(40.0),),
                  // Container(
                  //     height: DynamicSize.Aaheight(460),
                  //     width: double.infinity,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(DynamicSize.Aaheight(24)),
                  //       color: Color(0x329DBBEF),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           offset: Offset(0, DynamicSize.Aaheight(3)),
                  //           color: Color.fromARGB(141, 0, 0, 0),
                  //           blurRadius: DynamicSize.Aaheight(0.3),
                  //         ),
                  //         BoxShadow(
                  //           offset: Offset(0, 0),
                  //           color: Colors.white,
                  //           blurRadius: DynamicSize.Aaheight(0.3),
                  //         ),
                  //       ],
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(22.0),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           InputChip(
                  //               avatar: const Text('63'),
                  //               label: const Text('Days'),
                  //               backgroundColor: Colors.white,
                  //               onPressed: () {}),
                  //           SizedBox(height: DynamicSize.Aaheight(6)),
                  //           Text(
                  //             "Core & Back \n"
                  //                 "Fitness Program",
                  //             style: GoogleFonts.dmSans(
                  //               fontSize: 20.0,
                  //               color: Color(0xFF193669),
                  //               fontWeight: FontWeight.w600,
                  //             ),
                  //           ),
                  //           SizedBox(height: DynamicSize.Aaheight(16)),
                  //           Text(
                  //             "Are you tired of a stiff lower back? Are you tired of being told your core is weak all the time? If so, then this program is for you! Unlock the secrets to freedom of movement in just 6 minutes a day! ",
                  //             style: GoogleFonts.dmSans(
                  //               fontSize: 12.0,
                  //               color: Colors.black,
                  //               fontWeight: FontWeight.w400,
                  //             ),
                  //           ),
                  //           SizedBox(height: DynamicSize.Aaheight(24)),
                  //           Text(
                  //             "Choose start day and date",
                  //             style: GoogleFonts.dmSans(
                  //               fontSize: 14.0,
                  //               color: Color(0xFF193669),
                  //               fontWeight: FontWeight.w600,
                  //             ),
                  //           ),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: [
                  //               Padding(
                  //                 padding: const EdgeInsets.all(8.0),
                  //                 child: Row(
                  //                   children: [
                  //                     Container(
                  //                       child:  Row(
                  //                         children: [
                  //                           SizedBox(
                  //                             width: DynamicSize.Aawidth(10),
                  //                           ),
                  //                           DropdownButton(
                  //                             hint: Text('Number of Days'), // Not necessary for Option 1
                  //                             value: _selectedLocation,
                  //                             onChanged: (newValue) {
                  //                               setState(() {
                  //                                 _selectedLocation = newValue.toString();
                  //                               });
                  //                             },
                  //                             items: _locations.map((location) {
                  //                               return DropdownMenuItem(
                  //                                 child: new Text(location),
                  //                                 value: location,
                  //                               );
                  //                             }).toList(),
                  //                           ),
                  //                           SizedBox(
                  //                             width: DynamicSize.Aawidth(8),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       decoration: BoxDecoration(
                  //                         color: Colors.white,
                  //                         borderRadius: BorderRadius.all(
                  //                           Radius.circular(8.0),
                  //                         ),
                  //                       ),
                  //
                  //                     ),
                  //
                  //                   ],
                  //                 ),
                  //               ),
                  //               Row(
                  //                 children: [
                  //                   SizedBox(
                  //                     height: DynamicSize.Aaheight(4),
                  //                   ),
                  //
                  //                   Container(
                  //                     decoration: BoxDecoration(
                  //                       color: Colors.white,
                  //                       borderRadius: BorderRadius.all(
                  //                         Radius.circular(8.0),
                  //                       ),
                  //                     ),
                  //                     child: Padding(
                  //                       padding: const EdgeInsets.only(top: 14, bottom: 14,right: 8, left:8),
                  //                       child: Row(
                  //                         children: [
                  //                           SizedBox(
                  //                             width: DynamicSize.Aawidth(8),
                  //                           ),
                  //                           Theme(
                  //                             data: ThemeData(
                  //                                 primaryColor: Color(0xFF2F3F70),
                  //                                 buttonColor: Color(0xFF2F3F70)
                  //                             ),
                  //                             child: Container(
                  //                               child: GestureDetector(
                  //                                 onTap: () {
                  //                                   _buildMaterialDatePicker(context);
                  //                                 },
                  //                                 child: Text(
                  //                                     "${selectedDate.toLocal()}".split(' ')[0] ?? 'Select Date',
                  //                                     style: GoogleFonts.dmSans(
                  //                                         fontSize: 15.0,
                  //                                         color: Color(0xFF2F3F70)
                  //                                     )
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           SizedBox(
                  //                             width: DynamicSize.Aawidth(4),
                  //                           ),
                  //                           Icon(FontAwesomeIcons.calendar,
                  //                             size: 18, //Icon Size
                  //                             color: Color(0xFF2F3F70), //Color Of Icon
                  //                           ),
                  //                           SizedBox(
                  //                             width: DynamicSize.Aawidth(4),
                  //                           ),
                  //
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   )
                  //                 ],
                  //               )
                  //             ],
                  //           ),
                  //           SizedBox(
                  //             height: DynamicSize.Aaheight(9),
                  //           ),
                  //           Container(
                  //
                  //               decoration: BoxDecoration(
                  //                 color: Colors.white,
                  //                 borderRadius: BorderRadius.all(
                  //                   Radius.circular(8.0),
                  //                 ),
                  //               ),
                  //               child:  Row(
                  //                 children: [
                  //                   SizedBox(
                  //                     width: DynamicSize.Aawidth(14),
                  //                   ),
                  //                   DropdownButton(
                  //                     hint: Text('Select Health Coach'), // Not necessary for Option 1
                  //                     value: _selectedheathCoach,
                  //                     onChanged: (newValue) {
                  //                       setState(() {
                  //                         _selectedheathCoach = newValue.toString();
                  //                       });
                  //                     },
                  //                     items: _healthCoach.map((location) {
                  //                       return DropdownMenuItem(
                  //                         child: new Text(location),
                  //                         value: location,
                  //                       );
                  //                     }).toList(),
                  //                   ),
                  //                   SizedBox(
                  //                     width: DynamicSize.Aawidth(3),
                  //                   ),
                  //                 ],
                  //               )
                  //           ),
                  //           SizedBox(
                  //               height: DynamicSize.Aaheight(16)
                  //           ),
                  //           Column(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Padding(
                  //                 padding: EdgeInsets.symmetric(
                  //                     horizontal: DynamicSize.Aawidth(2)),
                  //                 child: SizedBox(
                  //                   width: double.infinity,
                  //                   height: DynamicSize.Aaheight(50),
                  //                   child: TextButton(
                  //                     onPressed: () {},
                  //                     style: TextButton.styleFrom(
                  //                         backgroundColor: Color(0xFF193669),
                  //                         shape: RoundedRectangleBorder(
                  //                           borderRadius: BorderRadius.circular(
                  //                               DynamicSize.Aaheight(15)),
                  //                         )
                  //                       // padding: EdgeInsets.symmetric(horizontal: 1),
                  //                     ),
                  //                     child: Text(
                  //                       'ADD PROGRAM',
                  //                       style: TextStyle(
                  //                         fontFamily: 'DMSans',
                  //                         fontSize: DynamicSize.Aaheight(15.0),
                  //                         fontWeight: FontWeight.w400,
                  //                         letterSpacing: DynamicSize.Aawidth(0.8),
                  //                         color: Colors.white,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           )
                  //         ],
                  //       ),
                  //     )
                  // ),

                ],
              ),
            ),
          ),
        )
    );
  }
}