import 'package:chat_app_1/constants/app_asset.dart';
import 'package:chat_app_1/constants/app_string.dart';
import 'package:chat_app_1/module/auth_screen/auth_handler.dart';
import 'package:chat_app_1/module/auth_screen/settings_screen/accounts_screen.dart';
import 'package:chat_app_1/module/auth_screen/settings_screen/chat_screen.dart';
import 'package:chat_app_1/utils/app_style.dart';
import 'package:chat_app_1/utils/constants.dart';
import 'package:chat_app_1/widgets/setting_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../auth_screen/settings_screen/apperance_screen.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),
            Text(
              AppString.more.tr,
              style: AppStyle.fontStyle18.copyWith(color: AppStyle.greencolor),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color(0xffEDEDED),
                  child: SvgPicture.asset(
                    AppAsset.accounts,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Constant.userModel!.userName,
                      style: AppStyle.termandCondition,
                    ),
                    const SizedBox(height: 5),
                    Constant.userModel!.email.isNotEmpty
                        ? Text(
                            Constant.userModel!.email,
                            style: AppStyle.fontStyle12,
                          )
                        : Text(
                            Constant.userModel!.phoneNumer,
                            style: AppStyle.fontStyle12,
                          ),
                  ],
                ),
                const Spacer(),
                SvgPicture.asset(AppAsset.forwardIcon)
              ],
            ),
            const SizedBox(height: 24),
            SettingRowWidget(
              image: AppAsset.accounts,
              name: AppString.account.tr,
              onTap: () {
                Get.to(const AccountScreen());
              },
            ),
            const SizedBox(height: 24),
            SettingRowWidget(
              image: AppAsset.chatIcon,
              name: AppString.chats.tr,
              onTap: () {
                Get.to(const ChatScreenSetting());
              },
            ),
            const SizedBox(height: 40),
            SettingRowWidget(
              image: AppAsset.apperance,
              name: AppString.appereance.tr,
              onTap: () {
                Get.to(const ApperanceScreen());
              },
            ),
            const SizedBox(height: 24),
            SettingRowWidget(
              image: AppAsset.notifications,
              name: AppString.notification.tr,
              onTap: () {},
            ),
            const SizedBox(height: 24),
            SettingRowWidget(
              image: AppAsset.privacy,
              name: AppString.privacy.tr,
              onTap: () {},
            ),
            const SizedBox(height: 24),
            SettingRowWidget(
              image: AppAsset.dataUsage,
              name: AppString.dataUsage.tr,
              onTap: () {},
            ),
            const SizedBox(height: 24),
            SettingRowWidget(
              image: AppAsset.help,
              name: AppString.help.tr,
              onTap: () {},
            ),
            const SizedBox(height: 24),
            SettingRowWidget(
              image: AppAsset.logOutLogo,
              name: AppString.logOutText.tr,
              onTap: () {
                AuthHandler().logOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
