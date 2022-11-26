// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:instagram/screens/add_post_screen.dart';
// import 'package:instagram/screens/feed_screen.dart';
// import 'package:instagram/screens/profile_screen.dart';
// import 'package:instagram/screens/search_screen.dart';

import 'package:flutter/material.dart';
import 'package:practo_doctor/bottompages/doctor_details.dart';
import 'package:practo_doctor/bottompages/chats/screens/chat_page.dart';
import 'package:practo_doctor/bottompages/home.dart';
import 'package:practo_doctor/bottompages/setting.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  Home_Screen(),
  Appointment(),
  ChatPage(doctorid: "", userid: ""),
  Setting(),

  // Profile()
  //  Random(),
  //  ChatPage(),
  //  Profile(),
];
