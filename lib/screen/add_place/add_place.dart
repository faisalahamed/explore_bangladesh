import 'dart:io';

import 'package:explore_bangladesh/constants/city_list.dart';
import 'package:explore_bangladesh/constants/place_type.dart';
import 'package:explore_bangladesh/db/place_db.dart';
import 'package:explore_bangladesh/db/upload_image_db.dart';
import 'package:explore_bangladesh/model/place.dart';
import 'package:explore_bangladesh/screen/add_place/addplace_widget/input_text_field.dart';
import 'package:explore_bangladesh/widgets/my_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPlace extends StatefulWidget {
  const AddPlace({Key? key}) : super(key: key);

  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  TextEditingController placeName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController placetypeController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool formValidationStatus = false;

  XFile? _image;
  String? url;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Place'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          onChanged: _formValidation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width,
                child: CircleAvatar(
                  radius: 100,
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: getImage,
                  ),
                  backgroundImage:
                      (_image != null) ? FileImage(File(_image!.path)) : null,
                ),
              ),
              InputTextField(
                labelText: "Place Name",
                controller: placeName,
              ),
              InputTextField(
                labelText: "Address",
                controller: address,
              ),
              MyDropDown(
                  placeTypeConstant: cityListConstant,
                  controller: district,
                  title: 'Select City'),
              MyDropDown(
                  placeTypeConstant: placeTypeConstant,
                  controller: placetypeController,
                  title: 'Select Place Type'),
              InputTextField(
                labelText: "Phone",
                controller: phone,
              ),
              InputTextField(
                controller: imageController,
                labelText: "Select Image",
                readOnly: true,
                prefixIcon: true,
                getImage: getImage,
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.blue),
                    enableFeedback: false),
                onPressed:
                    formValidationStatus ? uploadToFirestore : _formValidation,
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addPlacetoDb() {
    var place = Place(
      placename: placeName.text,
      image: url!,
      district: district.text,
      address: address.text,
      type: placetypeController.text,
      phone: phone.text,
    );
    PlaceDb addPlace = PlaceDb(place: place);
    addPlace.addPlaceDb();
    Navigator.of(context).pushNamed('/');

    print('success');

    // AddPlace.getUsers();
    // print(place.status);
  }

  void _formValidation() {
    final bool isValid = _formKey.currentState!.validate();

    if (isValid) {
      setState(() {
        if (placetypeController.text != '' && district.text != '') {
          formValidationStatus = true;
        }
      });
    }
  }

  getImage() async {
    XFile? gotimage =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 25);
    if (gotimage != null) {
      setState(() {
        _image = gotimage;
        imageController.text = gotimage.path;
      });
    }
  }

  void uploadToFirestore() async {
    UploadImageDb uploadImage = UploadImageDb();
    String imageUrl = await uploadImage.uploadAndGetUploadUrl(_image);
    setState(() {
      url = imageUrl;
    });
    if (url != null) {
      addPlacetoDb();
    }
  }
}
