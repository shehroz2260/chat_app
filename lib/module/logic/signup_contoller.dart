import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth_screen/auth_handler.dart';

class SignUpController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void signUp() async {
    if (!_formKey.currentState!.validate()) return;

    await AuthHandler().signUpEmail(Get.context!,
        email: emailController.text, password: passwordController.text);
  }
}
