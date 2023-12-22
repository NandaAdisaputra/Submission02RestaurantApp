import 'package:get/get.dart';
import 'package:submission02/ui/navbar/navbar_controller.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(
          () => NavBarController(),fenix: true
    );
  }
}
