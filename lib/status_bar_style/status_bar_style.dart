import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum StatusBarStyle {
  light,
  dark,
  transparent,
}

final statusBarStyle = {
  StatusBarStyle.light: SystemUiOverlayStyle.light,
  StatusBarStyle.dark: SystemUiOverlayStyle.dark,
  StatusBarStyle.transparent:
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
};
