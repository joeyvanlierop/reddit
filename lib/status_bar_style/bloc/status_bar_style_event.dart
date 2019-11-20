import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:reddit/status_bar_style/status_bar_style.dart';

abstract class StatusBarStyleEvent extends Equatable {
  const StatusBarStyleEvent();

  List<Object> get props => [];
}

class SetStatusBarStyleEvent extends StatusBarStyleEvent {
  final StatusBarStyle statusBarStyle;

  const SetStatusBarStyleEvent({@required this.statusBarStyle});

  @override
  List<Object> get props => [StatusBarStyle];
}

class SwapStatusBarStyleEvent extends StatusBarStyleEvent {}
