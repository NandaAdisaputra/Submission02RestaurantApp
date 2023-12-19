import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission02/data/const/constants.dart';
import 'package:submission02/ui/list/future_builder_list_screen.dart';
import 'package:submission02/ui/list/list_restaurant_controller.dart';
import 'package:submission02/utils/resource_helper/colors.dart';
import 'package:submission02/utils/resource_helper/fonts.dart';
import 'package:submission02/utils/resource_helper/sizes.dart';

var listController = Get.put(ListRestaurantController());

class ListRestaurantScreen extends GetView<ListRestaurantController> {
  const ListRestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Container(
                color: Get.isDarkMode
                    ? CustomColors.Jet
                    : CustomColors.SelectiveYellow,
                child: Center(
                  child: Text(
                    Constants.title,
                    style: TextStyle(
                        color: Get.isDarkMode
                            ? CustomColors.White
                            : CustomColors.Scarlet,
                        fontSize: displayWidth(context) * FontSize.s008,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                height: 30,
                child: Divider(
                    color: Get.isDarkMode
                        ? CustomColors.MiddleYellow
                        : CustomColors.Scarlet)),
            Center(
              child: Text(
                Constants.subTitle,
                style: TextStyle(
                    color: Get.isDarkMode
                        ? CustomColors.MiddleYellow
                        : CustomColors.Scarlet,
                    fontSize: displayWidth(context) * FontSize.s0045,
                    fontWeight: FontWeight.bold),
              ),
            ),
            AppSizes.hSizeBox30,
            const Expanded(child: FutureBuilderRestaurant())
          ],
        ),
      ),
    );
  }
}
