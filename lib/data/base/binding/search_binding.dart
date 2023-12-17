import 'package:get/get.dart';
import 'package:submission02/ui/search/search_controller.dart';

class SearchRestaurantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchRestaurantController>(
          () => SearchRestaurantController(),
    );
  }
}