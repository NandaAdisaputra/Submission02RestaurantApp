// ignore_for_file: constant_identifier_names
import 'package:get/get.dart';
import 'package:submission02/data/base/binding/home_binding.dart';
import 'package:submission02/data/base/binding/list_restaurant_binding.dart';
import 'package:submission02/data/base/binding/navbar_binding.dart';
import 'package:submission02/data/base/binding/search_binding.dart';
import 'package:submission02/data/base/binding/splash_binding.dart';
import 'package:submission02/ui/home/home_screen.dart';
import 'package:submission02/ui/list/list_restaurant_screen.dart';
import 'package:submission02/ui/navbar/navbar_screen.dart';
import 'package:submission02/ui/search/search_screen.dart';
import 'package:submission02/ui/splash/splash_screen.dart';
import 'package:submission02/utils/routes_helper/routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.splashRoute;
  static const NAVBAR = Routes.navbarRoute;

  static final routes = [
    GetPage(
      name: Routes.homeRoute,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.splashRoute,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.listRoute,
      page: () => const ListRestaurantScreen(),
      binding: ListRestaurantBinding(),
    ),
    GetPage(
      name: Routes.searchRoute,
      page: () => const SearchRestaurantScreen(),
      binding: SearchRestaurantBinding(),
    ),
    GetPage(
      name: Routes.navbarRoute,
      page: () => const NavBarScreen(),
      binding: NavBarBinding(),
    ),
  ];
}
