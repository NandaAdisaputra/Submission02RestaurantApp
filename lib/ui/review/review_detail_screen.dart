import 'package:flutter/material.dart';
import 'package:submission02/data/model/review.dart';
import 'package:submission02/utils/resource_helper/styles.dart';
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
                Text(AppStrings.reviewName, style: TextStyles.txtBold14),
                AppSizes.wGap20,
                Text(review.name, style:  TextStyles.txtSemiBold18)
              ],
            ),
            Row(
              children: [
                Text(AppStrings.reviewDesc, style: TextStyles.txtBold14),
                AppSizes.wGap20,
                Text(review.review, style: TextStyles.txtSemiBold18)
              ],
            ),
            Row(
              children: [
                Text(AppStrings.reviewDate, style: TextStyles.txtBold14),
                AppSizes.wGap20,
                Text(review.date, style: TextStyles.txtSemiBold18),
              ],
            ),
          ],
        ),
      ),
    );
  }
}