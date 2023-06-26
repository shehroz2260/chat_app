import 'package:chat_app_1/constants/app_asset.dart';
import 'package:chat_app_1/constants/app_string.dart';
import 'package:chat_app_1/utils/app_style.dart';
import 'package:chat_app_1/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/setting_row_widget.dart';

class ChatScreenSetting extends StatelessWidget {
  const ChatScreenSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingAppBar(image: AppAsset.chatIcon, name: AppString.chats),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Divider(thickness: 1),
            SettingRowwithoutImageWidget(
              name: AppString.archiveAllChats,
              style: AppStyle.fontStyle16.copyWith(
                  fontWeight: FontWeight.w400, color: const Color(0xff007AFF)),
              onTap: () {},
            ),
            SettingRowwithoutImageWidget(
              name: AppString.clearAllChats,
              style: AppStyle.fontStyle16.copyWith(
                  fontWeight: FontWeight.w400, color: const Color(0xffFF3B30)),
              onTap: () {},
            ),
            SettingRowwithoutImageWidget(
              name: AppString.deleteAllChats,
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
                const Text(
                  AppString.appLanguage,
                  style: AppStyle.fonstStyle14,
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
                const Text(
                  AppString.archived,
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
                const Text(
                  AppString.hideChat,
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
