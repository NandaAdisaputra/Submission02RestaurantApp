import 'package:get/get.dart';
import 'package:submission02/ui/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),fenix: true
    );
  }
}
