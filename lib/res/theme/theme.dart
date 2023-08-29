import 'package:flutter/material.dart';

class Apptheme {
  static final ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w400, fontSize: 24),
        displaySmall: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w200)),
  );
}
