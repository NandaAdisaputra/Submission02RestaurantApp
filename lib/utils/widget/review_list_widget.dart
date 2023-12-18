import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission02/ui/review/review_controller.dart';
import 'package:submission02/ui/review/review_detail_screen.dart';
import 'package:submission02/utils/resource_helper/assets.dart';
import 'package:submission02/utils/resource_helper/styles.dart';

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
              title: Text(
                review.name,
                style:  TextStyles.txtBold24,
              ),
              subtitle: Text(review.review, style: TextStyles.txtSemiBold18),
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