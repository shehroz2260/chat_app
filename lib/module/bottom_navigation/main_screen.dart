import 'package:chat_app_1/module/bottom_navigation/main_controller.dart';
import 'package:chat_app_1/widgets/bottom_navigation_bar.dart';
import 'package:chat_app_1/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return GetBuilder<MainController>(builder: (context) {
      return Scaffold(
        appBar: controller.currentIndex == 2 ? null : appBar(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xff979797),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 0)
                ]),
            child: VoidBottomNavBar(
                currentIndex: controller.currentIndex,
                onTap: controller.updateIndex),
          ),
        ),
        body: controller.currentTab,
      );
    });
  }
}
