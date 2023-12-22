import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission02/ui/themes/theme_controller.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ThemeController _themeController = Get.find<ThemeController>();
  final count = 0.obs;
  Rx<String> currentModeName = ''.obs;
  RxBool isDarkMode = false.obs;
  late Color textColor;
  double fontSize = 20;
  late AnimationController animationController;
  @override
  void onInit() {
    isDarkMode.value = _themeController.isDarkTheme;
    currentModeName.value = _themeController.isDarkTheme ? 'Dark' : 'Light';

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 430));
    animationController.reset();
    textColor = isDarkMode.value ? Colors.white : Colors.red;
    fontSize = isDarkMode.value ? 30 : 20;

    super.onInit();
  }

  void changeAppTheme() => _changeTheme();

  bool toggleTheme() {
    _changeTheme();
    return isDarkMode.value;
  }

  void _animate() {
    if (isDarkMode.value) {
      fontSize = 30;
      textColor = Colors.white;
      animationController.reverse();
    } else {
      fontSize = 20;
      textColor = Colors.red;
      animationController.forward();
    }
  }

  void _changeTheme() {
    _themeController.changeTheme(
      isDarkMode: isDarkMode,
      modeName: currentModeName,
    );
    _animate();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
