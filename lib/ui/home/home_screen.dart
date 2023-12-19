import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission02/data/const/constants.dart';
import 'package:submission02/ui/home/home_controller.dart';
import 'package:submission02/ui/list/list_restaurant_screen.dart';
import 'package:submission02/ui/profile/profile_user.dart';
import 'package:submission02/ui/search/search_screen.dart';
import 'package:submission02/utils/resource_helper/assets.dart';
import 'package:submission02/utils/resource_helper/colors.dart';
import 'package:submission02/utils/theme/app_theme.dart';
import '../review/review_controller.dart';

var homeController = Get.put(HomeController());
final darkNotifier = ValueNotifier<bool>(false);

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final lightTheme = AppLightTheme();
    final darkTheme = AppDarkTheme();
    return ValueListenableBuilder<bool>(
        valueListenable: darkNotifier,
        builder: (BuildContext context, bool isDark, Widget? child) {
          return MaterialApp(
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: lightTheme.primarySwatch,
              appBarTheme: lightTheme.appBarTheme,
              scaffoldBackgroundColor: lightTheme.scaffoldBackgroundColor,
              floatingActionButtonTheme: lightTheme.floatingActionButtonTheme,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: darkTheme.primarySwatch,
              appBarTheme: darkTheme.appBarTheme,
              scaffoldBackgroundColor: darkTheme.scaffoldBackgroundColor,
              floatingActionButtonTheme: darkTheme.floatingActionButtonTheme,
            ),
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        });
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var reviewRestaurantController = Get.put(ReviewController());

  @override
  void dispose() {
    darkNotifier.dispose();
    super.dispose();
  }

  void changeTheme(state) {
    if (listController.isDark == true) {
      homeController.isDark = !homeController.isDark;
      setState(() {
        Get.changeTheme(ThemeData.dark());
      });
    } else {
      setState(() {
        Get.changeTheme(ThemeData.light());
        homeController.isDark;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Get.isDarkMode ? CustomColors.Jet : CustomColors.DarkOrange,
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
                color:
                    Get.isDarkMode ? CustomColors.Jet : CustomColors.DarkOrange,
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
          GetBuilder<HomeController>(
            builder: (__) => Switch(
                focusColor: CustomColors.CyberYellow,
                value: homeController.isDark,
                onChanged: (state) {
                  changeTheme(state);
                  darkNotifier.value = homeController.isDark;
                  homeController.changeTheme(state);
                }),
          )
        ],
      ),
      body: const ListRestaurantScreen(),
      bottomNavigationBar: BottomAppBar(
        color: Get.isDarkMode ? CustomColors.EerieBlack : Colors.orange,
        elevation: 20.0,
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 60.0,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, color: Colors.white),
                      Text(Constants.home,
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 60.0,
                child: InkWell(
                  onTap: () => Get.to(
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Under Development"),
                    )),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite, color: Colors.white),
                      Text(Constants.addFavorite,
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 60.0,
                child: InkWell(
                  onTap: () => Get.to(
                    const ProfileUserScreen(),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, color: Colors.white),
                      Text(Constants.profileUsers,
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
