import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool readOnly;
  final bool prefixIcon;
  final Function()? getImage;
  const InputTextField({
    required this.labelText,
    required this.controller,
    this.readOnly = false,
    this.prefixIcon = false,
    this.getImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        validator: (val) => inputVadidation(val),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            prefixIcon: prefixIcon ? addImageIcon() : null,
            label: Text(labelText),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      ),
    );
  }

  Padding addImageIcon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: getImage,
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.grey)),
        child: const Text(
          'Select Image',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  String? inputVadidation(String? value) {
    if (labelText == 'Phone') {
      return null;
    }
    if (value != null && value.length < 3) {
      return 'Valid $labelText is Required';
    }

    return null;
  }
}
