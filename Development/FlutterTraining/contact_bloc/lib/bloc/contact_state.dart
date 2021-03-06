import 'package:contact_bloc/model/contact_model.dart';

abstract class ContactState {}

class ContactsInitial extends ContactState {}

class ContactsFetchingState extends ContactState {}

class ContactsLoadingState extends ContactState {}

class ContactFetchedState extends ContactState {
  late List<Contacts> listContacts;
  ContactFetchedState({required this.listContacts});
}

class TabChangedState extends ContactState {
  List<Contacts> listContacts;
  String? sortingType;
  TabChangedState({required this.listContacts, this.sortingType});
}

class ContactsErrorState extends ContactState {
  String message;
  ContactsErrorState({required this.message});
}
