import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission02/ui/review/review_controller.dart';
import 'package:submission02/ui/review/review_detail_screen.dart';
import 'package:submission02/utils/resource_helper/assets.dart';
import 'package:submission02/utils/resource_helper/colors.dart';
import 'package:submission02/utils/resource_helper/fonts.dart';
import 'package:submission02/utils/resource_helper/sizes.dart';

// ignore: must_be_immutable
class ReviewListWidget extends StatelessWidget {
  ReviewController reviewController = Get.put(ReviewController());

  ReviewListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (reviewController.reviews.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.separated(
          itemBuilder: (context, index) {
            final review = reviewController.reviews[index];
            return ListTile(
              title: Text(review.name,
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? CustomColors.White
                          : CustomColors.DarkOrange,
                      fontSize: displayWidth(context) * FontSize.s0045,
                      fontWeight: FontWeight.normal)),
              subtitle: Text(review.review,
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? CustomColors.White
                          : CustomColors.DarkOrange,
                      fontSize: displayWidth(context) * FontSize.s0045,
                      fontWeight: FontWeight.normal)),
              trailing: IconAssets.nextIcon,
              onTap: () {
                Get.to(ReviewDetailsScreen(review: review));
              },
            );
          },
          itemCount: reviewController.reviews.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        );
      }
    });
  }
}
