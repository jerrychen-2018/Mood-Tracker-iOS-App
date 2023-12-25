import "package:flutter/material.dart";

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(color: Color.fromRGBO(112, 203, 255, 1)),
    colorScheme: const ColorScheme.light(
        background: Color.fromRGBO(112, 203, 255, 1),
        primary: Color.fromRGBO(56, 129, 172, 1),
        secondary: Color.fromRGBO(33, 93, 128, 1)));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(color: Colors.grey.shade800),
    iconTheme: IconThemeData(color: Colors.white),
    colorScheme: ColorScheme.dark(
        background: Colors.grey.shade800,
        primary: Colors.grey.shade600,
        secondary: Colors.white));
