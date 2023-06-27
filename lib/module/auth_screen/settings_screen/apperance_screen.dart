import 'package:chat_app_1/constants/app_asset.dart';
import 'package:chat_app_1/constants/app_string.dart';
import 'package:chat_app_1/module/theme_constant/theme_manager.dart';
import 'package:chat_app_1/utils/app_style.dart';
import 'package:chat_app_1/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/theme_widget.dart';

class ApperanceScreen extends StatelessWidget {
  const ApperanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeManager());
    return Scaffold(
      appBar: settingAppBar(
          image: AppAsset.apperance, name: AppString.appereance.tr),
      body: SafeArea(
        child: GetBuilder<ThemeManager>(builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  children: [
                    ThemeWidget(
                      onTap: controller.lightFun,
                      image: AppAsset.lightTheme,
                      themeName: AppString.lightTheme.tr,
                      color: AppStyle.greencolor,
                    ),
                    const Expanded(child: SizedBox()),
                    ThemeWidget(
                      onTap: controller.darkFun,
                      image: AppAsset.darkTheme,
                      themeName: AppString.darkTheme.tr,
                      color: const Color(0xff77838F),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 23),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: ThemeWidget(
                  onTap: controller.pinkerFun,
                  image: AppAsset.pinkerTheme,
                  themeName: AppString.pinkerTheme.tr,
                  color: const Color(0xffDC82EB),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
