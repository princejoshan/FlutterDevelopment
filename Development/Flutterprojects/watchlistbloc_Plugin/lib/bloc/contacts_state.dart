import 'package:bloc100/Models/contacts.dart';

abstract class ContactsState {}

class ContactsInitial extends ContactsState {}

class ContactsLoadingState extends ContactsState {}

class ContactsLoadedState extends ContactsState {
  List<Contacts> listContacts;
  ContactsLoadedState({required this.listContacts});
}

class ContactsErrorState extends ContactsState {
  String message;
  ContactsErrorState({required this.message});
}

class ContactsInTabState extends ContactsState {
  List<Contacts> listContacts;
  String? sortingType;
  ContactsInTabState({required this.listContacts, this.sortingType});
}
