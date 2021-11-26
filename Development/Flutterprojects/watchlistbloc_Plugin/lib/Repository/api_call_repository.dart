import 'package:bloc100/Models/contacts.dart';
import 'package:bloc100/NetworkFiles/api_provider.dart';
import 'dart:async';

class ApiCallRepository {
  final ApiProvider _provider = ApiProvider();

  Future<List<Contacts>> fetchContacs() async {
    final response = await _provider
        .get('http://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts');
    var contactList = ContactList.fromJson(response);
    return contactList.contacts;
  }
}
