import 'package:chat_app_1/constants/app_asset.dart';
import 'package:chat_app_1/constants/app_string.dart';
import 'package:chat_app_1/module/auth_screen/signup_screen.dart';
import 'package:chat_app_1/module/logic/auth_controller.dart';
import 'package:chat_app_1/utils/app_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Scaffold(
      body: GetBuilder<AuthController>(builder: (context) {
        return SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SafeArea(
                  child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  AppAsset.backIcon,
                ),
              )),
              SizedBox(height: Get.height * .2),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  AppString.enterPhone,
                  style: AppStyle.fontStyle18,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  AppString.enterCountryCode,
                  style: AppStyle.fonstStyle14,
                ),
              ),
              SizedBox(height: Get.height * .05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    // IntlPhoneField(
                    //   // validator: (value) {
                    //   //   if (value == null) {
                    //   //     return "Please enter phone number";
                    //   //   }
                    //   //   return null;
                    //   // },
                    //   decoration: const InputDecoration(
                    //       hintText: AppString.phoneNumber,
                    //       hintStyle: AppStyle.fontStyle16,
                    //       filled: true,
                    //       fillColor: Color(0xffF7F7FC),
                    //       enabledBorder: InputBorder.none),
                    //   initialCountryCode: 'Pk',
                    //   controller: controller.phoneNumberController,
                    //   onChanged: (phone) {
                    //     phone.completeNumber == controller.phoneCode;
                    //   },
                    // ),
                    const SizedBox(
                      height: 14,
                    ),
                    CustomTextField(
                      validator: AppFuction().kEmailValidator,
                      controller: controller.emailController,
                      hintText: AppString.emailAddress,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                      controller: controller.passwordController,
                      hintText: "password",
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const SignUpScreen());
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: CustomButton(
            buttonText: AppString.loginText,
            onTap: () {
              controller.signIn();
            }),
      ),
    );
  }
}
