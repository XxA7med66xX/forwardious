import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData.light().copyWith(

    //Radio button theme
    radioTheme: RadioThemeData(
      splashRadius: 0,
      fillColor: MaterialStateProperty.all(Colors.black),
    ),

    //Primary color theme
    primaryColor: Colors.black,

    //Progress indicator theme
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.black),
  );

  static final ThemeData darkMode = ThemeData.dark().copyWith(

    //Scaffold background color
    scaffoldBackgroundColor: const Color(0xFF1F1F1F),

    //Radio button theme
    radioTheme: RadioThemeData(
      splashRadius: 0,
      fillColor: MaterialStateProperty.all(Colors.white),
    ),

    //Primary color theme
    primaryColor: Colors.grey,

    //Progress indicator theme
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.white),
  );
}
