import 'package:get/get.dart';
import 'package:submission02/ui/profile/profile_user_controller.dart';

class ProfileUsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileUserController>(
          () => ProfileUserController(),
    );
  }
}