import "package:flutter/material.dart";

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(color: Color.fromRGBO(112, 203, 255, 1)),
    colorScheme: const ColorScheme.light(
        background: Color.fromRGBO(112, 203, 255, 1),
        primary:
            Color.fromRGBO(255, 145, 77, 1), //Color.fromRGBO(41, 112, 154, 1),

        secondary: Color.fromRGBO(33, 93, 128, 1)));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(color: Colors.grey.shade800),
    iconTheme: IconThemeData(color: Colors.white),
    colorScheme: ColorScheme.dark(
        background: Colors.grey.shade800,
        primary: const Color.fromARGB(255, 11, 14, 52),
        secondary: Colors.white));
