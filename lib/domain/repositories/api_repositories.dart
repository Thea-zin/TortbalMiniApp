import 'package:firebase_auth/firebase_auth.dart';
import 'package:thortbal/core/utils/typedefs.dart';

abstract class ApiRepositories {
  Future<void> login(String username, String password);
  Future<void> signInWithGmail(String username, String password);
  ResultFuture<User> signInWithEmailAndPassword(String email, String password);
  ResultFuture<User> createUserwithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<User?> signInWithPhoneNumber(String otpCode);
  ResultFuture<UserCredential> signInWithGoogle();
  // Future<void> signInWithFacebook(String username, String password);
  // Future<void> matching(userID);
}
