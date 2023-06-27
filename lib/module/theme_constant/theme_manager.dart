import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/app_key_storage.dart';
import '../../utils/constants.dart';

class ThemeManager extends GetxController {
  GetStorage storage = GetStorage();

  ThemeData lightTheme =
      ThemeData(primarySwatch: Colors.green, brightness: Brightness.light);
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
  ThemeData pinkerTheme = ThemeData(
      primaryColorLight: Colors.pink,
      primaryColor: Colors.pink,
      cardColor: Colors.pink);
  void lightFun() {
    Constant.isLight = true;
    Constant.isPink = false;
    storage.write(AppKeyStoragec.isLigth, true);
    storage.write(AppKeyStoragec.isPink, false);
    update();
  }

  void darkFun() {
    Constant.isLight = false;
    Constant.isPink = false;
    storage.write(AppKeyStoragec.isLigth, false);
    storage.write(AppKeyStoragec.isPink, false);
    update();
  }

  void pinkerFun() {
    Constant.isPink = true;
    Constant.isLight = false;
    storage.write(AppKeyStoragec.isPink, true);
    storage.write(AppKeyStoragec.isLigth, false);
    update();
  }
}
