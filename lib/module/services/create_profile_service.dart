import 'package:chat_app_1/constants/app_collections.dart';
import 'package:chat_app_1/module/bottom_navigation/main_screen.dart';
import 'package:chat_app_1/module/logic/create_profile_controller.dart';
import 'package:chat_app_1/utils/constants.dart';
import 'package:chat_app_1/utils/custom_snack_bar.dart';
import 'package:chat_app_1/utils/loading_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CreateProfileService {
  final controller = Get.put(CreateProfileController());
  Future<void> storeCreateprofileData() async {
    try {
      Constant.userModel = Constant.userModel!.copyWith(
        userName: controller.userNameController.text,
        lastName: controller.lastNameController.text,
        firstName: controller.firstNameController.text,
        gender: controller.genderController.text,
        dob: controller.dobController.text,
      );
      LoadingHelper.showLoading();
      await FirebaseFirestore.instance
          .collection(AppCollections.user)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(Constant.userModel!.toMap());
      LoadingHelper.hideLoading();
      Get.offAll(const MainScreen());
    } on FirebaseException catch (e) {
      LoadingHelper.hideLoading();
      CustomSnackBar.show(message: e.message);
    }
  }
}
