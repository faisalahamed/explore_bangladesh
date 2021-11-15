import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  final List<String> placeTypeConstant;
  final TextEditingController controller;
  final String title;
  const MyDropDown(
      {required this.controller,
      required this.title,
      required this.placeTypeConstant,
      Key? key})
      : super(key: key);

  @override
  _MyDropDownState createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  String? _dropDownValue;
  bool dropdownBorderStatus = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
        validator: (String? val) => dropdownInputVadidation(val),
        dropdownColor: Colors.white,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
                color: dropdownBorderStatus ? Colors.red : Colors.black),
          ),
        ),
        hint: _dropDownValue == null
            ? const Text('Select Place Type')
            : Text(
                _dropDownValue!,
                style: const TextStyle(color: Colors.black),
              ),
        isExpanded: true,
        iconSize: 30.0,
        style: const TextStyle(color: Colors.blue),
        items: widget.placeTypeConstant.map(
          (val) {
            return DropdownMenuItem<String>(
              alignment: Alignment.center,
              value: val,
              child: Text(
                val,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            );
          },
        ).toList(),
        onChanged: (String? val) {
          setState(
            () {
              _dropDownValue = val!;
              widget.controller.text = val;
            },
          );
        },
      ),
    );
  }

  String? dropdownInputVadidation(String? value) {
    if (value == null) {
      setState(() {
        dropdownBorderStatus = true;
      });
    } else {
      setState(() {
        dropdownBorderStatus = false;
      });
    }
  }
}
