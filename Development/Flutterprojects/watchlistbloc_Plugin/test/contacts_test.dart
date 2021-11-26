import 'package:bloc100/Models/contacts.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<dynamic> contactsJson = [
    {
      "id": "1",
      "name": "name 1",
      "Contacts": "1-355-184-1639",
      "url":
          "https://s3.amazonaws.com/uifaces/faces/twitter/jpscribbles/128.jpg"
    }
  ];
  test('contacts data creation test', () {
    ContactList contactList = ContactList.fromJson(contactsJson);
    expect(contactList.contacts.length, 1);
    expect(contactList.contacts[0].id, '1');
    expect(contactList.contacts[0].name, 'name 1');
  });
}
