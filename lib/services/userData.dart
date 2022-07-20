import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:heath_matthews_physio/utils/loadingspinner.dart';
import 'dart:developer' as developer;

class userData {
  final String uid;
  final String email;
  userData({required this.uid, required this.email});

  //Collection Reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final storage = FirebaseStorage.instance.ref();

  Future<String?> uploadUserData({
    required BuildContext context,
    required String firstName,
    required String lastName,
    required String phoneNo,
    required String gender,
    required int height,
    required int weight,
    required int age,
    required File? image,
  }) async {
    String? imageUrl = null;
    loadingSpinner(context);
    if (image != null) {
      try {
        final ref = await storage.child('User_Profile_Pic/${uid}');
        await ref.putFile(image);
        imageUrl = await ref.getDownloadURL();
      } on FirebaseException catch (e) {
        Navigator.of(context, rootNavigator: true).pop();
        developer.log('\x1B[32m------1---${e.message}--------\x1B[0m');
        return e.message;
      }
    }
    try {
      await userCollection.doc(uid).set({
        "first_name": firstName,
        "last_name": lastName,
        "contact_no": phoneNo,
        'email': email,
        "age": age,
        "gender": gender,
        "height": height,
        "weight": weight,
        "imageUrl": imageUrl,
      });
    } on FirebaseException catch (e) {
      Navigator.of(context, rootNavigator: true).pop();
      developer.log('\x1B[32m------2---${e.message}--------\x1B[0m');
      return e.message;
    }
    Navigator.of(context, rootNavigator: true).pop();
    return null;
  }
}
