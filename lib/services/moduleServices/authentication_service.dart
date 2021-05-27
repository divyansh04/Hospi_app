
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../networkEngine.dart';
import '../serviceLocator.dart';
import 'userServices.dart';

enum AuthStatus { AUTHENTICATED, NO_PHONE_AUTH, NO_EMAIL_AUTH, NO_AUTH }

class AuthenticationService {
  static String referral;

  ///
  /// Checks if the user has logged in correctly with 2 authentication
  /// If user has email and phone number, it directs user to Dashboard
  /// otherwise returns current AuthStatus
  ///
  Future<AuthStatus> logUserIntoApp(BuildContext context,
      {bool newAccount = true}) async {
    // User user = await sl.get<UserService>().getAuthUser();
    // if (user == null) {
    //   return AuthStatus.NO_AUTH;
    // } else if (user.email == null) {
    //   return AuthStatus.NO_EMAIL_AUTH;
    // } else if (user.phoneNumber == null) {
    //   return AuthStatus.NO_PHONE_AUTH;
    // } else {
    //   await _giveAccess(context, createEntry: newAccount);
    //   return AuthStatus.AUTHENTICATED;
    // }
  }

  /// Returns Map<String, dynamic>
  /// ```
  /// {
  ///   'success': false,
  ///   'message': 'Currently we are facing some issues.\nPlease try again later.'
  /// }
  /// ```
 
  Future<void> _giveAccess(BuildContext context,
) async {

  }

  ///
  /// Adds Name, Email & Password to the current user
  ///
  Future<String> createPassword(
      String name, String email, String password) async {

  }


  ///
  /// Logs in user with his email and password.
  ///
  Future<String> logInWithEmail(String email, String password) async {
    // String errorMessage;
    // try {
    //   UserCredential userCredentials = await FirebaseAuth.instance
    //       .signInWithEmailAndPassword(email: email, password: password);
     
    //   await sl.get<UserService>().setUser(userCredentials.user);
    // } on FirebaseAuthException catch (e) {
    //   //Auth failed
 
    //   switch (e.code) {
    //     case 'invalid-email':
    //       errorMessage = "Your email address appears to be malformed.";
    //       break;
    //     case 'wrong-password':
    //       errorMessage = "Your password is wrong.";
    //       break;
    //     case 'user-not-found':
    //       errorMessage = "User with this email doesn't exist.";
    //       break;
    //     case 'user-disabled':
    //       errorMessage = "User with this email has been disabled.";
    //       break;
    //     default:
    //       errorMessage = 'Oops! Please enter the correct credentials.';
    //   }
    // } catch (e) {
    //   errorMessage = 'Seems like you entered wrong credentials';
    // }
    // if (errorMessage != null) {
    //   return errorMessage;
    // } else {
    //   return 'success';
    // }
  }

  ///
  /// Sign In User via google
  ///
  Future<String> signInWithGoogle() async {
    // String errorMessage;
    // try {
    //   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    //   if (googleUser == null) {
    //     return 'Sign-in Aborted';
    //   }
    //   final GoogleSignInAuthentication googleAuth =
    //       await googleUser.authentication;
    //   final AuthCredential credential = GoogleAuthProvider.credential(
    //     accessToken: googleAuth.accessToken,
    //     idToken: googleAuth.idToken,
    //   );
    //   UserCredential result =
    //       await FirebaseAuth.instance.signInWithCredential(credential);
    //   await sl.get<UserService>().setUser(result.user);
    // } on FirebaseAuthException catch (e) {
    //   errorMessage = e.code;
    // } catch (e) {
    //   errorMessage = 'There was some error in sign-in with google.';
    // }
    // if (errorMessage != null) {
    //   return errorMessage;
    // } else {
    //   return 'success';
    // }
  }


  Future<String> checkIfEmailExists(String email) async {
    // try {
    //   List<String> providers =
    //       await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
    //   if (providers != null && providers.isNotEmpty) {
    //     return "Email already exists";
    //   } else {
    //     return "success";
    //   }
    // } catch (e) {
    //   print(e.toString());
    //   if (e.iata == "invalid-email") {
    //     return "Incorrect mail address entered";
    //   } else {
    //     return e.toString();
    //   }
    // }
  }
}
