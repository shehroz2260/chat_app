import 'package:chat_app_1/constants/app_string.dart';
import 'package:chat_app_1/module/bottom_navigation/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constants/app_asset.dart';
import '../utils/app_style.dart';

final controller = Get.put(MainController());
appBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.5),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
            gradient: LinearGradient(
                colors: [Color(0xff58D582), Color(0xff47A98C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Row(children: [
          const SizedBox(
            width: 10,
          ),
          const Text(
            AppString.appText,
            style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontFamily: "fingerPaint"),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SvgPicture.asset(AppAsset.searchIcon),
          ),
          if (controller.currentIndex == 1) SvgPicture.asset(AppAsset.plus),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(AppAsset.moreVert),
          )
        ]),
      ),
    )),
  );
}

settingAppBar({required String image, required String name}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(40),
    child: SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.5, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 16),
          GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(AppAsset.backIcon)),
          SizedBox(width: Get.width * 0.3),
          SvgPicture.asset(image),
          const SizedBox(width: 10),
          Text(
            name,
            style: AppStyle.termandCondition,
          )
        ],
      ),
    )),
  );
}

chatScreenAppBar(
    {required String imageUrl,
    required String userName,
    required String activeNow}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.5),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
            gradient: LinearGradient(
                colors: [Color(0xff58D582), Color(0xff47A98C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Row(children: [
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset("assets/svg/backWardIcon.svg")),
          const SizedBox(
            width: 22,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
                color: Color(0xffD8D8D8),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                activeNow,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              )
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(AppAsset.moreVert),
          )
        ]),
      ),
    )),
  );
}
