import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:thortbal/core/services/tb_routes.dart';
import 'package:thortbal/core/utils/typedefs.dart';
import 'package:thortbal/data/repositories/remote/api_repositories_imp.dart';

class TBLoginController extends GetxController {
  final ApiRepositoriesImpl repository;

  TBLoginController({required this.repository});

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController phoneNumberEditingController = TextEditingController();

  TextEditingController otpCode1TextEditingController = TextEditingController();
  TextEditingController otpCode2TextEditingController = TextEditingController();
  TextEditingController otpCode3TextEditingController = TextEditingController();
  TextEditingController otpCode4TextEditingController = TextEditingController();
  TextEditingController otpCode5TextEditingController = TextEditingController();
  TextEditingController otpCode6TextEditingController = TextEditingController();
  final RxBool _isLoading = false.obs;

  /// local declare
  bool get isLoading => _isLoading.value;

  /// getx declare
  set isLoading(bool value) => _isLoading.value = value;

  void login() async {
    isLoading = true;
    update();

    var email = emailTextEditingController;
    var password = passwordTextEditingController;

    print(email.text);
    print(password.text);

    await Future.delayed(const Duration(seconds: 1));

    var response =
        await repository.signInWithEmailAndPassword(email.text, password.text);
    if (response is DataSuccess) {
      var data = response.data;
      print(data);
      Get.toNamed(AppRoutes.main);
    } else {
      var erorr = response.error;
      print(erorr);
    }

    isLoading = false;
    update();
  }

  void phoneNumberLogin() async {
    isLoading =
        true; // Set isLoading to true before starting the async operation
    update();

    String phoneNumber =
        phoneNumberEditingController.text.replaceAll("0", "+855");

    print(phoneNumber);

    if (phoneNumber != '') {
      repository.verifyPhoneNumber(phoneNumber);
      Get.toNamed(AppRoutes.otp);
    } else {
      print('fail');
    }

    isLoading = false;
    update();
  }

  void verifyOTP() async {
    isLoading = true;
    update();
    String phoneNumber = phoneNumberEditingController.text;
    String smsCode = "code";
    var otpCode = otpCode1TextEditingController.text +
        otpCode2TextEditingController.text +
        otpCode3TextEditingController.text +
        otpCode4TextEditingController.text +
        otpCode5TextEditingController.text +
        otpCode6TextEditingController.text;

   var user= await repository.signInWithPhoneNumber(otpCode);
    try{ 
      if(user !=null){
        print("success :$user ");
        Get.toNamed(AppRoutes.main);
      }
      else{
        print("Signup faile code if not correct");
      }
    }
    catch(e){
        print("Erorr :$e");
    }

    isLoading = false;
    update();
  }

  ///COntroller gmail
  void siginWithGmail() async {
    isLoading = true;
    update();
    var response = await repository.signInWithGoogle();

    if (response is DataSuccess) {
      var user = response.data;
      print("success gmail");
      print(user);
      Get.toNamed(AppRoutes.main);
      isLoading = false;
      update();
    } else {
      print("problem");
    }
  }
}
