import 'package:flutter/material.dart';
import 'package:contact_bloc/model/contact_model.dart';

// ignore: must_be_immutable
class TabbarView extends StatelessWidget {
  TabbarView({Key? key, required this.contactList}) : super(key: key);
  List<Contacts> contactList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: ListTile(
              title: Text(contactList[index].name),
              subtitle: Text(contactList[index].contacts),
              // trailing: Image.asset(Icons.roofing_sharp),
            ),
          );
        });
  }
}
