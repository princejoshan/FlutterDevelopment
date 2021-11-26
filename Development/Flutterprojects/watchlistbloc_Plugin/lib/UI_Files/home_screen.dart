import 'package:bloc100/Models/contacts.dart';
import 'package:bloc100/UI_Files/sorting_sheet.dart';
import 'package:bloc100/bloc/theme_data_bloc.dart';
import 'package:bloc100/bloc/theme_data_event.dart';
import 'package:bloc100/sorting_bloc/bloc/sorting_bloc_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc100/Constants_Files/app_constants.dart';
import 'package:bloc100/UI_Files/tabbar_screen.dart';
import 'package:bloc100/bloc/contacts_bloc.dart';
import 'package:bloc100/bloc/contacts_state.dart';
import 'package:bloc100/bloc/contacts_event.dart';

import '../shared_prefrences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _ContactsHomeState createState() => _ContactsHomeState();
}

class _ContactsHomeState extends State<HomePage> {
  late ContactsBloc contactListBloc;
  late List<Contacts> mainListContacts;
  String selectedTheme = SharedPrefrences().getTheme ?? '';

  Map<int, String> sortingTypeAppliedAtTabIndex = {};
  int userCurrentTab = 0;

  @override
  void initState() {
    super.initState();
    contactListBloc = BlocProvider.of<ContactsBloc>(context);
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
          title: const Text(Constants.contactTitle),
          actions: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<ThemeDataBloc>(context)
                      .add(ThemeDataEvent(AppThemeData: Constants.darkTheme));
                },
                icon: const Icon(Icons.dark_mode)),
            IconButton(
                onPressed: () {
                  BlocProvider.of<ThemeDataBloc>(context)
                      .add(ThemeDataEvent(AppThemeData: Constants.lightTheme));
                },
                icon: const Icon(Icons.light_mode)),
            IconButton(
                key: const ValueKey('sorting'),
                onPressed: () {
                  sortBtnAction(
                      context,
                      contactListBloc,
                      mainListContacts.sublist(
                          userCurrentTab * 20, (userCurrentTab + 1) * 20),
                      sortingTypeAppliedAtTabIndex[userCurrentTab]);
                },
                icon: const Icon(Icons.sort_by_alpha_sharp)),
          ],
          bottom: TabBar(
            onTap: (index) {
              userCurrentTab = index;
              contactListBloc.add(
                  FetchListInTab(index: index, contactList: mainListContacts));
            },
            tabs: Constants.tabs,
            isScrollable: true,
          ),
        ),
        body: BlocBuilder<ContactsBloc, ContactsState>(
          builder: (context, state) {
            if (state is ContactsLoadedState) {
              mainListContacts = state.listContacts;
              return ContactsTabbarController(
                contactList: mainListContacts.sublist(0, 20),
              );
            } else if (state is ContactsErrorState) {
              return Center(
                child: Text(state.message.toString()),
              );
            } else if (state is ContactsInTabState) {
              if (state.sortingType != null) {
                sortingTypeAppliedAtTabIndex[userCurrentTab] =
                    state.sortingType!;
              }
              mainListContacts.replaceRange(userCurrentTab * 20,
                  (userCurrentTab + 1) * 20, state.listContacts);
              return ContactsTabbarController(
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

  void sortBtnAction(BuildContext context, ContactsBloc contactBloc,
      List<Contacts> conatctListAtParticularTab, String? sortingType) {
    showModalBottomSheet(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.22),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) {
        return BlocProvider(
          create: (context) => SortingBlocBloc(contactBloc),
          child: SafeArea(
            child: SortingSheet(
              contactList: conatctListAtParticularTab,
              selectedSortedType: sortingType ?? "",
            ),
          ),
        );
      },
    );
  }

  String? newMethod(String? sortingType) => sortingType;
}
