import "package:flutter/material.dart";

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Color.fromRGBO(112, 203, 255, 1),
        primary: Color.fromRGBO(56, 129, 172, 1),
        secondary: Color.fromRGBO(33, 93, 128, 1)));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Colors.grey.shade800,
        primary: Colors.grey.shade700,
        secondary: Colors.grey.shade600));
