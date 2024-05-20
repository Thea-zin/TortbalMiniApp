import 'package:firebase_auth/firebase_auth.dart';
import 'package:thortbal/core/utils/typedefs.dart';

class ApiService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> login(String username, String password) {
    throw UnimplementedError();
  }

  Future<void> signInWithGmail(String username, String password) {
    throw UnimplementedError();
  }

  /// Login with email and password
  ResultFuture<User> signInwithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return DataSuccess(userCredential.user!);
    } on FirebaseAuthException catch (error) {
      var errorMessage = "${error.message}";
      return DataFailed(errorMessage);
    }
  }

  /// Register User with email and password
  ResultFuture<User> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return DataSuccess(userCredential.user!);
    } on FirebaseAuthException catch (error) {
      var errorMessage = "${error.message}";
      return DataFailed(errorMessage);
    }
  }

  ///Sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  /*

  Example for implementation


  ResultFuture<void> signInWithFacebook() async {
    String? data;

    if (data != null) {
      return DataSuccess(null);
    } else {
      var exception = const ServerException(
          message: "something went wrong", statusCode: "403");
      return DataFailed(exception.errorMessage);
    }
  }
  */
}
