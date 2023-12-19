import 'package:flutter/material.dart';
import 'package:submission02/data/model/review.dart';
import 'package:submission02/utils/resource_helper/fonts.dart';
import '../../utils/resource_helper/sizes.dart';
import '../../utils/resource_helper/strings.dart';

class ReviewDetailsScreen extends StatelessWidget {
  final Review review;

  const ReviewDetailsScreen({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.reviewDetail),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(AppStrings.reviewName,
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: displayWidth(context) * FontSize.s0045,
                        fontWeight: FontWeight.normal)),
                AppSizes.wSizeBox20,
                Text(review.name,
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: displayWidth(context) * FontSize.s0045,
                        fontWeight: FontWeight.normal)),
              ],
            ),
            Row(
              children: [
                Text(AppStrings.reviewDesc,
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: displayWidth(context) * FontSize.s0045,
                        fontWeight: FontWeight.normal)),
                AppSizes.wSizeBox20,
                Text(review.review,
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: displayWidth(context) * FontSize.s0045,
                        fontWeight: FontWeight.normal)),
              ],
            ),
            Row(
              children: [
                Text(AppStrings.reviewDate,
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: displayWidth(context) * FontSize.s0045,
                        fontWeight: FontWeight.normal)),
                AppSizes.wSizeBox20,
                Text(review.date,
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: displayWidth(context) * FontSize.s0045,
                        fontWeight: FontWeight.normal)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
