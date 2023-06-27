// ignore_for_file: deprecated_member_use

import 'package:chat_app_1/constants/app_asset.dart';
import 'package:chat_app_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingRowWidget extends StatelessWidget {
  final String image;
  final String name;
  final void Function() onTap;
  const SettingRowWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset(
              image,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            name,
            style: AppStyle.termandCondition,
          ),
          const Spacer(),
          SvgPicture.asset(
            AppAsset.forwardIcon,
          ),
        ],
      ),
    );
  }
}

class SettingRowwithoutImageWidget extends StatelessWidget {
  final String name;
  final void Function() onTap;
  final TextStyle? style;
  const SettingRowwithoutImageWidget(
      {super.key, required this.name, required this.onTap, this.style});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    name,
                    style: style ??
                        AppStyle.fontStyle16.copyWith(
                            fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  const Spacer(),
                  SvgPicture.asset(AppAsset.forwardIcon,
                      color: const Color(0xffADB5BD)),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
