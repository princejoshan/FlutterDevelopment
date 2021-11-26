import 'package:bloc/bloc.dart';
import 'package:bloc100/app_theme_class.dart';
import 'package:bloc100/Constants_Files/app_constants.dart';
import 'package:flutter/material.dart';
import '../shared_prefrences.dart';

import 'theme_data_event.dart';
import 'theme_data_state.dart';

class ThemeDataBloc extends Bloc<ThemeDataEvent, ThemeDataState> {
  ThemeDataBloc()
      : super(ThemeDataState(
            themeData: AppThemeClass.appThemeData[AppThemeEnum.lightTheme])) {
    on<ThemeDataEvent>((event, emit) {
      SharedPrefrences().storeTheTheme = event.AppThemeData;
      if (event.AppThemeData == Constants.lightTheme) {
        addLightThemeData(emit);
      } else if (event.AppThemeData == Constants.systemTheme) {
        if (WidgetsBinding.instance?.window.platformBrightness ==
            Brightness.dark) {
          addDarkThemeData(emit);
        } else {
          addLightThemeData(emit);
        }
      } else {
        addDarkThemeData(emit);
      }
    });
  }

  void addLightThemeData(Emitter<ThemeDataState> emit) {
    emit(ThemeDataState(
        themeData: AppThemeClass.appThemeData[AppThemeEnum.lightTheme]));
  }

  void addDarkThemeData(Emitter<ThemeDataState> emit) {
    emit(ThemeDataState(
        themeData: AppThemeClass.appThemeData[AppThemeEnum.darkTheme]));
  }
}
