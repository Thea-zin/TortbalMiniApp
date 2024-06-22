import 'package:firebase_auth/firebase_auth.dart';
import 'package:thortbal/core/utils/typedefs.dart';
import 'package:thortbal/data/datasource/remote/api_service.dart';
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
  ResultFuture<User> signInWithEmailAndPassword(String email, String password) {
    return _apiService.signInwithEmailAndPassword(email, password);
  }
  
  @override
  ResultFuture<User> createUserwithEmailAndPassword(String email, String password) {
    // TODO: implement createUserwithEmailAndPassword
    return _apiService.createUserWithEmailAndPassword(email, password);
  }
  
  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  Future<void> verifyPhoneNumber(String phoneNumber){
    return _apiService.verifyPhoneNumber(phoneNumber);
  }
  ///verify OTP
   Future<User?> signInWithPhoneNumber(String otpCode){
    return _apiService.signInWithPhoneNumber(otpCode);
   }
 ResultFuture<UserCredential> signInWithGoogle() async {
    return _apiService.signInWithGoogle();
  }
}
