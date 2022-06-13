import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Constants/constants.dart';

import 'package:fyp/Screens/login_screen.dart';
import 'package:fyp/Screens/welcom_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  RxBool isload = false.obs;
  RxBool isHidden = false.obs;

  RxBool isLoading = false.obs;

  

  @override
  void onReady() {
    super.onReady();

    firebaseUser = Rx<User?>(auth.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => LoginScreen());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => const IntroScreen());
    }
  }

  void login(String email, password) async {
    try {
    isLoading.value=true;
      await auth.signInWithEmailAndPassword(email: email, password: password);

      isLoading.value=false;
    } on FirebaseAuthException catch (e) {

      isLoading.value=false;
      String errormessage = '';
      errormessage = e.message!;
      Get.snackbar('Error', errormessage,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 4),
          animationDuration: const Duration(microseconds: 1),
          colorText: Colors.white,
          icon: const Icon(Icons.error),
          backgroundColor: Colors.redAccent);
    }
  }

  void signOut() async {
    await auth.signOut();
  }
}
