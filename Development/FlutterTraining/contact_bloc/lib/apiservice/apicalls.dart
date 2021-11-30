import 'package:contact_bloc/httpconnection/request.dart';
import 'package:contact_bloc/model/contact_model.dart';

class ApiCall {
  final Request httpRequest = Request();

  Future<List<Contacts>> fetchContacts() async {
    final response = await httpRequest
        .get('http://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts');
    var contactList = ContactList.fromJson(response);
    return contactList.contacts;
  }
}
