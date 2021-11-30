import 'package:contact_bloc/model/contact_model.dart';

abstract class ContactEvent {}

class FetchContactEvent extends ContactEvent {}

class FetchContacts extends ContactEvent {
  int index;
  List<Contacts> contactList;
  FetchContacts({required this.index, required this.contactList});
}
