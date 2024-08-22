import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_screen_task/app/services/repository/data_manager_imp.dart';
import 'package:login_screen_task/core/utils/custom_snack_bar.dart';
import 'package:login_screen_task/core/utils/firebase/firebase_crud_helper.dart';

class DataManager implements DataManagerImp {
  // Private constructor
  DataManager._();

  // Singleton instance
  static final DataManager instance = DataManager._();

  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  // final _firebaseMessaging = FirebaseMessaging.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  ///-- Authentications Start

  // @override
  // Future<User?> createUserWithEmailAndPassword({
  //   required String email,
  //   required String password,
  //   required UserModel userModel,
  // }) async {
  //   User? user;
  //   await handleFirebaseRequest(() async {
  //     final deviceToken = await _firebaseMessaging.getToken();
  //     UserCredential userCredential = await _auth
  //         .createUserWithEmailAndPassword(email: email, password: password);
  //     user = userCredential.user;
  //     final userData = UserModel(
  //       userId: userCredential.user?.uid,
  //       fullName: userModel.fullName,
  //       userName: userModel.userName,
  //       email: email,
  //       deviceToken: deviceToken,
  //       profileImage: userModel.profileImage,
  //       phoneNumber: userModel.phoneNumber,
  //       gender: userModel.gender,
  //       address: userModel.address,
  //       country: userModel.country,
  //     ).toJson();
  //
  //     if (user != null) {
  //       await FirebaseCurdHelper.instance.createDocument(
  //           collection: _fireStore.collection('users'),
  //           docId: user?.uid ?? '',
  //           data: userData);
  //     }
  //   });
  //   return user;
  // }

  @override
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    User? user;
    await handleFirebaseRequest(() async {
      // final deviceToken = await _firebaseMessaging.getToken();
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      // if (user?.uid != null) {
      //   await _fireStore
      //       .collection('users')
      //       .doc(userCredential.user?.uid)
      //       .update(UserModel(deviceToken: deviceToken).toJson());
      // }
    });
    return user;
  }

  // @override
  // Future<void> forgotPassword({required String email}) async =>
  //     await handleFirebaseRequest(() async =>
  //         await FirebaseAuth.instance.sendPasswordResetEmail(email: email));

  /// Social Authentication

  ///! Note: for google authentication you need to add SHA key inside the firebase
  /// Command to generate SHA
  ///! ./gradlew signingReport
  /// If you face this issue: //! gradle:compileGroovy FAILED error
  /// Make sure to update the gradle version inside android/gradle/wrapper/gradle-wrapper.properties
  // @override
  // Future<UserCredential?> signInWithGoogle() async {
  //   UserCredential? userCredential;
  //   await handleFirebaseRequest(() async {
  //     /// Logout the user if already sing in with google
  //     if (await _googleSignIn.isSignedIn()) await _googleSignIn.signOut();
  //
  //     /// Trigget the google authentication flow
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     if (googleUser != null) {
  //       final GoogleSignInAuthentication googleAuth =
  //           await googleUser.authentication;
  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //           accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  //       // Sign in with Firebase using Google credentials
  //       final googleCredential = await _auth.signInWithCredential(credential);
  //       userCredential = googleCredential;
  //     }
  //   });
  //
  //   return userCredential;
  // }

  ///
  // @override
  // Future<UserCredential?> signInWithFacebook() async {
  //   UserCredential? userCredential;
  //   await handleFirebaseRequest(() async {
  //     /// Trigger the sign-in flow
  //     final LoginResult result = await FacebookAuth.instance.login();
  //     if (result.status == LoginStatus.success) {
  //       /// Create a credential from the access token
  //       final facebookAuthCredential =
  //           FacebookAuthProvider.credential(result.accessToken?.token ?? '');
  //
  //       /// Once signed in, return the UserCredential
  //       userCredential =
  //           await _auth.signInWithCredential(facebookAuthCredential);
  //     }
  //   });
  //   return userCredential;
  // }

  ///
  // @override
  // Future<UserCredential?> signInWithApple() async {
  //   UserCredential? userCredential;
  //   await handleFirebaseRequest(() async {
  //     final appleCredential =
  //         await SignInWithApple.getAppleIDCredential(scopes: [
  //       AppleIDAuthorizationScopes.email,
  //       AppleIDAuthorizationScopes.fullName,
  //     ]);
  //
  //     final AuthCredential appleAuthCredential =
  //         OAuthProvider('apple.com').credential(
  //       idToken: appleCredential.identityToken,
  //       accessToken: appleCredential.authorizationCode,
  //     );
  //
  //     /// Once you are successful in generating Apple Credentials,
  //     /// We pass them into the Firebase function to finally sign in.
  //     userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(appleAuthCredential);
  //   });
  //
  //   return userCredential;
  // }

  ///
  @override
  Future<void> signOut() async => await handleFirebaseRequest(() async {
        print('User id: ${_auth.currentUser?.uid}');

        await _auth.signOut();
        //     .then((_) async {
        //   if (await _googleSignIn.isSignedIn()) {
        //     await _googleSignIn.signOut();
        //   }
        // });
        print('User id:: ${_auth.currentUser?.uid}');
      });

  ///-- Authentications End

  /// This method is responsible for executing and handling Firebase operations
  Future<T?> handleFirebaseRequest<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on FirebaseException catch (e) {
      final errorMessage =
          FirebaseCurdHelper.instance.getFirestoreErrorMessage(e);
      CustomSnackBar.error(errorMessage);
      return null;
    } catch (e) {
      CustomSnackBar.error(e.toString());
      return null;
    }
  }
}
