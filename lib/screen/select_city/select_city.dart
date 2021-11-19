import 'package:explore_bangladesh/constants/city_list.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class SelectCity extends StatefulWidget {
  const SelectCity({Key? key}) : super(key: key);

  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late final TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('select City'),
      ),
      body: Form(
        key: _formKey,
        child: SearchField(
          controller: _controller,
          suggestions: cityListConstant,
          validator: (input) {
            if (!cityListConstant.contains(input) || input == null) {
              print('---------------valid');
              return 'Please Enter a valid State';
            }
            print('---------------invalid input');
            return null;
          },
        ),
      ),
    );
  }
}
