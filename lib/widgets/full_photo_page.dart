import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:photo_view/photo_view.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class FullPhotoPage extends StatefulWidget {
  final String url;

  FullPhotoPage({Key? key, required this.url}) : super(key: key);

  @override
  State<FullPhotoPage> createState() => _FullPhotoPageState();
}

class _FullPhotoPageState extends State<FullPhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                final tempDir = await getTemporaryDirectory();
                final path = '${tempDir.path}/myfile.png';
                await Dio().download(widget.url, path);
                GallerySaver.saveImage(path);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Image is Downloaded")));
              },
              icon: Icon(
                Icons.download,
                color: Colors.white,
              ))
        ],
        title: Text(
          "Full Photo",
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(widget.url),
        ),
      ),
    );
  }
}
