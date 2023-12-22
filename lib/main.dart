import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:submission02/data/const/constants.dart';
import 'package:submission02/ui/themes/theme_controller.dart';
import 'package:submission02/utils/resource_helper/themes/theme.dart';
import 'package:submission02/utils/routes_helper/app_pages.dart';
import 'package:submission02/utils/routes_helper/routes.dart';
import 'package:submission02/utils/widget/custom_error_screen.dart';

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
      initialRoute: AppRoutes.SPLASH,
      defaultTransition: Transition.fadeIn,
      getPages: AppPages.routes,
      themeMode: _themeController.themeStateFromHiveSettingBox,
      initialBinding: InitialBinding(),
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      builder: (BuildContext context, Widget? widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return CustomErrorScreen(errorDetails: errorDetails);
        };
        final MediaQueryData mediaQueryData = MediaQuery.of(context);
        return MediaQuery(
          data: mediaQueryData.copyWith(
            platformBrightness: Brightness.light,
            alwaysUse24HourFormat: true,
            textScaler: TextScaler.linear(1),
            boldText: false,
          ),
          child: ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget!),
            maxWidth: 2460,
            minWidth: 450,
            defaultScale: true,
            breakpoints: const <ResponsiveBreakpoint>[
              ResponsiveBreakpoint.resize(450, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
            background: Container(
              color: const Color(0xFFF5F5F5),
            ),
          ),
        );
      },
      enableLog: kDebugMode,
      logWriterCallback: (String text, {bool isError = false}) {
        debugPrint("GetXLog: $text");
      },
      navigatorObservers: <NavigatorObserver>[
        GetObserver(),
      ],
    );
  } // CustomThemeData for Dark Theme
}
