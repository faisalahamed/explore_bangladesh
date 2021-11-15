import 'dart:io';

import 'package:explore_bangladesh/db/upload_image_db.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  XFile? _image;
  String? url;

  final ImagePicker _picker = ImagePicker();

  void updateImage(XFile file) {
    setState(() {
      _image = file;
      uploadToFirestore();
    });
  }

  void uploadToFirestore() async {
    UploadImageDb uploadImage = UploadImageDb();
    String imageUrl = await uploadImage.uploadAndGetUploadUrl(_image);
    setState(() {
      url = imageUrl;
    });
  }

  Future<void> getImage() async {
    XFile? gotimage =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 5);
    if (gotimage != null) {
      updateImage(gotimage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            child: (_image != null)
                ? Image.file(File(_image!.path))
                : const Text('no image'),
          ),
          url != null ? Image.network(url!) : Container()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
      ),
    );
  }
}
