import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageDb {
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  Reference getFirebaseStorageRef() {
    return _storage.ref().child('uploads/image' + DateTime.now().toString());
  }

  Future<String> uploadAndGetUploadUrl(XFile? _image) async {
    Reference ref =
        _storage.ref().child('uploads/image' + DateTime.now().toString());
    _image != null
        ? await ref.putFile(File(_image.path))
        : print('image path is empty');
    String imageUrl = await ref.getDownloadURL();
    return imageUrl;
  }
}
