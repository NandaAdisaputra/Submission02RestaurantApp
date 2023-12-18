import 'package:flutter/material.dart';
import 'package:submission02/ui/home/home_screen.dart';
import 'package:submission02/ui/list/list_restaurant_screen.dart';
import 'package:submission02/ui/review/add_field_review_screen.dart';
import 'package:submission02/ui/search/search_screen.dart';
import 'package:submission02/ui/splash/splash_screen.dart';
import 'package:submission02/utils/resource_helper/strings.dart';


class Routes {
  static const String splashRoute = "/";
  static const String homeRoute = "/home";
  static const String listRoute = "/list";
  static const String searchRoute = "/search";
  static const String reviewRoute = "/review";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.listRoute:
        return MaterialPageRoute(builder: (_) => ListRestaurantScreen());
      case Routes.searchRoute:
        return MaterialPageRoute(builder: (_) => SearchRestaurantScreen());
      case Routes.reviewRoute:
        return MaterialPageRoute(builder: (_) => AddReviewFormScreen());
      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.strNoRouteFound,
          ),
        ),
        body: Center(
          child: Text(
            AppStrings.strNoRouteFound,
          ),
        ),
      ),
    );
  }
}