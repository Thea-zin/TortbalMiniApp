import 'package:get/get.dart';
import 'package:thortbal/Presentations/Authentication/login/login.controller.dart';
import 'package:thortbal/data/repositories/remote/api_repositories_imp.dart';

class TBLoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TBLoginController>(
      () => TBLoginController(repository: Get.find())
    );
  }
}
