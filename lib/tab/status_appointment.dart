import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StatusAppointment extends StatefulWidget {
  const StatusAppointment({super.key});

  @override
  State<StatusAppointment> createState() => _StatusAppointmentState();
}

class _StatusAppointmentState extends State<StatusAppointment> {
  var id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FirebaseAuth.instance.currentUser != null
            ? StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('appointments')
                    // .where(
                    //   'status',
                    //   isNotEqualTo: 'pending',
                    // )
                    .where('status', isEqualTo: "pending")
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  }
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Text(
                        //     '29 Decemeber 2002',
                        //     textAlign: TextAlign.start,
                        //     style:
                        //         TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
                        //   ),
                        // ),
                        Container(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                Map<String, dynamic> snap =
                                    snapshot.data!.docs[index].data()
                                        as Map<String, dynamic>;
                                return Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (builder) =>
                                        //         AppointCurrentDetail(),
                                        //   ),
                                        // );
                                      },
                                      title: Text(snap['name']),
                                      subtitle: Text(snap['problem']),
                                      trailing: Column(
                                        children: [
                                          Expanded(
                                            child: IconButton(
                                              onPressed: () async {
                                                await approveAppointment(id);
                                              },
                                              icon: Icon(
                                                Icons.check,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: IconButton(
                                              onPressed: () {
                                                cancelAppointment(
                                                    key: "status",
                                                    value: "cancel");
                                              },
                                              icon: Icon(
                                                Icons.close,
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider()
                                  ],
                                );
                              }),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                })
            : const Center(
                child: Text('No Appointment Approval is needed'),
              ),
      ),
    );
  }

  //Update Functions

  Future<String> approveAppointment(String id) async {
    String res = 'Some error occured';
    debugPrint(res);

    try {
      await FirebaseFirestore.instance
          .collection('appointments')
          .doc(id)
          .update({
        "status": "approve",
      });
      res = 'success';
      debugPrint(res);
    } on FirebaseException catch (e) {
      res = e.toString();
      debugPrint(res);
    }
    return res;
  }

  //cancle
  Future<String> cancelAppointment({
    required String key,
    required String value,
  }) async {
    String res = 'Some error occured';
    debugPrint(res);

    try {
      await FirebaseFirestore.instance
          .collection('appointments')
          .doc(id)
          .update({
        key: value,
      });
      res = 'success';
      debugPrint(res);
    } on FirebaseException catch (e) {
      res = e.toString();
      debugPrint(res);
    }
    return res;
  }
}
