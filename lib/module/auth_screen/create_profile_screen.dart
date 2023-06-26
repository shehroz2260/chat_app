import 'package:chat_app_1/constants/app_asset.dart';
import 'package:chat_app_1/constants/app_string.dart';
import 'package:chat_app_1/module/logic/create_profile_controller.dart';
import 'package:chat_app_1/module/services/create_profile_service.dart';
import 'package:chat_app_1/utils/app_style.dart';
import 'package:chat_app_1/widgets/custom_button.dart';
import 'package:chat_app_1/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateProfileController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 14,
              ),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(AppAsset.backIcon)),
                    const Text(
                      AppString.yourProfile,
                      style: AppStyle.fontStyle18,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.07,
                    ),
                    SvgPicture.asset(
                      AppAsset.profileImage,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter username";
                        }
                        return null;
                      },
                      controller: controller.userNameController,
                      hintText: AppString.username,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter firstname";
                        }
                        return null;
                      },
                      controller: controller.firstNameController,
                      hintText: AppString.firstName,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      controller: controller.lastNameController,
                      hintText: AppString.lastName,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      controller: controller.dobController,
                      hintText: AppString.dob,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      controller: controller.genderController,
                      hintText: AppString.gender,
                      width: double.infinity,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: CustomButton(
            buttonText: AppString.save,
            onTap: () {
              if (!controller.formKey.currentState!.validate()) return;
              CreateProfileService().storeCreateprofileData();
            }),
      ),
    );
  }
}
