// ignore_for_file: must_be_immutable

import 'package:bloc100/Constants_Files/app_constants.dart';
import 'package:bloc100/Models/contacts.dart';
import 'package:bloc100/sorting_bloc/bloc/sorting_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortingSheet extends StatelessWidget {
  SortingSheet(
      {Key? key, required this.contactList, required this.selectedSortedType})
      : super(key: key);
  String selectedSortedType;

  List<Contacts> contactList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortingBlocBloc, SortingBlocState>(
      builder: (context, state) {
        if (state is SortingTypeButtonClickState) {
          selectedSortedType = state.btnText;
        }
        return Column(
          children: [
            Expanded(
                child: ListTile(
              leading: const Text(
                Constants.sorting,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              trailing: TextButton(
                child: const Text(
                  Constants.done,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                onPressed: () {
                  if (selectedSortedType == null) {
                  } else {
                    BlocProvider.of<SortingBlocBloc>(context).add(
                        SortingDoneBtnActionEvent(
                            btnText: selectedSortedType,
                            contactList: contactList));
                    Navigator.pop(context);
                  }
                },
              ),
            )),
            Expanded(
              child: displayRow(
                  Constants.alphabetically,
                  Constants.alphabetAscending,
                  Constants.alphabetDecending,
                  state,
                  context),
            ),
            Divider(
              height: 2,
              color: Colors.grey.shade600,
              indent: 15,
              endIndent: 15,
            ),
            Expanded(
              child: displayRow(Constants.userID, Constants.numericAscending,
                  Constants.numericDecending, state, context),
            ),
          ],
        );
      },
    );
  }

  Widget displayRow(String title, String sortingType1, String sortingType2,
      SortingBlocState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.grey),
            ),
          ),
          configureTextBtn(sortingType1, state, context),
          configureTextBtn(sortingType2, state, context)
        ],
      ),
    );
  }

  TextButton configureTextBtn(
      String text, SortingBlocState state, BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18,
            color: (text == selectedSortedType)
                ? Theme.of(context).textSelectionTheme.selectionColor
                : Theme.of(context).textTheme.bodyText1?.color),
      ),
      onPressed: () {
        BlocProvider.of<SortingBlocBloc>(context)
            .add(SortingTypeButtonClickEvent(text));
      },
    );
  }
}
