import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission02/ui/home/home_controller.dart';
import 'package:submission02/ui/list/list_restaurant_screen.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ListRestaurantScreen(),
    );
  }
}