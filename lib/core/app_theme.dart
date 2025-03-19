import 'package:flutter/material.dart';

class AppTheme {
  late Color primaryColor;
  late Color secondaryColor;

  AppTheme({required this.primaryColor, required this.secondaryColor});
}

AppTheme appTheme = AppTheme(
    primaryColor: const Color.fromARGB(255, 34, 146, 19),
    secondaryColor: const Color.fromARGB(255, 201, 183, 25));
