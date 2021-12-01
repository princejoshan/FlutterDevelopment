import 'package:contact_bloc/bloc/contact_events.dart';
import 'package:contact_bloc/bloc/contact_state.dart';
import 'package:contact_bloc/view/tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:contact_bloc/bloc/contact_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contact_bloc/helper/constants.dart';
import 'package:contact_bloc/model/contact_model.dart';
import 'package:contact_bloc/view/theme.dart';
import 'dart:async';

StreamController<bool> isLightTheme = StreamController();

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  _ContactsHomeState createState() => _ContactsHomeState();
}

class _ContactsHomeState extends State<ContactsScreen> {
  late ContactListBloc contactListBloc;
  late List<Contacts> mainListContacts;

  // String selectedTheme = SharedPrefrences().getTheme ?? '';

  Map<int, String> sortingTypeAppliedAtTabIndex = {};
  int userCurrentTab = 0;

  @override
  void initState() {
    super.initState();
    contactListBloc = BlocProvider.of<ContactListBloc>(context);
    contactListBloc.add(FetchContactEvent());
  }

  @override
  void dispose() {
    super.dispose();
    contactListBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppConstants.contactTitle),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            IconButton(
                onPressed: () {
                  const ThemeClass(Brightness.dark);
                },
                icon: const Icon(Icons.dark_mode)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.light_mode)),
          ],
          bottom: TabBar(
            onTap: (index) {
              userCurrentTab = index;
              contactListBloc.add(
                  FetchListToTab(index: index, contactList: mainListContacts));
            },
            tabs: AppConstants.contactTabs,
            isScrollable: true,
          ),
        ),
        // body: TabBarView(
        //   children: [
        //     BlocBuilder<ContactListBloc, ContactState>(
        //       builder: (context, state) {
        //         if (state is ContactFetchedState) {
        //           mainListContacts = state.listContacts;
        //           return TabbarView(
        //             contactList: mainListContacts,
        //           );
        //         }

        //         return const Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       },
        //     )
        //   ],
        // ),
        body: BlocBuilder<ContactListBloc, ContactState>(
          builder: (context, state) {
            if (state is ContactFetchedState) {
              mainListContacts = state.listContacts;
              return TabbarView(
                contactList: mainListContacts.sublist(0, 20),
              );
            }
            if (state is TabChangedState) {
              mainListContacts.replaceRange(userCurrentTab * 20,
                  (userCurrentTab + 1) * 20, state.listContacts);
              return TabbarView(
                contactList: state.listContacts,
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
