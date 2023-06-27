import 'dart:async';

import 'package:chat_app_1/module/auth_screen/login_screen.dart';
import 'package:chat_app_1/module/onboarding/itro_screen.dart';
import 'package:chat_app_1/utils/app_key_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/constants.dart';
import '../auth_screen/auth_handler.dart';

class SplashScreenController extends GetxController {
  Future initApp() async {
    final storage = GetStorage();

    bool appVisited = storage.read(AppKeyStoragec.visited) ?? false;
    Constant.isLight = storage.read(AppKeyStoragec.isLigth);
    Constant.isPink = storage.read(AppKeyStoragec.isPink);
    update();
    update();
    final auth = FirebaseAuth.instance;
    if (auth.currentUser == null) {
      Future.delayed(const Duration(milliseconds: 2000), () {
        Get.offAll(appVisited ? const LoginScreen() : const ItroScreen());
      });
      return;
    }

    if (auth.currentUser != null) {
      AuthHandler().checkUserExists();
    }
  }
}
