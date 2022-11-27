import '../app_theme.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../widgets/widgets.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key, required this.user}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
  final User user;
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Jane Cooper',
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 20, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.video_call,
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.phone,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      backgroundColor: MyTheme.kPrimaryColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Conversation(user: widget.user),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                suffixIcon: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween, // added line
                                  mainAxisSize: MainAxisSize.min, // added line
                                  children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.attach_file)),
                                  ],
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 0.0),
                                ),
                                border: const OutlineInputBorder(),
                                fillColor: Color(0xffF1F1F1),
                                filled: true,
                                hintText: 'Type Something.....',
                                hintStyle: TextStyle(color: Colors.grey[500]),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              sendMessage(controller.text.trim(), 0);
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.blue, shape: BoxShape.circle),
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  
  void sendMessage(String trim, int i) {}
}
