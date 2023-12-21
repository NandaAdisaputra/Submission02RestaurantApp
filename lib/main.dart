import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:submission02/data/const/constants.dart';
import 'package:submission02/ui/themes/theme_controller.dart';
import 'package:submission02/utils/resource_helper/themes/theme.dart';
import 'package:submission02/utils/routes_helper/app_pages.dart';

import 'data/base/binding/initial_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox('settings'); // Open the box that will store the settings
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.put(ThemeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.title,
      initialRoute: AppPages.NAVBAR,
      getPages: AppPages.routes,
      themeMode: _themeController
          .themeStateFromHiveSettingBox,
      initialBinding:
      InitialBinding(), // Initial Binding to make Sure the ThemeController is initializedtting the ThemeMode from the Hive Setting Box
      theme: CustomTheme.lightTheme, // CustomThemeData for Light Theme
      darkTheme: CustomTheme.darkTheme, // CustomThemeData for Dark Theme
    );
  }
}