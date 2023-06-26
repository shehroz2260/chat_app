import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth_screen/auth_handler.dart';

class AuthController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  String phoneCode = '92';
  String phoneNumer = '';
  String verificationId = '';
  String flagUri = '';
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signIn() async {
    if (!_formKey.currentState!.validate()) return;

    await AuthHandler().signInEmail(Get.context!,
        email: emailController.text, password: passwordController.text);
  }
}
