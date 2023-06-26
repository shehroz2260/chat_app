import 'package:chat_app_1/constants/app_asset.dart';
import 'package:chat_app_1/constants/app_string.dart';
import 'package:chat_app_1/module/auth_screen/create_profile_screen.dart';
import 'package:chat_app_1/utils/app_style.dart';
import 'package:chat_app_1/utils/constants.dart';
import 'package:chat_app_1/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SafeArea(
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(AppAsset.backIcon))),
            ],
          ),
          SizedBox(
            height: Get.height * .14,
          ),
          const Text(
            AppString.enterCode,
            style: AppStyle.enterCodeStyle,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            AppString.sentAnSms + Constant.userModel!.phoneNumer,
            style: AppStyle.fonstStyle14,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Get.height * .05,
          ),
          OtpTextField(
            borderRadius: BorderRadius.circular(30),
            fillColor: Colors.grey,
            numberOfFields: 6,
            borderColor: const Color(0xFF512DA8),
            showFieldAsBox: true,
            onCodeChanged: (String code) {},
            onSubmit: (String verificationCode) {},
          ),
          SizedBox(
            height: Get.height * .07,
          ),
          Text(
            AppString.resendCode,
            style: AppStyle.fontStyle16.copyWith(color: AppStyle.greencolor),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: CustomButton(
            buttonText: AppString.continueText,
            onTap: () {
              Get.to(const CreateProfileScreen());
            }),
      ),
    );
  }
}
