import 'package:chat_app_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ThemeWidget extends StatelessWidget {
  final String themeName;
  final String image;
  final Color color;
  final void Function()? onTap;
  const ThemeWidget(
      {super.key,
      required this.themeName,
      required this.image,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: color)),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SvgPicture.asset(
                  image,
                  width: Get.width * 0.408,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                themeName,
                style: AppStyle.fonstStyle14.copyWith(color: color),
              ),
              const SizedBox(height: 5),
            ],
          )),
    );
  }
}
