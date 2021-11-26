// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:bloc100/Models/contacts.dart';
import 'package:bloc100/Repository/api_call_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'contacts_event.dart';
import 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(ContactsInitial()) {
    ApiCallRepository repository = ApiCallRepository();

    on((event, emit) async {
      if (event is FetchContactEvent) {
        emit(ContactsLoadingState());
        try {
          List<Contacts> contacts = await repository.fetchContacs();
          emit(ContactsLoadedState(listContacts: contacts));
        } catch (e) {
          emit(ContactsErrorState(message: e.toString()));
        }
      }
      if (event is FetchListInTab) {
        emit(ContactsInTabState(
            listContacts: event.contactList
                .sublist(event.index * 20, (event.index + 1) * 20)));
      }
      if (event is SortContactEvent) {
        emit(ContactsInTabState(
            listContacts: event.listContacts, sortingType: event.sortingStr));
      }
    });
  }
}
