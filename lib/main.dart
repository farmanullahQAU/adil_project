import "package:flutter/material.dart";
import "package:fyp/Constants/constants.dart";
import 'package:fyp/Screens/login_screen.dart';
import 'package:get/get.dart';
import 'Controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization.then((value) {
    Get.put(AuthController());
  });
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}
