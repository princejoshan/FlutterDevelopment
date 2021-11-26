import 'package:http/http.dart' as http;
// ignore: unused_import
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:watchlist/Model/contacts_model.dart';

class SendRequest {
  Future<List<Contacts>> fetchContacts() async {
    final response = await http.get(Uri.parse(
        'http://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var contactList = ContactList.fromJson(jsonDecode(response.body));
      return contactList.contacts;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
