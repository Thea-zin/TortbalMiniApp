import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:thortbal/core/services/tb_routes.dart';
import 'package:thortbal/core/utils/typedefs.dart';
import 'package:thortbal/data/repositories/remote/api_repositories_imp.dart';

class TBLoginController extends GetxController {

  final ApiRepositoriesImpl repository;

  TBLoginController({required this.repository});

  TextEditingController emailTextEditingController= TextEditingController();
  TextEditingController passwordTextEditingController= TextEditingController();
  
  final RxBool _isLoading = false.obs;

  /// local declare
  bool get isLoading => _isLoading.value;

  /// getx declare
  set isLoading(bool value) => _isLoading.value = value;
  

  void login() async {
    isLoading = true;
    update();

    var email=emailTextEditingController;
    var password=passwordTextEditingController;

    print(email.text);
    print(password.text);

    await Future.delayed(const Duration(seconds: 1));

    var response = await 
    repository.signInWithEmailAndPassword(email.text, password.text);
    if(response is DataSuccess)
      { 

        var data = response.data;
        print(data);
        Get.toNamed(AppRoutes.main);
      }
    else 
      { 
        var erorr = response.error;
        print(erorr);
      }

    isLoading = false;
    update();
  }
}
