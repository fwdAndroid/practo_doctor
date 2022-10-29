import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practo_doctor/bottom.dart';
import 'package:practo_doctor/database/databasemethods.dart';
import 'package:practo_doctor/profile/doctor_certificates.dart';
import 'package:practo_doctor/widgets/textfieldwidget.dart';
import 'package:practo_doctor/widgets/utils.dart';

class Edit_Setting extends StatefulWidget {
  const Edit_Setting({Key? key}) : super(key: key);

  @override
  _Edit_SettingState createState() => _Edit_SettingState();
}

class _Edit_SettingState extends State<Edit_Setting> {
  final TextEditingController doctornameController = TextEditingController();
  final TextEditingController doctoremailController = TextEditingController();
  final TextEditingController doctorAddressController = TextEditingController();
  final TextEditingController doctorHospitalNameController =
      TextEditingController();
  final TextEditingController doctorDateofBirthContorller =
      TextEditingController();
  final TextEditingController doctorExperienceController =
      TextEditingController();
  final TextEditingController doctorDiseaseController = TextEditingController();

  final TextEditingController doctorDescriptionController =
      TextEditingController();
  final TextEditingController doctorSpecializationCOntroller =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  Uint8List? _image;

  bool _isLoading = false;

  final ImagePicker _picker = ImagePicker();
  File? imageUrl;
  String imageLink = "";
  void getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageUrl = File(image!.path);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    doctornameController.clear();
    doctoremailController.clear();
    doctorAddressController.clear();
    doctorHospitalNameController.clear();
    doctorDateofBirthContorller.clear();
    doctorExperienceController.clear();
    doctorDiseaseController.clear();

    doctorDescriptionController.clear();
    doctorSpecializationCOntroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text(
            "Edit Doctor Profile",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("doctorsprofile")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return new CircularProgressIndicator();
                }
                var document = snapshot.data;
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              NetworkImage(document['doctorPhotoURL']),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          document['doctorName'],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        children: [
                          Text(document['doctorName']),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormInputField(
                        hintText: document['doctorHospital'],
                        textInputType: TextInputType.text,
                        controller: doctorHospitalNameController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormInputField(
                        hintText: document['doctorSpecialization'],
                        textInputType: TextInputType.text,
                        controller: doctorSpecializationCOntroller,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormInputField(
                        hintText: document['doctortreatedDiseacs'],
                        textInputType: TextInputType.text,
                        controller: doctorDiseaseController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormInputField(
                        hintText: document['doctorDesc'],
                        textInputType: TextInputType.text,
                        controller: doctorDescriptionController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormInputField(
                        hintText: document['doctorAddres'],
                        textInputType: TextInputType.text,
                        controller: doctorAddressController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormInputField(
                        hintText: document['experience'],
                        textInputType: TextInputType.text,
                        controller: doctorExperienceController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.width / 3,
                        child: Text(document['doctorDOB'] //label text of field
                            ),
                        //set it true, so that user will not able to edit text
                        // onTap: () async {
                        //   DateTime? pickedDate = await showDatePicker(
                        //       context: context,
                        //       initialDate: DateTime.now(),
                        //       firstDate: DateTime(1950),
                        //       //DateTime.now() - not to allow to choose before today.
                        //       lastDate: DateTime(2100));

                        //   if (pickedDate != null) {
                        //     print(
                        //         pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        //     String formattedDate =
                        //         DateFormat('yyyy-MM-dd').format(pickedDate);
                        //     print(
                        //         formattedDate); //formatted date output using intl package =>  2021-03-16
                        //     setState(() {
                        //       // doctorDateofBirthContorller.text =
                        //       //     formattedDate; //set output date to TextField value.
                        //     });
                        //   } else {}
                        // },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xfff0092E1).withOpacity(.6),
                            fixedSize: const Size(350, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                          ),
                          onPressed: Edit_Setting,
                          child: _isLoading == true
                              ? const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                )
                              : Text(
                                  'Update',
                                  style: GoogleFonts.getFont('Montserrat',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal),
                                ),
                        ),
                      ),
                    ]);
              }),
        ));
  }

  // Select Image From Gallery
  selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _image = ui;
    });
  }

  Edit_Setting() async {
    setState(() {
      _isLoading = true;
    });
    String rse = await DatabaseMethods().profileDetail(
      doctortreatedDiseacs: doctorDiseaseController.text,
      doctorDesc: doctorDescriptionController.text,
      doctorDOB: doctorDateofBirthContorller.text,
      experience: doctorExperienceController.text,
      doctorEmail: doctoremailController.text,
      doctorName: doctornameController.text,
      doctorAddres: doctorAddressController.text,
      file: _image!,
      doctorSpecialization: doctorSpecializationCOntroller.text,
      doctorHospital: doctorHospitalNameController.text,
      uid: FirebaseAuth.instance.currentUser!.uid,
    );

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if (rse == 'success') {
      showSnakBar(rse, context);
      Navigator.push(context,
          MaterialPageRoute(builder: (builder) => MobileScreenLayout()));
    } else {
      showSnakBar(rse, context);
    }
  }
}
