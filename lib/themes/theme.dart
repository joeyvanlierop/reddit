import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  splashColor: Colors.grey.shade400.withOpacity(0.15),
  textTheme: TextTheme(
      title: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      subhead: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
          color: Colors.grey.shade900),
      subtitle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
          color: Colors.grey.shade600),
      body1: TextStyle(fontSize: 16.0),
      body2: TextStyle(fontSize: 16.0, color: Colors.grey[200]),
      button: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      caption: TextStyle(fontSize: 16.0, color: Colors.white.withOpacity(0.5))),
  accentColor: Colors.blueAccent,
  accentColorBrightness: Brightness.dark,
  backgroundColor: Colors.grey[200],
  bottomAppBarColor: Colors.white,
  brightness: Brightness.light,
  buttonColor: Colors.blueAccent,
  buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: Colors.blueAccent,
      alignedDropdown: true,
      disabledColor: Colors.grey[400],
      height: 44.0,
      highlightColor: Colors.transparent,
      layoutBehavior: ButtonBarLayoutBehavior.constrained,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(style: BorderStyle.none))),
  highlightColor: Colors.transparent,
  disabledColor: Colors.grey[400],
  canvasColor: Colors.white,
  cardColor: Colors.white,
  cursorColor: Colors.blueAccent,
  dialogBackgroundColor: Colors.white,
  dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(style: BorderStyle.none))),
//  dividerColor: Colors.transparent,
  errorColor: Colors.red[400],
  inputDecorationTheme: InputDecorationTheme(
    border: UnderlineInputBorder(),
    contentPadding: EdgeInsets.all(8.0),
    hasFloatingPlaceholder: false,
    errorMaxLines: 1,
    filled: false,
  ),
  indicatorColor: Colors.blueAccent,
  primaryColor: Colors.grey.shade200,
  primaryColorBrightness: Brightness.light,
  primaryColorDark: Colors.blueAccent[400],
  primaryColorLight: Colors.blueAccent[100],
  scaffoldBackgroundColor: Colors.grey.shade100,
  selectedRowColor: Colors.grey[200],
  sliderTheme: SliderThemeData(
      activeTrackColor: Colors.blueAccent,
      inactiveTrackColor: Colors.grey[400],
      disabledActiveTrackColor: Colors.grey[400],
      disabledInactiveTrackColor: Colors.grey[300],
      activeTickMarkColor: Colors.blueAccent,
      inactiveTickMarkColor: Colors.grey,
      disabledActiveTickMarkColor: Colors.grey[400],
      disabledInactiveTickMarkColor: Colors.grey[400],
      thumbColor: Colors.blueAccent,
      disabledThumbColor: Colors.grey[400],
      overlayColor: Colors.blueAccent.withOpacity(0.3),
      valueIndicatorColor: Colors.blueAccent,
      thumbShape: RoundSliderThumbShape(),
      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      showValueIndicator: ShowValueIndicator.onlyForDiscrete,
      valueIndicatorTextStyle:
          TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
  fontFamily: "HK Grotesk",
  splashFactory: InkRipple.splashFactory,
  tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.blueAccent,
                  width: 2.0,
                  style: BorderStyle.solid)),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment(0.0, 0.8),
              colors: [
                Colors.blueAccent.withOpacity(0.5),
                Colors.blueAccent.withOpacity(0.0)
              ])),
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Colors.blueAccent,
      unselectedLabelColor: Colors.grey),
  textSelectionColor: Colors.blueAccent.withOpacity(0.5),
  textSelectionHandleColor: Colors.blueAccent,
  toggleableActiveColor: Colors.blueAccent,
  unselectedWidgetColor: Colors.grey[600],
);

final darkTheme = ThemeData(
  splashColor: Colors.white.withOpacity(0.1),
  textTheme: TextTheme(
      title: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      subhead: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
          color: Colors.grey.shade200),
      subtitle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
          color: Colors.grey.shade600),
      body1: TextStyle(fontSize: 16.0),
      body2: TextStyle(fontSize: 16.0, color: Colors.grey[200]),
      button: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      caption: TextStyle(fontSize: 16.0, color: Colors.white.withOpacity(0.5))),
  accentColor: Colors.blueAccent,
  accentColorBrightness: Brightness.dark,
  backgroundColor: Colors.grey[800],
  bottomAppBarColor: Colors.grey[850],
  brightness: Brightness.dark,
  buttonColor: Colors.blueAccent,
  buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: Colors.blueAccent,
      alignedDropdown: true,
      disabledColor: Colors.grey[600],
      height: 44.0,
      highlightColor: Colors.transparent,
      layoutBehavior: ButtonBarLayoutBehavior.constrained,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(style: BorderStyle.none))),
  highlightColor: Colors.transparent,
  disabledColor: Colors.grey[600],
  canvasColor: Colors.grey[850],
  cardColor: Colors.grey[850],
  cursorColor: Colors.blueAccent,
  dialogBackgroundColor: Colors.grey[850],
  dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(style: BorderStyle.none))),
//  dividerColor: Colors.transparent,
  errorColor: Colors.red[400],
  inputDecorationTheme: InputDecorationTheme(
    border: UnderlineInputBorder(),
    contentPadding: EdgeInsets.all(8.0),
    hasFloatingPlaceholder: false,
    errorMaxLines: 1,
    filled: false,
  ),
  indicatorColor: Colors.blueAccent,
  primaryColor: Color.fromARGB(255, 22, 22, 24),
  primaryColorBrightness: Brightness.dark,
  primaryColorDark: Colors.blueAccent[400],
  primaryColorLight: Colors.blueAccent[100],
  scaffoldBackgroundColor: Color.fromARGB(255, 20, 20, 22),
  selectedRowColor: Colors.grey[800],
  sliderTheme: SliderThemeData(
    activeTrackColor: Colors.blueAccent,
    inactiveTrackColor: Colors.grey[400],
    disabledActiveTrackColor: Colors.grey[400],
    disabledInactiveTrackColor: Colors.grey[300],
    activeTickMarkColor: Colors.blueAccent,
    inactiveTickMarkColor: Colors.grey,
    disabledActiveTickMarkColor: Colors.grey[400],
    disabledInactiveTickMarkColor: Colors.grey[400],
    thumbColor: Colors.blueAccent,
    disabledThumbColor: Colors.grey[400],
    overlayColor: Colors.blueAccent.withOpacity(0.3),
    valueIndicatorColor: Colors.blueAccent,
    thumbShape: RoundSliderThumbShape(),
    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
    showValueIndicator: ShowValueIndicator.onlyForDiscrete,
    valueIndicatorTextStyle:
        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
  ),
  splashFactory: InkRipple.splashFactory,
  tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Colors.blueAccent,
                width: 2.0,
                style: BorderStyle.solid)),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment(0.0, 0.8),
          colors: [
            Colors.blueAccent.withOpacity(0.5),
            Colors.blueAccent.withOpacity(0.0)
          ],
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Colors.blueAccent,
      unselectedLabelColor: Colors.grey[400]),
  textSelectionColor: Colors.blueAccent.withOpacity(0.5),
  textSelectionHandleColor: Colors.blueAccent,
  toggleableActiveColor: Colors.blueAccent,
  unselectedWidgetColor: Colors.grey[400],
);
