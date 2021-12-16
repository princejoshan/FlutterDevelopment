import 'package:contact_bloc/bloc/contact_bloc.dart';
import 'package:contact_bloc/view/contact.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ContactListBloc contactBloc;

  setUp(() {
    contactBloc = ContactListBloc();
  });

  tearDown(() {
    contactBloc.close();
  });

  test('contact screen is empty', () {
    final contactScreen = const ContactsScreen();
  });
}
