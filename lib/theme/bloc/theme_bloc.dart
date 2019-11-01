import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:reddit/theme/themes.dart';

import './bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState =>
      ThemeState(themeData: appThemeData[AppTheme.darkTheme]);

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChanged) {
      yield ThemeState(themeData: appThemeData[event.appTheme]);
    }
  }
}
