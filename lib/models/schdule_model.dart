import 'package:cloud_firestore/cloud_firestore.dart';

//Modal Need to Be Created in profile Page is
// Disear Name which he trated,
// experience,

class SchduleModel {
  String uid;
  String time;
  String day;

  SchduleModel({
    required this.uid,
    required this.time,
    required this.day,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'time': time,
        'day': day,
        'uid': uid,
      };

  ///
  static SchduleModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return SchduleModel(
      time: snapshot['time'],
      day: snapshot['day'],
      uid: snapshot['uid'],
    );
  }
}
