import 'package:bloc/bloc.dart';
import 'package:bloc100/Constants_Files/app_constants.dart';
import 'package:bloc100/Models/contacts.dart';
import 'package:bloc100/bloc/contacts_bloc.dart';
import 'package:bloc100/bloc/contacts_event.dart';
import 'package:meta/meta.dart';

part 'sorting_bloc_event.dart';
part 'sorting_bloc_state.dart';

class SortingBlocBloc extends Bloc<SortingBlocEvent, SortingBlocState> {
  ContactsBloc contactBloc;

  SortingBlocBloc(this.contactBloc) : super(SortingBlocInitial()) {
    on<SortingBlocEvent>((event, emit) {
      if (event is SortingTypeButtonClickEvent) {
        emit(SortingTypeButtonClickState(event.btnText));
      } else if (event is SortingDoneBtnActionEvent) {
        sortContacts(event);
      }
    });
  }
  void sortContacts(SortingDoneBtnActionEvent event) {
    if (event.btnText == Constants.alphabetDecending) {
      event.contactList
          .sort((a, b) => b.name.toLowerCase().compareTo(a.name.toLowerCase()));
    } else if (event.btnText == Constants.alphabetAscending) {
      event.contactList
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } else if (event.btnText == Constants.numericAscending) {
      event.contactList
          .sort((a, b) => int.parse(a.id).compareTo(int.parse(b.id)));
    } else if (event.btnText == Constants.numericDecending) {
      event.contactList
          .sort((a, b) => int.parse(b.id).compareTo(int.parse(a.id)));
    }
    contactBloc.add(SortContactEvent(
        listContacts: event.contactList, sortingStr: event.btnText));
  }
}
