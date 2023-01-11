import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';

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
      appBar: AppBar(title: Text(widget.filePreview), actions: [
        IconButton(
          onPressed: () async {
            Map<Permission, PermissionStatus> statuses = await [
              Permission.storage,
              //add more permission to request here.
            ].request();
            if (statuses[Permission.storage]!.isGranted) {
              // // var path = "/storage/emulated/0/Download/";
              // // var downloadDir = io.Directory(path);

              // // if (downloadDir != null) {
              // //   String savename = widget.filePreview;
              // //   String savePath = downloadDir.path + "/$savename";
              //   print(savePath);
              //output:  /storage/emulated/0/Download/banner.png

              try {
                final tempDir = await getTemporaryDirectory();
                final path = '${tempDir.path}/myfile.png';
                await Dio().download(widget.filePreview, path,
                    onReceiveProgress: (received, total) {
                  if (total != -1) {
                    print((received / total * 100).toStringAsFixed(0) + "%");
                    //you can build progressbar feature too
                  }
                });
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("File is Downloaded")));
                print("File is saved to download folder.");
              } on DioError catch (e) {
                print(e.message);
              }
            } else {
              print("No permission to read and write.");
            }
          },
          icon: Icon(Icons.download_for_offline),
        ),
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              alignment: Alignment.center,
              child: Text(
                widget.filePreview,
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
