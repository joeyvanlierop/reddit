import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';
import '../status_bar_style.dart';

class StatusBarStyleBloc
    extends Bloc<StatusBarStyleEvent, StatusBarStyleState> {
  @override
  StatusBarStyleState get initialState => StatusBarStyleState(
      systemUiOverlayStyle: statusBarStyle[StatusBarStyle.lightStyle]);

  @override
  Stream<StatusBarStyleState> mapEventToState(
    StatusBarStyleEvent event,
  ) async* {
    if (event is SetStatusBarStyleEvent) {
      yield StatusBarStyleState(
          systemUiOverlayStyle: statusBarStyle[event.statusBarStyle]);
    } else if (event is SwapStatusBarStyleEvent) {
      yield StatusBarStyleState(
          systemUiOverlayStyle: statusBarStyle[_swapStyle()]);
    }
  }

  StatusBarStyle _swapStyle() {
    return state.systemUiOverlayStyle ==
            statusBarStyle[StatusBarStyle.darkStyle]
        ? StatusBarStyle.lightStyle
        : StatusBarStyle.darkStyle;
  }
}
