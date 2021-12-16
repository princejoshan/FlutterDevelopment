import 'package:contact_bloc/helper/constants.dart';
import 'package:contact_bloc/view/contact.dart';
import 'package:contact_bloc/view/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_events.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
            appThemeState: AppTheme.appThemeData[AppThemeEnum.lightTheme])) {
    // ignore: use_function_type_syntax_for_parameters
    on<ThemeEvent>((event, emit) {
      if (event.appTheme == AppConstants.lightTheme) {
        emit(ThemeState(
            appThemeState: AppTheme.appThemeData[AppThemeEnum.lightTheme]));
      }
      if (event.appTheme == AppConstants.darkTheme) {
        emit(ThemeState(
            appThemeState: AppTheme.appThemeData[AppThemeEnum.darkTheme]));
      }
    });
  }
}
