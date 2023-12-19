import 'package:get/get.dart';
import 'package:submission02/ui/list/list_restaurant_controller.dart';

class ListRestaurantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListRestaurantController>(
      () => ListRestaurantController(),
    );
  }
}
