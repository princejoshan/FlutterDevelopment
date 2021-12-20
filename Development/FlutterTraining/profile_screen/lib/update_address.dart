// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';

class UpdateAddress extends StatefulWidget {
  const UpdateAddress({Key? key}) : super(key: key);

  @override
  UpdateState createState() => UpdateState();
}

class UpdateState extends State<UpdateAddress> {
  final List<String> _dropdownValues = [
    "One",
    "Two",
    "Three",
    "Four",
    "Five"
  ]; //The list of values we want on the dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(244, 246, 250, 1),
          leading:
              const IconButton(onPressed: null, icon: Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(padding: EdgeInsets.only(top: 16.0)),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Update Address',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 16.0)),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'You need to select and upload an address proof.we will verify the document and update your address instantly',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 50.0)),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Select address proof',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 16.0)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    border: Border.all(
                        color: Colors.grey,
                        style: BorderStyle.solid,
                        width: 0.80),
                  ),
                  child: DropdownButton<String>(
                    underline: DropdownButtonHideUnderline(child: Container()),
                    hint: const Text('Select document'),
                    isExpanded: true,
                    items: _dropdownValues.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    // ignore: avoid_types_as_parameter_names
                    onChanged: (Dart_CObject) {
                      setState(() {});
                    },
                    value: _dropdownValues.first,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    padding: const EdgeInsets.all(10.0),
                    onPressed: () {},
                    child: const Text('Submit'),
                  ),
                )
              ]),
        ));
  }
}
