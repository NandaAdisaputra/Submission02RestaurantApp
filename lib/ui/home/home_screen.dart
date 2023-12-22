import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission02/data/const/constants.dart';
import 'package:submission02/ui/home/home_controller.dart';
import 'package:submission02/ui/list/list_restaurant_screen.dart';
import 'package:submission02/ui/search/search_screen.dart';
import 'package:submission02/ui/themes/theme_controller.dart';
import 'package:submission02/utils/resource_helper/assets.dart';
import 'package:submission02/utils/resource_helper/colors.dart';

var homeController = Get.put(HomeController());
var themeController = Get.put(ThemeController());

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(ImageAssets.imageLeading),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Tooltip(
                message: Constants.search,
                child: Material(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? CustomColors.Jet
                      : CustomColors.DarkOrange,
                  child: InkWell(
                    onTap: () => Get.to(
                      const SearchRestaurantScreen(),
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: InkWell(
                onTap: () => Get.to(
                  Get.bottomSheet(
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? CustomColors.Jet
                              : CustomColors.DarkOrange,
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Get.isDarkMode
                                ? Icons.light_mode
                                : Icons.dark_mode),
                            title: Text(Get.isDarkMode
                                ? Constants.lightMode
                                : Constants.darkMode),
                            onTap: () {
                              homeController.changeAppTheme();
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
        body: ListRestaurantScreen());
  }
}
