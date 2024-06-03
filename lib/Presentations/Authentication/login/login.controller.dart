import 'package:get/get.dart';
import 'package:thortbal/core/services/tb_routes.dart';
import 'package:thortbal/core/utils/typedefs.dart';
import 'package:thortbal/data/repositories/remote/api_repositories_imp.dart';
import 'package:thortbal/domain/repositories/api_repositories.dart';

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

    await Future.delayed(const Duration(seconds: 1));

    isLoading = false;
    update();
  }
}
