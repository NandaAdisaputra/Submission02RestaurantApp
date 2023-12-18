import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission02/data/const/constants.dart';
import 'package:submission02/ui/home/home_controller.dart';
import 'package:submission02/ui/list/list_restaurant_screen.dart';
import 'package:submission02/ui/profile/profile_user.dart';
import 'package:submission02/utils/resource_helper/colors.dart';
import '../review/review_controller.dart';

var homeController = Get.put(HomeController());
final darkNotifier = ValueNotifier<bool>(false);
class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: darkNotifier,
        builder: (BuildContext context, bool isDark, Widget? child) {
          return MaterialApp(
            themeMode: isDark ? ThemeMode.light : ThemeMode.dark,
            theme: ThemeData(primaryColor: Colors.orange),
            darkTheme: ThemeData.dark(),
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ListRestaurantScreen(),
      bottomNavigationBar: BottomAppBar(
        color: Get.isDarkMode
            ? CustomColors.EerieBlack
            : Colors.orange,
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
