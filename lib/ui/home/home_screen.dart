import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission02/data/const/constants.dart';
import 'package:submission02/ui/home/home_controller.dart';
import 'package:submission02/ui/list/list_restaurant_screen.dart';
import 'package:submission02/ui/profile/profile_user.dart';
import 'package:submission02/ui/review/add_field_review_screen.dart';
import 'package:submission02/utils/resource_helper/assets.dart';
import 'package:submission02/utils/widget/review_list_widget.dart';

import '../review/review_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
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
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.to(AddReviewFormScreen());
      }, child: IconAssets.addIcon),
      bottomNavigationBar: BottomAppBar(
        color: Colors.orange,
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
                      Text(Constants.home, style: TextStyle(color: Colors.white)),
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
                    ReviewListWidget(),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.reviews, color: Colors.white),
                      Text(Constants.addReview, style: TextStyle(color: Colors.white)),
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
                      Text(Constants.profileUsers, style: TextStyle(color: Colors.white)),
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