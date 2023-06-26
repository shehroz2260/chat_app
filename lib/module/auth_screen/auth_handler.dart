import 'package:chat_app_1/constants/app_collections.dart';
import 'package:chat_app_1/module/auth_screen/create_profile_screen.dart';
import 'package:chat_app_1/module/auth_screen/otp_screen.dart';
import 'package:chat_app_1/module/bottom_navigation/main_screen.dart';
import 'package:chat_app_1/module/logic/auth_controller.dart';
import 'package:chat_app_1/utils/constants.dart';
import 'package:chat_app_1/utils/custom_snack_bar.dart';
import 'package:chat_app_1/utils/loading_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bottom_navigation/main_controller.dart';
import '../model/user_model.dart';
import 'login_screen.dart';

class AuthHandler {
  UserCredential? userdata;
  final _auth = FirebaseAuth.instance;

  Future<void> signUpEmail(BuildContext context,
      {required String email, required String password}) async {
    try {
      LoadingHelper.showLoading();

      userdata = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _auth.currentUser!.sendEmailVerification();
      Constant.userModel = UserModel(
        createdAt: Timestamp.now(),
        dob: "",
        email: email,
        firstName: "",
        gender: "",
        lastName: "",
        phoneNumer: "",
        uid: _auth.currentUser!.uid,
        userName: "",
      );
      await FirebaseFirestore.instance
          .collection(AppCollections.user)
          .doc(_auth.currentUser!.uid)
          .set(Constant.userModel!.toMap());
      CustomSnackBar.show(message: "you will recieve verification email");
      LoadingHelper.hideLoading();
      Get.offAll(const LoginScreen());
    } on FirebaseException catch (e) {
      LoadingHelper.hideLoading();
      print(e.message);
      CustomSnackBar.show(message: e.message);
    }
  }

  final controller = Get.put(AuthController());
  Future<void> phoneNumberVerification({required String phoneNumber}) async {
    try {
      LoadingHelper.showLoading();
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {
            _auth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseException firebaseException) {},
          codeSent: (String verificationId, int? resendToken) {
            controller.verificationId = verificationId;
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            controller.verificationId = verificationId;
          });
      Constant.userModel = UserModel(
        createdAt: Timestamp.now(),
        dob: "",
        email: "",
        firstName: "",
        gender: "",
        lastName: "",
        phoneNumer: phoneNumber,
        uid: _auth.currentUser!.uid,
        userName: "",
      );
      await FirebaseFirestore.instance
          .collection(AppCollections.user)
          .doc()
          .set(Constant.userModel!.toMap());
      CustomSnackBar.show(message: "you will recieve verification code");
      LoadingHelper.hideLoading();
      Get.to(const OtpScreen());
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  Future<bool> verifyOtp(String otp) async {
    var credential = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: controller.verificationId, smsCode: otp));
    return credential.user != null ? true : false;
  }

  Future<void> signInEmail(BuildContext context,
      {required String email, required String password}) async {
    try {
      userdata = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        CustomSnackBar.show(
            message: 'Email is not verified check your email! ');
        return;
      }

      checkUserExists();
    } on FirebaseException catch (e) {
      print(e.message);
      CustomSnackBar.show(message: e.message);
    }
  }

  static Future getuserData({required String uid}) async {
    try {
      var value = await FirebaseFirestore.instance
          .collection(AppCollections.user)
          .doc(uid)
          .get();
      if (value.exists) {
        Constant.userModel = UserModel.fromMap(value.data()!);
      }

      return Constant.userModel;
    } on FirebaseException catch (e) {
      CustomSnackBar.show(message: e.message);
      return UserModel.empty;
    }
  }

  Future<void> checkUserExists() async {
    await getuserData(uid: _auth.currentUser!.uid);
    if (Constant.userModel == null) {
      Constant.userModel = UserModel(
          dob: "",
          email: _auth.currentUser!.email!,
          firstName: "",
          gender: "",
          lastName: "",
          phoneNumer: "",
          uid: _auth.currentUser!.uid,
          userName: "",
          emailVerified: _auth.currentUser!.emailVerified);

      FirebaseFirestore.instance
          .collection(AppCollections.user)
          .doc(_auth.currentUser!.uid)
          .set(Constant.userModel!.toMap());
      Get.offAll(const CreateProfileScreen());
      return;
    }

    if (Constant.userModel!.userName.isEmpty ||
        Constant.userModel!.firstName.isEmpty) {
      Get.offAll(const CreateProfileScreen());
      return;
    }

    Get.offAll(() => const MainScreen());
    Get.put(MainController()).updateIndex(0);
  }

  void logOut() {
    Get.dialog(
      AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to logout?'),
        actions: [
          MaterialButton(
            child: const Text('No'),
            onPressed: () => Get.back(),
          ),
          MaterialButton(
            child: const Text('Yes'),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (FirebaseAuth.instance.currentUser != null) return;

              Constant.userModel = null;
              Get.offAll(() => const LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}
