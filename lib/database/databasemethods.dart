import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practo_doctor/database/storage_methods.dart';
import 'package:practo_doctor/models/profile_model.dart';

class DatabaseMethods {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//OTP Number Add
  Future<String> numberAdd() async {
    String res = 'Some error occured';
    try {
      //Add User to the database with modal
      ProfileModel userModel = ProfileModel(
        hospital: '',
        specialization: '',
        name: '',
        uid: FirebaseAuth.instance.currentUser!.uid,
        email: '',
        address: '',
        phoneNumber: FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
        photoURL: '',
      );
      await firebaseFirestore
          .collection('doctors')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(
            userModel.toJson(),
          );
      res = 'success';
      debugPrint(res);
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Profile Details
  Future<String> profileDetail({
    required String email,
    required String uid,
    required String name,
    required String address,
    required String hospital,
    required Uint8List file,
    required String specialization
  }) async {
    String res = 'Some error occured';

    try {
      if (email.isNotEmpty || name.isNotEmpty) {
        String photoURL = await StorageMethods()
            .uploadImageToStorage('ProfilePics', file, false);
        //Add User to the database with modal

        ProfileModel userModel = ProfileModel(
          hospital: hospital,
          specialization: specialization,
          name: name,
          address: address,
          uid: FirebaseAuth.instance.currentUser!.uid,
          email: email,
          phoneNumber:
              FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
          photoURL: photoURL,
        );
        await firebaseFirestore
            .collection('doctors')
            .doc(uid)
            .update(userModel.toJson());
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
