import 'package:chat_app_1/module/onboarding/splash_screen.dart';
import 'package:chat_app_1/module/theme_constant/theme_manager.dart';
import 'package:chat_app_1/utils/app_locale.dart';
import 'package:chat_app_1/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = Get.put(ThemeManager());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeManager>(builder: (context) {
      return GetMaterialApp(
        translations: AppLocale(),
        locale: const Locale("en", "Us"),
        theme: Constant.isLight
            ? controller.lightTheme
            : Constant.isPink
                ? controller.pinkerTheme
                : controller.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      );
    });
  }
}
