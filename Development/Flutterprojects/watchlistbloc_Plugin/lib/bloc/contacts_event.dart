import 'package:bloc100/Models/contacts.dart';

abstract class ContactsEvent {}

class FetchContactEvent extends ContactsEvent {}

class SortContactEvent extends ContactsEvent {
  List<Contacts> listContacts;
  String sortingStr;
  SortContactEvent({required this.listContacts, required this.sortingStr});
}

class FetchListInTab extends ContactsEvent {
  int index;
  List<Contacts> contactList;
  FetchListInTab({required this.index, required this.contactList});
}
