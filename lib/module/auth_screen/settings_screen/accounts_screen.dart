import 'package:chat_app_1/constants/app_asset.dart';
import 'package:chat_app_1/constants/app_string.dart';
import 'package:chat_app_1/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/setting_row_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingAppBar(image: AppAsset.accounts, name: AppString.account),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Divider(thickness: 1),
            SettingRowwithoutImageWidget(
              name: AppString.privacy,
              onTap: () {},
            ),
            SettingRowwithoutImageWidget(
              name: AppString.security,
              onTap: () {},
            ),
            SettingRowwithoutImageWidget(
              name: AppString.changeNumber,
              onTap: () {},
            ),
            SettingRowwithoutImageWidget(
              name: AppString.changeEmail,
              onTap: () {},
            ),
            SettingRowwithoutImageWidget(
              name: AppString.deleteMyAccount,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
