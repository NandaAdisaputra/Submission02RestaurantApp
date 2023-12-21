import 'package:flutter/material.dart';

class AppLightTheme {
  final primarySwatch = Colors.amber;
  final appBarTheme = const AppBarTheme(
    backgroundColor: Color(0xFFB9E9FC),
    titleTextStyle: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
  final scaffoldBackgroundColor = Colors.white;
  final floatingActionButtonTheme = const FloatingActionButtonThemeData(
    backgroundColor: Colors.amber,
    foregroundColor: Colors.black,
  );
}

class AppDarkTheme {
  final primarySwatch = Colors.amber;
  final appBarTheme = const AppBarTheme(
    backgroundColor: Color(0xFF04293A),
    titleTextStyle: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
  final scaffoldBackgroundColor = const Color(0xFF041C32);
  final floatingActionButtonTheme = const FloatingActionButtonThemeData(
    backgroundColor: Colors.amber,
    foregroundColor: Colors.black,
  );
}