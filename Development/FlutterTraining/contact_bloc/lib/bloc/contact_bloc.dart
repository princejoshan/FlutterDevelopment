// ignore: avoid_web_libraries_in_flutter
import 'package:contact_bloc/apiservice/apicalls.dart';
import 'package:contact_bloc/model/contact_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'contact_events.dart';
import 'contact_state.dart';

class ContactListBloc extends Bloc<ContactEvent, ContactState> {
  ContactListBloc() : super(ContactsInitial()) {
    ApiCall request = ApiCall();
    // ignore: use_function_type_syntax_for_parameters
    on((event, emit) async {
      if (event is FetchContactEvent) {
        emit(ContactsLoadingState());
        try {
          List<Contacts> contacts = await request.fetchContacts();
          emit(ContactFetchedState(listContacts: contacts));
        } catch (e) {
          emit(ContactsErrorState(message: e.toString()));
        }
      }
      if (event is FetchListToTab) {
        emit(TabChangedState(
            listContacts: event.contactList
                .sublist(event.index * 20, (event.index + 1) * 20)));
      }
    });
  }
}
