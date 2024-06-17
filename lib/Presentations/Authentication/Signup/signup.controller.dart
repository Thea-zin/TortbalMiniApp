import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thortbal/core/services/tb_routes.dart';
import 'package:thortbal/data/repositories/remote/api_repositories_imp.dart';

class TBSignupController extends GetxController {
  final ApiRepositoriesImpl repository;
  TBSignupController({required this.repository});
  TextEditingController phoneNumberEditingController = TextEditingController();

  final RxBool _isLoading = false.obs;

  /// local declare
  bool get isLoading => _isLoading.value;

  /// getx declare
  set isLoading(bool value) => _isLoading.value = value;
  void phoneNumberSignup() async {
    // String? phoneNumber= phoneNumberEditingController.text.replaceAll("0", "+855");

    var phoneNumber = phoneNumberEditingController.text;

    if (phoneNumber.length < 9) {
      if (phoneNumber[0] == "0") {
        phoneNumber = phoneNumber.replaceFirst("0", "+855");
      }

      repository.verifyPhoneNumber(phoneNumber);
      Get.toNamed(AppRoutes.otpSignup);
    } else {
      print("fail");
    }
  }
}
