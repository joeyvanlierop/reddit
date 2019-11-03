import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';
import '../status_bar_style.dart';

class StatusBarStyleBloc
    extends Bloc<StatusBarStyleEvent, StatusBarStyleState> {
  @override
  StatusBarStyleState get initialState => StatusBarStyleState(
      systemUiOverlayStyle: statusBarStyle[StatusBarStyle.light]);

  @override
  Stream<StatusBarStyleState> mapEventToState(
    StatusBarStyleEvent event,
  ) async* {
    if (event is SetStatusBarStyleEvent) {
      yield StatusBarStyleState(
          systemUiOverlayStyle: statusBarStyle[event.statusBarStyle]);
    }
  }
}
