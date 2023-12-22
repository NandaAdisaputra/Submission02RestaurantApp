import 'package:get/get.dart';
import 'package:submission02/ui/review/review_controller.dart';

class ReviewRestaurantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewController>(
      () => ReviewController(), fenix: true
    );
  }
}
