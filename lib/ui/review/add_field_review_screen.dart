import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission02/data/const/constants.dart';
import 'package:submission02/ui/review/review_controller.dart';
import 'package:submission02/utils/resource_helper/colors.dart';
import 'package:submission02/utils/resource_helper/sizes.dart';
import 'package:submission02/utils/resource_helper/strings.dart';
import 'text_field_controller.dart';

class AddReviewFormScreen extends StatelessWidget {
  final ReviewController reviewController = Get.find();
  final TextFieldController textFieldController =
      Get.put(TextFieldController());
  final String? restaurantID;

  AddReviewFormScreen({super.key, this.restaurantID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.addReview,
            style: TextStyle(
                color: Colors.white, fontFamily: Constants.helvetica)),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? CustomColors.Jet
            : CustomColors.DarkOrange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textFieldController.nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? CustomColors.White
                        : CustomColors.DarkOrange,
                  ),
                  labelText: AppStrings.reviewName,
                  hintText: AppStrings.reviewName),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textFieldController.reviewController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.description,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? CustomColors.White
                        : CustomColors.DarkOrange,
                  ),
                  labelText: AppStrings.reviewDesc,
                  hintText: AppStrings.reviewDesc),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textFieldController.dateController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? CustomColors.White
                        : CustomColors.DarkOrange,
                  ),
                  labelText: AppStrings.reviewDate,
                  hintText: AppStrings.reviewDate),
            ),
          ),
          AppSizes.hSizeBox20,
          Obx(() {
            return Container(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? CustomColors.Jet
                              : CustomColors.DarkOrange),
                  onPressed: textFieldController.isButtonEnabled.value
                      ? () {
                          createNewReview();
                          textFieldController.nameController.clear();
                          textFieldController.reviewController.clear();
                          textFieldController.dateController.clear();
                        }
                      : null,
                  child: Text(
                    AppStrings.addReview,
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? CustomColors.White
                            : CustomColors.DarkOrange,
                        fontFamily: Constants.helvetica),
                  )),
            );
          })
        ],
      ),
    );
  }

  void createNewReview() {
    final name = textFieldController.nameController.text;
    final review = textFieldController.reviewController.text;
    final date = textFieldController.dateController.text;

    reviewController.createReview(
        name: name, review: review, date: date, id: restaurantID);
  }
}
