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
          doctorAddres: '',
          doctorCertificationImages: [],
          doctorDOB: '',
          doctorDesc: '',
          doctorEmail: '',
          doctorHospital: '',
          doctorName: '',
          doctorPhotoURL: '',
          doctorSpecialization: '',
          doctortreatedDiseacs: '',
          uid: '',
          experience: '',
          phoneNumber: '');
      await firebaseFirestore
          .collection('doctorsprofile')
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
    required doctorAddres,
    required doctorDOB,
    required doctorDesc,
    required doctorEmail,
    required doctorHospital,
    required doctorName,
    required doctorSpecialization,
    required doctortreatedDiseacs,
    required uid,
    required Uint8List file,
    required experience,
  }) async {
    String res = 'Some error occured';

    try {
      if (doctorEmail.isNotEmpty || doctorHospital.isNotEmpty || doctorDOB) {
        String photoURL = await StorageMethods()
            .uploadImageToStorage('ProfilePics', file, false);
        //Add User to the database with modal

        ProfileModel userModel = ProfileModel(
            doctorCertificationImages: [],
            uid: uid,
            experience: experience,
            doctorAddres: doctorAddres,
            doctorDOB: doctorDOB,
            doctorDesc: doctorDesc,
            doctorEmail: doctorEmail,
            doctorHospital: doctorHospital,
            doctorName: doctorName,
            doctorPhotoURL: photoURL,
            doctorSpecialization: doctorSpecialization,
            doctortreatedDiseacs: doctortreatedDiseacs,
            phoneNumber:
                FirebaseAuth.instance.currentUser!.phoneNumber.toString());
        await firebaseFirestore
            .collection('doctorsprofile')
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
