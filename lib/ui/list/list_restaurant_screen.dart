import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission02/data/const/constants.dart';
import 'package:submission02/ui/list/future_builder_list_screen.dart';
import 'package:submission02/ui/list/list_restaurant_controller.dart';
import 'package:submission02/ui/search/search_screen.dart';
import 'package:submission02/utils/resource_helper/assets.dart';
import 'package:submission02/utils/resource_helper/sizes.dart';

class ListRestaurantScreen extends GetView<ListRestaurantController> {
  const ListRestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        leading: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(ImageAssets.imageLeading),),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Tooltip(
              message: Constants.search,
              child: Material(
                color: Colors.deepOrange,
                child: InkWell(
                  onTap: () => Get.to(
                    const SearchRestaurantScreen(),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.orangeAccent.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                child: Text(
                  Constants.title,
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: displayWidth(context) * 0.08,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                height: 30,
                child: Divider(color: Colors.red)),
            Center(
              child: Text(
                Constants.subTitle,
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: displayWidth(context) * 0.04,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            const Expanded(child: FutureBuilderRestaurant())
          ],
        ),
      ),
    );
  }
}
