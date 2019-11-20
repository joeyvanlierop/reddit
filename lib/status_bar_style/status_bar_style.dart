import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum StatusBarStyle {
  lightStyle,
  darkStyle,
  transparent,
}

final statusBarStyle = {
  StatusBarStyle.lightStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
  StatusBarStyle.darkStyle:
      SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 22, 22, 23)),
  StatusBarStyle.transparent:
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
};
