import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class StatusBarStyleState extends Equatable {
  final SystemUiOverlayStyle systemUiOverlayStyle;

  StatusBarStyleState({@required this.systemUiOverlayStyle});

  @override
  List<Object> get props => [systemUiOverlayStyle];
}
