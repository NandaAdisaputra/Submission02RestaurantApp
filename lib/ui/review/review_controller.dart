import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission02/data/model/review.dart';
import 'package:submission02/data/network/api_service.dart';

class ReviewController extends GetxController {
  final ApiServices apiServices = ApiServices();
  final reviews = <Review>[].obs;
  var isDark = false;

  @override
  void onInit() {
    super.onInit();
    fetchReviewData();
  }

  void fetchReviewData() async {
    try {
      final reviewList = await apiServices.fetchReview("/review");
      reviews.assignAll(reviewList);
    } catch (e) {
      print('Error fetching review Restaurant data $e');
    }
  }

  Future<void> createReview(
      {required String name,
        required String review,
        required String date}) async {
    try {
      final newReview = await apiServices.createReview(
          name: name, review: review, date: date);
      reviews.add(newReview);
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
  void increment() {
    update();
  }

  void changeTheme(state) {
    if (state == true) {
      isDark = true;
      Get.changeTheme(ThemeData.dark());
    } else {
      isDark = false;
      Get.changeTheme(ThemeData.light());
    }
    update();
  }
}