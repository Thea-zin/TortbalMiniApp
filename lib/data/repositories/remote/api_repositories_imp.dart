import 'package:thortbal/core/utils/typedefs.dart';
import 'package:thortbal/data/datasource/remote/api_service.dart';
import 'package:thortbal/domain/models/user.dart';
import 'package:thortbal/domain/repositories/api_repositories.dart';

class ApiRepositoriesImpl extends ApiRepositories {
  final ApiService _apiService = ApiService();

  @override
  Future<void> login(String username, String password) {
    return _apiService.login(username, password);
  }

  @override
  Future<void> signInWithGmail(String username, String password) {
    return _apiService.signInWithGmail(username, password);
  }

  @override
  ResultFuture<User> signInWithEmailAndPassword(String email, String password) async {
    // TODO: implement signInWithEmailAndPassword
    return await _apiService.signInwithEmailAndPassword(email, password);
  }
  
}
