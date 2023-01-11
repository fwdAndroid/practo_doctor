import 'package:flutter/material.dart';

class FilePreview extends StatefulWidget {
  var filePreview;
  FilePreview({super.key, required this.filePreview});

  @override
  State<FilePreview> createState() => _FilePreviewState();
}

class _FilePreviewState extends State<FilePreview> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: widget.filePreview,
          )
        ],
      ),
    );
  }
}
