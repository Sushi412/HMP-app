// // import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:heath_matthews_physio/DynamicSize/size.dart';
// // import 'package:flutter/services.dart';
// // import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';
// // import 'dart:io';
// // import 'package:image_picker/image_picker.dart';
// // XFile? _image;
// //
// // class reg_name_and_dp extends StatefulWidget {
// //   const reg_name_and_dp({Key? key}) : super(key: key);
// //
// //   @override
// //   _reg_name_and_dpState createState() => _reg_name_and_dpState();
// // }
// //
// // class _reg_name_and_dpState extends State<reg_name_and_dp> {
// //
// //   @override
// //
// //   File? _image;
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(50.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             GestureDetector(
// //               child: CircleAvatar(
// //                 radius: 100.0,
// //                   backgroundImage: _image!=null?FileImage(_image as File):AssetImage('images/user_image.jpg') as ImageProvider, ),
// //               onTap: (){
// //                 print("icon was tapped");
// //                 // PickImage();
// //                 loadImage(ImageSource.gallery);
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // // void PickImage()async{
// // //   XFile? image= await ImagePicker().pickImage(source: ImageSource.gallery);
// // //   setState(){
// // //     _image=image! ;
// // //   }
// // // }
// // //
// //
// // Future<File?> saveImagePermanently(String? imagePath) async {
// //   final directory = await getApplicationDocumentsDirectory();
// //   final name = basename(imagePath!);
// //   final image = File('${directory.path}/$name');
// //   return File(imagePath).copy(image.path);
// // }
// //
// // Future loadImage(ImageSource? imageSource) async {
// //   try {
// //     final image = await ImagePicker().pickImage(source: imageSource!);
// //     if (image == null) return;
// //     final imagePermanent = await saveImagePermanently(image.path);
// //     setState(() => _image = imagePermanent as XFile?);
// //   } on PlatformException catch (e) {
// //     Get.dialog(Center(
// //       child: Text('Failed to load image $e'),
// //     ));
// //   }
// // }
//
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
//
// class MyApp extends StatefulWidget {
//   MyApp({Key? key}) : super(key: key);
//
//   @override
//   _reg_name_and_dpState createState() => _reg_name_and_dpState();
// }
//
// class reg_name_and_dp extends StatefulWidget {
//   @override
//   State<reg_name_and_dp> createState() => _reg_name_and_dpState();
// }
//
// class _reg_name_and_dpState extends State<reg_name_and_dp> {
//   File? _image;
//
//   Future<File?> saveImagePermanently(String? imagePath) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final name = basename(imagePath!);
//     final image = File('${directory.path}/$name');
//     return File(imagePath).copy(image.path);
//   }
//
//
//   Future loadImage(ImageSource? imageSource) async {
//     try {
//       final image = await ImagePicker().pickImage(source: imageSource!);
//       if (image == null) return;
//       final imagePermanent = await saveImagePermanently(image.path);
//       setState(() => _image = imagePermanent);
//     } on PlatformException catch (e) {
//       Get.dialog(Center(
//         child: Text('Failed to load image $e'),
//       ));
//     }
//   }
//
//   /// Get from gallery
//   _getFromGallery() async {
//     PickedFile? pickedFile = await ImagePicker().getImage(
//       source: ImageSource.gallery,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }
//
//   /// Get from Camera
//   _getFromCamera() async {
//     PickedFile? pickedFile = await ImagePicker().getImage(
//       source: ImageSource.camera,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }
//
//   showAlertDialog(BuildContext context) {
//     // set up the button
//     Widget fromcamera = FlatButton(
//       child: Text(
//         "Open Camera",
//         style: GoogleFonts.dmSans(
//           fontWeight: FontWeight.bold,
//           fontSize: 15.0,
//           color: Color(0xFF2F3F70),
//         ),
//       ),
//       onPressed: () {
//         _getFromCamera();
//         Navigator.pop(context);
//       },
//     );
//
//     Widget fromgallery = FlatButton(
//       child: Text(
//         "Open Gallery",
//         style: GoogleFonts.dmSans(
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF2F3F70),
//             fontSize: 15.0),
//       ),
//       onPressed: () {
//         _getFromGallery();
//         Navigator.pop(context);
//       },
//     );
//
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(DynamicSize.Aaheight(15))),
//       title: Text(
//         "SET/UPLOAD A Profile Picture",
//         style: GoogleFonts.dmSans(fontWeight: FontWeight.bold, fontSize: 15.0),
//       ),
//       content: Text(
//         "Please choose how you want to update your current profile picture",
//         style: GoogleFonts.dmSans(fontWeight: FontWeight.bold, fontSize: 15.0),
//       ),
//       actions: [fromgallery, fromcamera],
//     );
//
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.only(
//             top: DynamicSize.Aaheight(68.0),
//             left: DynamicSize.Aawidth(16.0),
//             right: DynamicSize.Aawidth(16.0)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 GestureDetector(
//                   onTap: (){
//                     showAlertDialog(context);
//                   },
//                   child: SizedBox(
//                     width: DynamicSize.Aawidth(100),
//                     height: DynamicSize.Aaheight(100),
//                     child: _image != null
//                         ? Image.file(
//                       _image!,
//                       fit: BoxFit.cover,
//                     )
//                         : Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                       child: Image.asset('images/user_image.jpg'),
//                     ),
//                   ),
//                   // onTap: () {
//                   //   showAlertDialog(context);
//                   // },
//                   // child: Container(
//                   //   width: DynamicSize.Aawidth(100),
//                   //   height: DynamicSize.Aaheight(100),
//                   //   decoration: BoxDecoration(
//                   //       borderRadius:
//                   //           BorderRadius.circular(DynamicSize.Aaheight(15))),
//                   //   child: _image != null
//                   //       ? ClipRRect(
//                   //           borderRadius:
//                   //               BorderRadius.circular(DynamicSize.Aaheight(15)),
//                   //           child: Image.file(
//                   //             _image!,
//                   //             fit: BoxFit.cover,
//                   //           ),
//                   //         )
//                   //       : ClipRRect(
//                   //           borderRadius:
//                   //               BorderRadius.circular(DynamicSize.Aaheight(15)),
//                   //           child: Image.asset(
//                   //             'images/user_image.jpg',
//                   //             fit: BoxFit.cover,
//                   //           ),
//                   //         ),
//                   // ),
//                 ),
//               ],
//             ),
//             Text(
//               "Profile Photo",
//               style: GoogleFonts.dmSans(
//                   fontSize: DynamicSize.Aaheight(12),
//                   fontWeight: FontWeight.w500),
//             ),
//             Text(
//               "(Optional)",
//               style: GoogleFonts.dmSans(
//                   fontSize: 12.0, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(
//               height: DynamicSize.Aaheight(40),
//             ),
//             Container(
//               padding:
//                   EdgeInsets.symmetric(horizontal: DynamicSize.Aawidth(19)),
//               margin: EdgeInsets.symmetric(horizontal: DynamicSize.Aawidth(25)),
//               alignment: Alignment.center,
//               height: DynamicSize.Aaheight(60),
//               width: DynamicSize.Aawidth(339),
//               decoration: BoxDecoration(
//                 color: Color(0xFFF3F3F3),
//                 borderRadius: BorderRadius.circular(DynamicSize.Aaheight(15)),
//                 boxShadow: [
//                   BoxShadow(
//                     offset: Offset(0, DynamicSize.Aaheight(2)),
//                     color: Color.fromARGB(141, 0, 0, 0),
//                     blurRadius: DynamicSize.Aaheight(3),
//                   ),
//                   BoxShadow(
//                     offset: Offset(DynamicSize.Aawidth(-2), 0),
//                     color: Color(0xFFF3F3F3),
//                     blurRadius: DynamicSize.Aaheight(1),
//                   ),
//                   BoxShadow(
//                     offset: Offset(DynamicSize.Aawidth(2), 0),
//                     color: Color(0xFFF3F3F3),
//                     blurRadius: DynamicSize.Aaheight(1),
//                   ),
//                 ],
//               ),
//               child: TextField(
//                 style: TextStyle(
//                   fontFamily: 'DMSams',
//                   fontSize: DynamicSize.Aaheight(15),
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: DynamicSize.Aawidth(0.5),
//                 ),
//                 decoration: InputDecoration(
//                   hintText: "First name",
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: DynamicSize.Aaheight(15.0),
//             ),
//             Container(
//               padding:
//                   EdgeInsets.symmetric(horizontal: DynamicSize.Aawidth(19)),
//               margin: EdgeInsets.symmetric(horizontal: DynamicSize.Aawidth(25)),
//               alignment: Alignment.center,
//               height: DynamicSize.Aaheight(60),
//               width: DynamicSize.Aawidth(339),
//               decoration: BoxDecoration(
//                 color: Color(0xFFF3F3F3),
//                 borderRadius: BorderRadius.circular(DynamicSize.Aaheight(15)),
//                 boxShadow: [
//                   BoxShadow(
//                     offset: Offset(0, DynamicSize.Aaheight(2)),
//                     color: Color.fromARGB(141, 0, 0, 0),
//                     blurRadius: DynamicSize.Aaheight(3),
//                   ),
//                   BoxShadow(
//                     offset: Offset(DynamicSize.Aawidth(-2), 0),
//                     color: Color(0xFFF3F3F3),
//                     blurRadius: DynamicSize.Aaheight(1),
//                   ),
//                   BoxShadow(
//                     offset: Offset(DynamicSize.Aawidth(2), 0),
//                     color: Color(0xFFF3F3F3),
//                     blurRadius: DynamicSize.Aaheight(1),
//                   ),
//                 ],
//               ),
//               child: TextField(
//                 style: TextStyle(
//                   fontFamily: 'DMSams',
//                   fontSize: DynamicSize.Aaheight(15),
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: DynamicSize.Aawidth(0.5),
//                 ),
//                 decoration: InputDecoration(
//                   hintText: "Last name",
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: DynamicSize.Aaheight(15.0),
//             ),
//             Container(
//               padding:
//                   EdgeInsets.symmetric(horizontal: DynamicSize.Aawidth(19)),
//               margin: EdgeInsets.symmetric(horizontal: DynamicSize.Aawidth(25)),
//               alignment: Alignment.center,
//               height: DynamicSize.Aaheight(60),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Color(0xFFF3F3F3),
//                 borderRadius: BorderRadius.circular(DynamicSize.Aaheight(15)),
//                 boxShadow: [
//                   BoxShadow(
//                     offset: Offset(0, DynamicSize.Aaheight(2)),
//                     color: Color.fromARGB(141, 0, 0, 0),
//                     blurRadius: DynamicSize.Aaheight(3),
//                   ),
//                   BoxShadow(
//                     offset: Offset(DynamicSize.Aawidth(-2), 0),
//                     color: Color(0xFFF3F3F3),
//                     blurRadius: DynamicSize.Aaheight(1),
//                   ),
//                   BoxShadow(
//                     offset: Offset(DynamicSize.Aawidth(2), 0),
//                     color: Color(0xFFF3F3F3),
//                     blurRadius: DynamicSize.Aaheight(1),
//                   ),
//                 ],
//               ),
//               child: TextField(
//                 keyboardType: TextInputType.number,
//                 style: TextStyle(
//                   fontFamily: 'DMSams',
//                   fontSize: DynamicSize.Aaheight(15),
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: DynamicSize.Aawidth(0.5),
//                 ),
//                 decoration: InputDecoration(
//                   hintText: "Phone number",
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: DynamicSize.Aaheight(24.0),
//             ),
//             Padding(
//               padding:
//                   EdgeInsets.symmetric(horizontal: DynamicSize.Aawidth(15)),
//               child: SizedBox(
//                 width: double.infinity,
//                 height: DynamicSize.Aaheight(60),
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/informationScreen');
//                   },
//                   style: TextButton.styleFrom(
//                       backgroundColor: Color(0xFF193669),
//                       shape: RoundedRectangleBorder(
//                         borderRadius:
//                             BorderRadius.circular(DynamicSize.Aaheight(15)),
//                       )
//                       // padding: EdgeInsets.symmetric(horizontal: 1),
//                       ),
//                   child: Text(
//                     'Next',
//                     style: TextStyle(
//                       fontFamily: 'DMSans',
//                       fontStyle: FontStyle.normal,
//                       fontWeight: FontWeight.bold,
//                       fontSize: DynamicSize.Aaheight(18),
//                       letterSpacing: DynamicSize.Aawidth(0.8),
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             // MaterialButton(
//             //   color: Colors.blue,
//             //   child: Text(
//             //     'camera',
//             //     style: TextStyle(color: Colors.white),
//             //   ),
//             //   onPressed: () {
//             //     _getFromCamera();
//             //   },
//             // ),
//             // MaterialButton(
//             //   color: Colors.blue,
//             //   child:Text(
//             //     'galery',
//             //     style: TextStyle(color: Colors.white),
//             //   ),
//             //   onPressed: () {
//             //     _getFromGallery();
//             //   },
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heath_matthews_physio/DynamicSize/size.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// XFile? _image;
//
// class reg_name_and_dp extends StatefulWidget {
//   const reg_name_and_dp({Key? key}) : super(key: key);
//
//   @override
//   _reg_name_and_dpState createState() => _reg_name_and_dpState();
// }
//
// class _reg_name_and_dpState extends State<reg_name_and_dp> {
//
//   @override
//
//   File? _image;
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(50.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GestureDetector(
//               child: CircleAvatar(
//                 radius: 100.0,
//                   backgroundImage: _image!=null?FileImage(_image as File):AssetImage('images/user_image.jpg') as ImageProvider, ),
//               onTap: (){
//                 print("icon was tapped");
//                 // PickImage();
//                 loadImage(ImageSource.gallery);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // void PickImage()async{
// //   XFile? image= await ImagePicker().pickImage(source: ImageSource.gallery);
// //   setState(){
// //     _image=image! ;
// //   }
// // }
// //
//
// Future<File?> saveImagePermanently(String? imagePath) async {
//   final directory = await getApplicationDocumentsDirectory();
//   final name = basename(imagePath!);
//   final image = File('${directory.path}/$name');
//   return File(imagePath).copy(image.path);
// }
//
// Future loadImage(ImageSource? imageSource) async {
//   try {
//     final image = await ImagePicker().pickImage(source: imageSource!);
//     if (image == null) return;
//     final imagePermanent = await saveImagePermanently(image.path);
//     setState(() => _image = imagePermanent as XFile?);
//   } on PlatformException catch (e) {
//     Get.dialog(Center(
//       child: Text('Failed to load image $e'),
//     ));
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _reg_name_and_dpState createState() => _reg_name_and_dpState();
}

class reg_name_and_dp extends StatefulWidget {
  @override
  State<reg_name_and_dp> createState() => _reg_name_and_dpState();
}

class _reg_name_and_dpState extends State<reg_name_and_dp> {
  File? _image;

  Future<File?> saveImagePermanently(String? imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath!);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  //
  // Future loadImage(ImageSource? imageSource) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: imageSource!);
  //     if (image == null) return;
  //     final imagePermanent = await saveImagePermanently(image.path);
  //     setState(() => _image = imagePermanent);
  //   } on PlatformException catch (e) {
  //     Get.dialog(Center(
  //       child: Text('Failed to load image $e'),
  //     ));
  //   }
  // }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget fromcamera = FlatButton(
      child: Text(
        "Open Camera",
        style: GoogleFonts.dmSans(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          color: Color(0xFF2F3F70),
        ),
      ),
      onPressed: () {
        _getFromCamera();
        Navigator.pop(context);
      },
    );

    Widget fromgallery = FlatButton(
      child: Text(
        "Open Gallery",
        style: GoogleFonts.dmSans(
            fontWeight: FontWeight.bold,
            color: Color(0xFF2F3F70),
            fontSize: 15.0),
      ),
      onPressed: () {
        _getFromGallery();
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DynamicSize.Aaheight(15))),
      title: Text(
        "SET/UPLOAD A Profile Picture",
        style: GoogleFonts.dmSans(fontWeight: FontWeight.bold, fontSize: 15.0),
      ),
      content: Text(
        "Please choose how you want to update your current profile picture",
        style: GoogleFonts.dmSans(fontWeight: FontWeight.bold, fontSize: 15.0),
      ),
      actions: [fromgallery, fromcamera],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: DynamicSize.Aaheight(68.0),
            left: DynamicSize.Aawidth(16.0),
            right: DynamicSize.Aawidth(16.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showAlertDialog(context);
                  },
                  child: Container(
                    width: DynamicSize.Aawidth(100),
                    height: DynamicSize.Aaheight(100),
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(DynamicSize.Aaheight(15))),
                    child: _image != null
                        ? ClipRRect(
                      borderRadius:
                      BorderRadius.circular(DynamicSize.Aaheight(15)),
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,
                      ),
                    )
                        : ClipRRect(
                      borderRadius:
                      BorderRadius.circular(DynamicSize.Aaheight(15)),
                      child: Image.asset(
                        'images/user_image.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "Profile Photo",
              style: GoogleFonts.dmSans(
                  fontSize: DynamicSize.Aaheight(12),
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "(Optional)",
              style: GoogleFonts.dmSans(
                  fontSize: 12.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: DynamicSize.Aaheight(40),
            ),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: DynamicSize.Aawidth(19)),
              margin: EdgeInsets.symmetric(horizontal: DynamicSize.Aawidth(25)),
              alignment: Alignment.center,
              height: DynamicSize.Aaheight(60),
              width: DynamicSize.Aawidth(339),
              decoration: BoxDecoration(
                color: Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(DynamicSize.Aaheight(15)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, DynamicSize.Aaheight(2)),
                    color: Color.fromARGB(141, 0, 0, 0),
                    blurRadius: DynamicSize.Aaheight(3),
                  ),
                  BoxShadow(
                    offset: Offset(DynamicSize.Aawidth(-2), 0),
                    color: Color(0xFFF3F3F3),
                    blurRadius: DynamicSize.Aaheight(1),
                  ),
                  BoxShadow(
                    offset: Offset(DynamicSize.Aawidth(2), 0),
                    color: Color(0xFFF3F3F3),
                    blurRadius: DynamicSize.Aaheight(1),
                  ),
                ],
              ),
              child: TextField(
                style: TextStyle(
                  fontFamily: 'DMSams',
                  fontSize: DynamicSize.Aaheight(15),
                  fontWeight: FontWeight.w500,
                  letterSpacing: DynamicSize.Aawidth(0.5),
                ),
                decoration: InputDecoration(
                  hintText: "First name",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: DynamicSize.Aaheight(15.0),
            ),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: DynamicSize.Aawidth(19)),
              margin: EdgeInsets.symmetric(horizontal: DynamicSize.Aawidth(25)),
              alignment: Alignment.center,
              height: DynamicSize.Aaheight(60),
              width: DynamicSize.Aawidth(339),
              decoration: BoxDecoration(
                color: Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(DynamicSize.Aaheight(15)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, DynamicSize.Aaheight(2)),
                    color: Color.fromARGB(141, 0, 0, 0),
                    blurRadius: DynamicSize.Aaheight(3),
                  ),
                  BoxShadow(
                    offset: Offset(DynamicSize.Aawidth(-2), 0),
                    color: Color(0xFFF3F3F3),
                    blurRadius: DynamicSize.Aaheight(1),
                  ),
                  BoxShadow(
                    offset: Offset(DynamicSize.Aawidth(2), 0),
                    color: Color(0xFFF3F3F3),
                    blurRadius: DynamicSize.Aaheight(1),
                  ),
                ],
              ),
              child: TextField(
                style: TextStyle(
                  fontFamily: 'DMSams',
                  fontSize: DynamicSize.Aaheight(15),
                  fontWeight: FontWeight.w500,
                  letterSpacing: DynamicSize.Aawidth(0.5),
                ),
                decoration: InputDecoration(
                  hintText: "Last name",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: DynamicSize.Aaheight(15.0),
            ),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: DynamicSize.Aawidth(19)),
              margin: EdgeInsets.symmetric(horizontal: DynamicSize.Aawidth(25)),
              alignment: Alignment.center,
              height: DynamicSize.Aaheight(60),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(DynamicSize.Aaheight(15)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, DynamicSize.Aaheight(2)),
                    color: Color.fromARGB(141, 0, 0, 0),
                    blurRadius: DynamicSize.Aaheight(3),
                  ),
                  BoxShadow(
                    offset: Offset(DynamicSize.Aawidth(-2), 0),
                    color: Color(0xFFF3F3F3),
                    blurRadius: DynamicSize.Aaheight(1),
                  ),
                  BoxShadow(
                    offset: Offset(DynamicSize.Aawidth(2), 0),
                    color: Color(0xFFF3F3F3),
                    blurRadius: DynamicSize.Aaheight(1),
                  ),
                ],
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontFamily: 'DMSams',
                  fontSize: DynamicSize.Aaheight(15),
                  fontWeight: FontWeight.w500,
                  letterSpacing: DynamicSize.Aawidth(0.5),
                ),
                decoration: InputDecoration(
                  hintText: "Phone number",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: DynamicSize.Aaheight(24.0),
            ),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: DynamicSize.Aawidth(15)),
              child: SizedBox(
                width: double.infinity,
                height: DynamicSize.Aaheight(60),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/informationScreen');
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
                    'Next',
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: DynamicSize.Aaheight(18),
                      letterSpacing: DynamicSize.Aawidth(0.8),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            // MaterialButton(
            //   color: Colors.blue,
            //   child: Text(
            //     'camera',
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   onPressed: () {
            //     _getFromCamera();
            //   },
            // ),
            // MaterialButton(
            //   color: Colors.blue,
            //   child:Text(
            //     'galery',
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   onPressed: () {
            //     _getFromGallery();
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}