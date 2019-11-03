import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:reddit/app_theme/app_themes.dart';

import './bloc.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  @override
  AppThemeState get initialState =>
      AppThemeState(themeData: appThemeData[AppTheme.darkTheme]);

  @override
  Stream<AppThemeState> mapEventToState(
    AppThemeEvent event,
  ) async* {
    if (event is SetAppThemeEvent) {
      yield AppThemeState(themeData: appThemeData[event.appTheme]);
    } else if (event is SwapAppThemeEvent) {
      yield AppThemeState(themeData: appThemeData[_swapTheme(state)]);
    }
  }

  AppTheme _swapTheme(AppThemeState state) {
    return state.themeData == appThemeData[AppTheme.darkTheme]
        ? AppTheme.lightTheme
        : AppTheme.darkTheme;
  }
}
