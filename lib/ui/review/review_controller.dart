import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission02/data/model/review.dart';
import 'package:submission02/data/network/api_service.dart';
import 'package:submission02/utils/widget/custom_progress_indicator.dart';

class ReviewController extends GetxController {
  final ApiServices apiServices = ApiServices();
  final reviews = <Review>[].obs;
  final readTerms = false.obs;
  final readPrivacy = false.obs;
  final enableIntroButton = false.obs;
  var isDataLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchReviewData();
  }

  void fetchReviewData() async {
    isDataLoading(true);
    CustomProgressIndicator.openLoadingDialog();
    try {
      final reviewList = await apiServices.fetchReview("/review");
      reviews.assignAll(reviewList);
      isDataLoading(false);
    } catch (e) {
      print('Error fetching review Restaurant data $e');
    }
  }

  Future<void> createReview(
      {required String? id,
      required String name,
      required String review,
      required String date}) async {
    isDataLoading(true);
    CustomProgressIndicator.openLoadingDialog();
    try {
      final newReview = await apiServices.createReview(
          id: id, name: name, review: review, date: date);
      reviews.add(newReview as Review);
      await CustomProgressIndicator.closeLoadingOverlay();
      isDataLoading(false);
      Get.snackbar(
        'Success',
        'New Review Restaurant created: $name',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      print('Error creating review Restaurant: $e');
    }
  }
  void isIntroButtonDisabled() {
    if (readTerms.value && readPrivacy.value) {
      enableIntroButton.value = true;
      debugPrint('Button is now enabled');
    }
  }
}
