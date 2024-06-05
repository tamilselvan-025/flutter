import 'package:flutter/material.dart';

///for dark and light mode
class ThemeSettings {
  ThemeSettings._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 40,
        color: Colors.deepOrange,
        fontWeight: FontWeight.w800,
      ),
      displayMedium: TextStyle(
        fontSize: 32,
        color: Colors.blue,
        fontWeight: FontWeight.w800,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        color: Colors.green,
        fontWeight: FontWeight.w800,
      ),
      bodyLarge: TextStyle(
        fontSize: 30,
        color: Colors.deepOrange,
        fontWeight: FontWeight.w800,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        color: Colors.blue,
        fontWeight: FontWeight.w800,
      ),
      bodySmall: TextStyle(
        fontSize: 20,
        color: Colors.green,
        fontWeight: FontWeight.w800,
      ),
    ),
    appBarTheme: const AppBarTheme(
        color: Colors.black,
        titleTextStyle: TextStyle(
            color: Colors.red, fontWeight: FontWeight.w800, fontSize: 25)),

  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black12,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 40,
        color: Colors.white70,
        fontWeight: FontWeight.w800,
      ),
      displayMedium: TextStyle(
        fontSize: 32,
        color: Colors.white70,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        color: Colors.white70,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontSize: 30,
        color: Colors.white70,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        color: Colors.white70,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 20,
        color: Colors.white70,
        fontWeight: FontWeight.w400,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white38,
      titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w800, fontSize: 25),
    ),
  );
}
