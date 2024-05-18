import 'package:get/get.dart';
import 'package:thortbal/Presentations/Profile/profile.controller.dart';
import 'package:thortbal/domain/repositories/api_repositories.dart';

class IMProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TBProfileController>(
      () => TBProfileController(
        Get.find<ApiRepositories>(),
      ),
    );
  }
}
