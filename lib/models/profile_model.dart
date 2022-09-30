import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  String uid;
  String address;
  String email;
  String name;
  String hospital;
  String specialization;
  String phoneNumber;
  String photoURL;

  ProfileModel({
    required this.uid,
    required this.hospital,
    required this.specialization,
    required this.email,
    required this.photoURL,
    required this.address,
    required this.name,
    required this.phoneNumber,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'name': name,
        'uid': uid,
        'email': email,
        'phoneNumber': phoneNumber,
        'photoURL': photoURL,
        'specialization': specialization,
        'address': address,
        'hospital': hospital
      };

  ///
  static ProfileModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return ProfileModel(
        specialization: snapshot['specialization'],
        hospital: snapshot['hospital'],
        name: snapshot['name'],
        uid: snapshot['uid'],
        email: snapshot['email'],
        photoURL: snapshot['photoURL'],
        phoneNumber: snapshot['phoneNumber'],
        address: snapshot['address']);
  }
}
