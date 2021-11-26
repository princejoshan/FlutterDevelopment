import 'package:flutter/material.dart';
import 'package:watchlist/Model/contacts_model.dart';
import '../HttpService/api_service.dart';

class MyWatclist extends StatelessWidget {
  const MyWatclist({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _getContactListData(context);
  }

  FutureBuilder<List<Contacts>> _getContactListData(BuildContext context) {
    return FutureBuilder<List<Contacts>>(
      future: SendRequest().fetchContacts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Contacts> contactList = snapshot.data!;
          return _buildContactListView(context, contactList);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildContactListView(BuildContext context, List<Contacts> posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              posts[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts[index].contacts.toString()),
            trailing: const Icon(Icons.person),
          ),
        );
      },
    );
  }
}
