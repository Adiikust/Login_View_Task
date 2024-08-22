import 'package:firebase_auth/firebase_auth.dart';

abstract class DataManagerImp {
  ///-- Authentications Start
  // Future<void> createUserWithEmailAndPassword(
  //     {required String email,
  //     required String password,
  //     required UserModel userModel});
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password});
  // Future<void> forgotPassword({required String email});

  /// Social Authentication
  // Future<UserCredential?> signInWithGoogle();
  // Future<UserCredential?> signInWithFacebook();
  // Future<UserCredential?> signInWithApple();

  Future<void> signOut();

  ///-- Authentications End
}
