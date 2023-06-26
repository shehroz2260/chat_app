import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeManager extends GetxController {
  bool icon = false;
  ThemeData lightTheme =
      ThemeData(primarySwatch: Colors.green, brightness: Brightness.light);
  ThemeData darkTheme = ThemeData(
      // primarySwatch: Colors.green,
      brightness: Brightness.dark);
}
