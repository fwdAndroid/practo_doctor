import '../widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final doctorid;
  final userid;
  final name;

  ChatPage({Key? key, required this.doctorid, required this.userid, required this.name})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AllChats(
        doctorid: doctorid,
        name: name,
        userid: userid,
      ),
    );
  }
}
