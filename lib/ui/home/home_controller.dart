import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 0.obs;
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
    count.value++;
    update();
  }

  void changeTheme(state) {
    if (state == true) {
      isDark = true;
      Get.changeTheme(ThemeData.dark());
    } else {
      isDark = !isDark;
      isDark = false;
      Get.changeTheme(ThemeData.light());
    }
    update();
  }
}
