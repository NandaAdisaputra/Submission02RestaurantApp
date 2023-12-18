import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var count = 0;
  var isDark = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() {
    count;
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