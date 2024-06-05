import 'package:get/get.dart';
import 'package:thortbal/Presentations/Authentication/login/login.controller.dart';

class TBLoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TBLoginController>(
        () => TBLoginController(repository: Get.find()));
  }
}
