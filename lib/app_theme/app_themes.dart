import 'package:flutter/material.dart';

enum AppTheme {
  lightTheme,
  darkTheme,
}

final appThemeData = {
  AppTheme.lightTheme: ThemeData(
    textTheme: textTheme.copyWith(
      title: textTheme.title.copyWith(color: Colors.grey.shade900),
      subhead: textTheme.subhead.copyWith(color: Colors.grey.shade900),
      subtitle: textTheme.subtitle.copyWith(color: Colors.grey.shade600),
    ),
//    primaryColor: Colors.grey.shade100,
    primaryColor: Colors.white,
    accentColor: Colors.blueAccent,
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.light,
    accentColorBrightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    dividerColor: Colors.grey.shade100,
    splashColor: Colors.grey.shade400.withOpacity(0.15),
    splashFactory: InkRipple.splashFactory,
  ),
  AppTheme.darkTheme: ThemeData(
    textTheme: textTheme.copyWith(
      title: textTheme.title.copyWith(color: Colors.grey.shade100),
      subhead: textTheme.subhead.copyWith(color: Colors.grey.shade100),
      subtitle: textTheme.subtitle.copyWith(color: Colors.grey.shade600),
    ),
//    primaryColor: Color.fromARGB(255, 24, 24, 25),
    primaryColor: Color.fromARGB(255, 22, 22, 23),
    accentColor: Colors.blueAccent,
    brightness: Brightness.dark,
    primaryColorBrightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    scaffoldBackgroundColor: Color.fromARGB(255, 22, 22, 23),
    dividerColor: Color.fromARGB(255, 30, 30, 31),
    splashColor: Colors.white.withOpacity(0.1),
    splashFactory: InkRipple.splashFactory,
  ),
};

final TextTheme textTheme = TextTheme(
  title: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
  subhead: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
  subtitle: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.0),
);
