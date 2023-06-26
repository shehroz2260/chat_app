import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_style.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onTap;
  final double? heigth;
  const CustomButton(
      {super.key, required this.buttonText, required this.onTap, this.heigth});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: heigth ?? 52,
        alignment: Alignment.center,
        width: Get.width,
        decoration: BoxDecoration(
            color: AppStyle.greencolor,
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: Text(
          buttonText,
          style: AppStyle.startMessaging,
        ),
      ),
    );
  }
}
