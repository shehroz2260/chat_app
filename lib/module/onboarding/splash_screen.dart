import 'package:chat_app_1/module/logic/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashScreenController());
    return GetBuilder<SplashScreenController>(initState: (state) {
      controller.initApp();
    }, builder: (context) {
      return Container(
        alignment: Alignment.center,
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff58D582), Color(0xff47A98C)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: SvgPicture.asset("assets/svg/logo pinker.svg"),
      );
    });
  }
}
