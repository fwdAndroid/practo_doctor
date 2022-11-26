import '../widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final userid;
  final doctorid;
  ChatPage({Key? key, required this.doctorid, required this.userid})
      : super(
          key: key,
        );

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.doctorid);
    print(widget.userid);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.doctorid);
    print(widget.userid);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AllChats(),
            ],
          ),
        ),
      ),
    );
  }
}
