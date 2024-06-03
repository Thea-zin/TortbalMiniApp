import 'package:get/get.dart';
import 'package:thortbal/data/datasource/local/local_service.dart';
import 'package:thortbal/data/datasource/remote/api_service.dart';
import 'package:thortbal/data/repositories/local/local_respositories_impl.dart';
import 'package:thortbal/data/repositories/remote/api_repositories_imp.dart';
import 'package:thortbal/domain/repositories/api_repositories.dart';

class AppMainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService());
    Get.lazyPut<LocalService>(() => LocalService());
    Get.lazyPut<ApiRepositoriesImpl>(() => ApiRepositoriesImpl());
    Get.lazyPut<LocalRepositoriesImpl>(() => LocalRepositoriesImpl());
  }
}
