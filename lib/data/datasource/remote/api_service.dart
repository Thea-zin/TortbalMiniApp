import 'package:firebase_auth/firebase_auth.dart';
import 'package:thortbal/core/utils/typedefs.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ApiService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
 String? _verificationId;
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


  ///Authentication with google 
  ResultFuture<UserCredential> signInWithGoogle()async {
    try{
      final GoogleSignInAccount? gUser =await GoogleSignIn().signIn(); 
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      final user=await _firebaseAuth.signInWithCredential(credential);
      return  DataSuccess(user);

    }
    catch (e){
      var errorMessage = "${e.toString()}";
      return DataFailed(errorMessage);
    
  }
  }


  /// Authentication with phone number
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    try{
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
      
       
      
    }
    catch(e){
        print(e.toString());
    }
  
  }

  Future <User?>signInWithPhoneNumber(String otpCode) async{
    if(_verificationId==null)
    {
      throw StateError("_VerificationId is null");

    }

    try{
      PhoneAuthCredential credential= PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otpCode,
      );
      UserCredential userCredential= await _firebaseAuth.signInWithCredential(credential);

      return userCredential.user;
      

    }
    on FirebaseException catch(e){
      print("error : $e");
    }


    return null;
  }


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
