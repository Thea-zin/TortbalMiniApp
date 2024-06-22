import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thortbal/core/services/tb_routes.dart';
import 'package:thortbal/data/repositories/remote/api_repositories_imp.dart';

class TBSignupController extends GetxController {
  final ApiRepositoriesImpl repository;
  TBSignupController({required this.repository});
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

  void phoneNumberSignup() async {
    // String? phoneNumber= phoneNumberEditingController.text.replaceAll("0", "+855");

    var phoneNumber = phoneNumberEditingController.text;
    print(phoneNumber);

    if (phoneNumber.length >= 9) {
      if (phoneNumber[0] == "0") {
        phoneNumber = phoneNumber.replaceFirst("0", "+855");
      }

      repository.verifyPhoneNumber( phoneNumber);
      Get.toNamed(AppRoutes.otpSignup);
    } else {
      print("Not enough phon number");
    }
  }
  void OTPsignUp() async{
    var otpCode = otpCode1TextEditingController.text +
        otpCode2TextEditingController.text +
        otpCode3TextEditingController.text +
        otpCode4TextEditingController.text +
        otpCode5TextEditingController.text +
        otpCode6TextEditingController.text;

    print(otpCode);
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
  }
}
