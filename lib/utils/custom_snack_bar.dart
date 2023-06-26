import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static show({required String? message}) {
    final snackBar = SnackBar(content: Text(message ?? 'Something went wrong'));
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
