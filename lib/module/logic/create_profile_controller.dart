import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProfileController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
}
