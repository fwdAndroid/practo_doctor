import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practo_doctor/schdule/add_schdule.dart';

class Schdule extends StatefulWidget {
  const Schdule({Key? key}) : super(key: key);

  @override
  State<Schdule> createState() => _SchduleState();
}

class _SchduleState extends State<Schdule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Date And Time"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.schedule,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (builder) => AddSchdule()));
          }),
          body: Column(
            children: [
              
            ],
          ),
    );
  }
}
