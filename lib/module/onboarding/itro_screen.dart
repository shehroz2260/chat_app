import 'package:chat_app_1/constants/app_string.dart';
import 'package:chat_app_1/utils/app_key_storage.dart';
import 'package:chat_app_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../widgets/custom_button.dart';
import '../auth_screen/login_screen.dart';

class ItroScreen extends StatelessWidget {
  const ItroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GetStorage storage = GetStorage();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: SvgPicture.asset("assets/svg/Illustration.svg"),
          ),
          SizedBox(
            height: Get.height * 0.08,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                const TextSpan(
                    text: AppString.itroScreenText,
                    style: AppStyle.itroTextStyle),
                TextSpan(
                    text: "Void",
                    style: TextStyle(
                        fontFamily: "Mulish",
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppStyle.greencolor))
              ])),
          const Spacer(),
          const Text(
            AppString.termandcondition,
            style: AppStyle.termandCondition,
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: CustomButton(
              buttonText: AppString.startMessaging,
              onTap: () {
                storage.write(AppKeyStoragec.visited, true);
                Get.to(const LoginScreen());
              },
            ),
          )
        ],
      ),
    );
  }
}
