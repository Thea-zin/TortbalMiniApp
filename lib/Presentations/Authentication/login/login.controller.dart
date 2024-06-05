import 'package:get/get.dart';
import 'package:thortbal/data/repositories/remote/api_repositories_imp.dart';

class TBLoginController extends GetxController {
  final ApiRepositoriesImpl repository;

  TBLoginController({required this.repository});

  final RxBool _isLoading = false.obs;

  /// local declare
  bool get isLoading => _isLoading.value;

  /// getx declare
  set isLoading(bool value) => _isLoading.value = value;

  void login() async {
    isLoading = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    update();
  }
}
