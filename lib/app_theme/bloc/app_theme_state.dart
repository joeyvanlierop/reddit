import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class AppThemeState extends Equatable {
  final ThemeData themeData;

  AppThemeState({@required this.themeData});

  @override
  List<Object> get props => [this.themeData];
}
