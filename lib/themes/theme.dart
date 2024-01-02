import "package:flutter/material.dart";

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(color: Color.fromRGBO(112, 203, 255, 1)),
    colorScheme: const ColorScheme.light(
        background: Color.fromRGBO(112, 203, 255, 1),
        primary:
            Color.fromRGBO(255, 145, 77, 1), //Color.fromRGBO(41, 112, 154, 1),

        secondary: Color.fromRGBO(33, 93, 128, 1),
        tertiary: Colors.black));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 64, 59, 87),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    dialogBackgroundColor: const Color.fromARGB(255, 64, 59, 87),
    colorScheme: const ColorScheme.dark(
        background: Color.fromARGB(255, 64, 59, 87),
        primary: Color.fromARGB(255, 41, 37, 64),
        secondary: Colors.white));
