import 'package:chat_app_1/constants/app_asset.dart';
import 'package:chat_app_1/utils/app_style.dart';
import 'package:chat_app_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VoidBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;
  const VoidBottomNavBar({
    super.key,
    this.onTap,
    required this.currentIndex,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: Constant.isLight
            ? Colors.white
            : Constant.isPink
                ? Colors.pink
                : Colors.blue,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: AppStyle.greencolor),
        selectedItemColor: Constant.isLight
            ? AppStyle.greencolor
            : Constant.isPink
                ? Colors.white
                : Colors.red,
        selectedFontSize: 12,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                AppAsset.home,
                height: 20.0,
                colorFilter: ColorFilter.mode(
                  currentIndex == 0
                      ? Constant.isLight
                          ? AppStyle.greencolor
                          : Constant.isPink
                              ? Colors.white
                              : Colors.red
                      : Constant.isLight
                          ? const Color(0xff77838F)
                          : Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: "Home".tr,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 24,
                width: 33,
                child: SvgPicture.asset(
                  AppAsset.chats,
                  // height: 20.0,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    currentIndex == 1
                        ? Constant.isLight
                            ? AppStyle.greencolor
                            : Constant.isPink
                                ? Colors.white
                                : Colors.red
                        : Constant.isLight
                            ? const Color(0xff77838F)
                            : Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            label: "Chats".tr,
          ),
          // BottomNavigationBarItem(
          //   icon: Padding(
          //     padding: const EdgeInsets.all(12.0),
          //     child: SvgPicture.asset(
          //       AppAsset.calls,
          //       height: 20.0,
          //       colorFilter: ColorFilter.mode(
          //         currentIndex == 2
          //             ? AppStyle.greencolor
          //             : const Color(0xff77838F),
          //         BlendMode.srcIn,
          //       ),
          //     ),
          //   ),
          //   label: mainTabsLabel[2],
          // ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 24,
                width: 33,
                child: SvgPicture.asset(
                  AppAsset.setting,
                  // height: 20.0,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    currentIndex == 2
                        ? Constant.isLight
                            ? AppStyle.greencolor
                            : Constant.isPink
                                ? Colors.white
                                : Colors.red
                        : Constant.isLight
                            ? const Color(0xff77838F)
                            : Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            label: "Settings".tr,
          ),
        ],
      ),
    );
  }
}
