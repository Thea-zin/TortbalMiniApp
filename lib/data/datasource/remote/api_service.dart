import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thortbal/core/utils/typedefs.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class ApiService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? _verificationId;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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
      await _createUsercollection(userCredential.user);
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

  ///Authentication with google
  ResultFuture<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      final user = await _firebaseAuth.signInWithCredential(credential);
      await _createUsercollection(user.user);
      return DataSuccess(user);
    } catch (e) {
      var errorMessage = "${e.toString()}";
      return DataFailed(errorMessage);
    }
  }

  /// Authentication with phone number
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _firebaseAuth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            print("Verfication failed:${e.message} ");
          },
          codeSent: (String verificationID, int? resendtoken) {
            print('user token $verificationID');
            _verificationId = verificationID;
          },
          codeAutoRetrievalTimeout: (String verificationID) {
            print("Timeout");
          });
    } catch (e) {
      print(e.toString());
    }
  }

  ///Verify OTPsent
  Future<User?> signInWithPhoneNumber(String otpCode) async {
    if (_verificationId == null) {
      throw StateError("_VerificationId is null");
    }

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otpCode,
      );
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      await _createUsercollection(userCredential.user);
      return userCredential.user;
    } on FirebaseException catch (e) {
      print("error : $e");
    }

    return null;
  }

  ///Create user collection
  Future<void> _createUsercollection(User? user) async {
    if (user != null) {
      final userRef = _firestore.collection('user').doc(user.uid);
      final userData = {
        'displayName': user.displayName,
        'email': user.email,
        'phoneNumber': user.phoneNumber,
        'userid': user.uid,
      };
      await userRef.set(userData, SetOptions(merge: true));
      print("successfully sent user data");
    } else {
      print("error create user collection");
    }
  }

  ///Signup

  ///Signup With email and Password
  ResultFuture<User> signupwithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      await _createUsercollection(userCredential.user);
      return DataSuccess(userCredential.user!);
    } on FirebaseAuthException catch (error) {
      var errorMessage = "${error.message}";
      return DataFailed(errorMessage);
    }
  }

  ResultFuture<UserCredential> signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      final user = await _firebaseAuth.signInWithCredential(credential);
      await _createUsercollection(user.user);
      return DataSuccess(user);
    } catch (e) {
      var errorMessage = "${e.toString()}";
      return DataFailed(errorMessage);
    }
  }

Future<UserCredential?> signInWithFacebook() async {
    try {
      print("Login using Facebook");
      final user;
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['email'],
       // loginBehavior: LoginBehavior.dialogOnly, // show an authentication dialog instead of redirecting to Facebook app
      );

      if (result.status == LoginStatus.success) {
        // Create a credential from the access token
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.tokenString);
        // Once signed in, return the UserCredential
          print("success");
           user=await FirebaseAuth.instance.signInWithCredential(credential);
         }
      else{
        print("wrong again");
      }
      
   
    } catch (e) {
     var errorMessage = "${e.toString()}";
     print('facebook error login');
    }
  }
}
/*Example for implementation


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
