import 'package:get/get.dart';
import 'package:submission02/ui/detail/detail_controller.dart';

class DetailRestaurantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRestaurantController>(
      () => DetailRestaurantController(),fenix: true
    );
  }
}
