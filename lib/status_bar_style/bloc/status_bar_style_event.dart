import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:reddit/status_bar_style/status_bar_style.dart';

abstract class StatusBarStyleEvent extends Equatable {
  const StatusBarStyleEvent();
}

class SetStatusBarStyleEvent extends StatusBarStyleEvent {
  final StatusBarStyle statusBarStyle;

  SetStatusBarStyleEvent({@required this.statusBarStyle});

  @override
  List<Object> get props => [StatusBarStyle];
}
