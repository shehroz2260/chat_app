import 'package:chat_app_1/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingHelper {
  static showLoading() {
    Get.dialog(
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [CircularProgressIndicator(color: AppStyle.greencolor)],
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen ?? false) Get.back();
  }
}
