// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import './upload_document.dart';

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
  late bool selectionChanged = false;
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
                        color: Colors.transparent),
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
                    hint: const Text(
                      'Select document',
                      style: TextStyle(fontSize: 18),
                    ),
                    isExpanded: true,
                    items: _dropdownValues.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 18),
                        ),
                      );
                    }).toList(),
                    // ignore: avoid_types_as_parameter_names
                    onChanged: (Dart_CObject) {
                      selectionChanged = true;
                      setState(() {});
                    },
                    style: const TextStyle(
                      color: Colors.purple,
                      //backgroundColor: Colors.grey,
                    ),
                    // value: _dropdownValues.first,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 16.0)),
                Visibility(
                    visible: selectionChanged,
                    child:
                        FrontAndRearImages(title: 'Upload your Aathar card')),
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

  void showFrontAndRear(int d) {
// ignore: unrelated_type_equality_checks
    if (d == true) {
      FrontAndRearImages(title: 'Upload your Aathar card');
    } else {}
  }
}

List<Map<String, dynamic>> options = [
  {'title': 'minLength', 'value': 'minLength', 'icon': 'chat.svg'},
  {'title': 'maxLength', 'value': 'maxLength', 'icon': 'sbi.png'},
  {'title': 'regex', 'value': 'regex', 'icon': 'hdfc.png'},
  {'title': 'required', 'value': 'required', 'icon': 'government.svg'},
];
