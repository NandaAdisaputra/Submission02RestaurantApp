import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission02/utils/routes_helper/app_pages.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Restaurant App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}