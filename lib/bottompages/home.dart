import 'package:flutter/material.dart';
import 'package:practo_doctor/doctors/appointment/appointment_detail.dart';
import 'package:practo_doctor/doctors/favourite_doctor.dart';
import 'package:practo_doctor/doctors/specialist_doctor.dart';
import 'package:practo_doctor/notification/notifications.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "asset/Vector.png",
              width: 34,
              height: 34,
            ),
          ),
          title: Text(
            'Practo',
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 22, color: Colors.black),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => Notifications()));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                    // margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xffE4ECFE),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: Color(0xff1060D7),
                    )),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    autofocus: false,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Search',
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 6.0, top: 8.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "UpComming Appointments",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      TextButton(onPressed: () {}, child: Text("See All"))
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Card(
                            child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              Appointment_Detail()));
                                },
                                leading: Image.asset("asset/doctor.png"),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dr.Shang chi",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    RichText(
                                      // Controls visual overflow
                                      overflow: TextOverflow.clip,

                                      // Controls how the text should be aligned horizontally
                                      textAlign: TextAlign.end,

                                      // Control the text direction
                                      textDirection: TextDirection.rtl,

                                      // Whether the text should break at soft line breaks
                                      softWrap: true,

                                      // Maximum number of lines for the text to span
                                      maxLines: 1,

                                      // The number of font pixels for each logical pixel
                                      textScaleFactor: 1,
                                      text: TextSpan(
                                        text: 'Messaging  ',
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: const <TextSpan>[
                                          TextSpan(
                                              text: 'Completed',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff55C07E))),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                trailing: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                      // margin: EdgeInsets.symmetric(horizontal: 10),
                                      width: 50,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xffE4ECFE),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Icon(
                                        Icons.call,
                                        color: Color(0xff1060D7),
                                        // size: 15,
                                      )),
                                ),
                                subtitle: Text(
                                  "13:00-13:30 PM",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                )),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Past Appointments",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      TextButton(onPressed: () {}, child: Text("See All"))
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Card(
                            child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              Appointment_Detail()));
                                },
                                leading: Image.asset("asset/doctor.png"),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dr.Shang chi",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    RichText(
                                      // Controls visual overflow
                                      overflow: TextOverflow.clip,

                                      // Controls how the text should be aligned horizontally
                                      textAlign: TextAlign.end,

                                      // Control the text direction
                                      textDirection: TextDirection.rtl,

                                      // Whether the text should break at soft line breaks
                                      softWrap: true,

                                      // Maximum number of lines for the text to span
                                      maxLines: 1,

                                      // The number of font pixels for each logical pixel
                                      textScaleFactor: 1,
                                      text: TextSpan(
                                        text: 'Messaging  ',
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: const <TextSpan>[
                                          TextSpan(
                                              text: 'Completed',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff55C07E))),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                trailing: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                      // margin: EdgeInsets.symmetric(horizontal: 10),
                                      width: 50,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xffE4ECFE),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Icon(
                                        Icons.call,
                                        color: Color(0xff1060D7),
                                        // size: 15,
                                      )),
                                ),
                                subtitle: Text(
                                  "13:00-13:30 PM",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                )),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
