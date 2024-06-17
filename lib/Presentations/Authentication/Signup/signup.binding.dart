import 'package:get/get.dart';
import 'package:thortbal/Presentations/Authentication/Signup/signup.controller.dart';
import 'package:thortbal/Presentations/Authentication/login/login.controller.dart';

class TBSignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TBSignupController>(
        () => TBSignupController(repository: Get.find()));
  }
}
