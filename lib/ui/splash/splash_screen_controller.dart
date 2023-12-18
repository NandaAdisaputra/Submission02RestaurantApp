import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission02/ui/home/home_screen.dart';

class SplashController extends GetxController {
  var isDark = false;

  @override
  void onInit() {
    super.onInit();
    Timer(
      const Duration(seconds: 3),
          () => Get.off(HomeScreen()),);
  }
  void increment() {
    update();
  }

  void changeTheme(state) {
    if (state == true) {
      isDark = true;
      Get.changeTheme(ThemeData.dark());
    } else {
      isDark = false;
      Get.changeTheme(ThemeData.light());
    }
    update();
  }
}