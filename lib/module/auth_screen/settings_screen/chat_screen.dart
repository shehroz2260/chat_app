import 'package:chat_app_1/constants/app_asset.dart';
import 'package:chat_app_1/constants/app_string.dart';
import 'package:chat_app_1/utils/app_key_storage.dart';
import 'package:chat_app_1/utils/app_style.dart';
import 'package:chat_app_1/utils/constants.dart';
import 'package:chat_app_1/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../widgets/setting_row_widget.dart';

class ChatScreenSetting extends StatelessWidget {
  const ChatScreenSetting({super.key});

  @override
  Widget build(BuildContext context) {
    GetStorage storage = GetStorage();
    return Scaffold(
      appBar: settingAppBar(image: AppAsset.chatIcon, name: AppString.chats.tr),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Divider(thickness: 1),
            SettingRowwithoutImageWidget(
              name: AppString.archiveAllChats.tr,
              style: AppStyle.fontStyle16.copyWith(
                  fontWeight: FontWeight.w400, color: const Color(0xff007AFF)),
              onTap: () {},
            ),
            SettingRowwithoutImageWidget(
              name: AppString.clearAllChats.tr,
              style: AppStyle.fontStyle16.copyWith(
                  fontWeight: FontWeight.w400, color: const Color(0xffFF3B30)),
              onTap: () {},
            ),
            SettingRowwithoutImageWidget(
              name: AppString.deleteAllChats.tr,
              style: AppStyle.fontStyle16.copyWith(
                  fontWeight: FontWeight.w400, color: const Color(0xffFF3B30)),
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SvgPicture.asset(AppAsset.appLanguage, height: 24, width: 24),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    Get.dialog(
                      AlertDialog(
                        title: Text(AppString.appLanguage.tr),
                        content: SizedBox(
                          height: 100,
                          child: Column(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Constant.locale = const Locale("en", "Us");
                                    Get.updateLocale(Constant.locale);
                                    storage.write(AppKeyStoragec.loacale,
                                        Constant.locale);
                                    Get.back();
                                  },
                                  child: const Text("English")),
                              TextButton(
                                  onPressed: () {
                                    Constant.locale = const Locale("ur", "Pk");
                                    Get.updateLocale(Constant.locale);
                                    storage.write(AppKeyStoragec.loacale,
                                        Constant.locale);
                                    Get.back();
                                  },
                                  child: const Text("Urdu"))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    AppString.appLanguage.tr,
                    style: AppStyle.fonstStyle14,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              children: [
                SvgPicture.asset(AppAsset.archivedChat, height: 24, width: 24),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  AppString.archived.tr,
                  style: AppStyle.fonstStyle14,
                )
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              children: [
                SvgPicture.asset(AppAsset.hideMessage, height: 24, width: 24),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  AppString.hideChat.tr,
                  style: AppStyle.fonstStyle14,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
