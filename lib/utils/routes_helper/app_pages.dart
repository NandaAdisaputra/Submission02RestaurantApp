// ignore_for_file: constant_identifier_names
import 'package:get/get.dart';
import 'package:submission02/data/base/binding/home_binding.dart';
import 'package:submission02/data/base/binding/list_restaurant_binding.dart';
import 'package:submission02/data/base/binding/navbar_binding.dart';
import 'package:submission02/data/base/binding/review_binding.dart';
import 'package:submission02/data/base/binding/search_binding.dart';
import 'package:submission02/data/base/binding/splash_binding.dart';
import 'package:submission02/ui/home/home_screen.dart';
import 'package:submission02/ui/list/list_restaurant_screen.dart';
import 'package:submission02/ui/navbar/navbar_screen.dart';
import 'package:submission02/ui/review/add_field_review_screen.dart';
import 'package:submission02/ui/search/search_screen.dart';
import 'package:submission02/ui/splash/splash_screen.dart';
import 'package:submission02/utils/routes_helper/routes.dart';

class AppPages {
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<SplashScreen>(
      name: AppRoutes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      preventDuplicates: true,
    ),
    GetPage<HomeScreen>(
      name: AppRoutes.HOME,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding(),
      preventDuplicates: true,
    ),
    GetPage<ListRestaurantScreen>(
      name: AppRoutes.LIST,
      page: () => const ListRestaurantScreen(),
      transition: Transition.fadeIn,
      binding: ListRestaurantBinding(),
      preventDuplicates: true,
    ),
    GetPage<SearchRestaurantScreen>(
      name: AppRoutes.SEARCH,
      page: () => const SearchRestaurantScreen(),
      transition: Transition.fadeIn,
      binding: SearchRestaurantBinding(),
      preventDuplicates: true,
    ),
    GetPage<AddReviewFormScreen>(
      name: AppRoutes.REVIEW,
      page: () => AddReviewFormScreen(),
      transition: Transition.fadeIn,
      binding: ReviewRestaurantBinding(),
      preventDuplicates: true,
    ),
    GetPage<NavBarScreen>(
      name: AppRoutes.NAVBAR,
      page: () => const NavBarScreen(),
      transition: Transition.fadeIn,
      binding: NavBarBinding(),
      preventDuplicates: true,
    )
  ];
}