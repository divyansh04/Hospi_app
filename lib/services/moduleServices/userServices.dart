import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../networkEngine.dart';

class UserService {
  //Maintain a global variable throughout the app
  // User _user;

  // User get user => this._user;


  UserService() {}

  // Future<User> getAuthUser() async {
  //   this._user = FirebaseAuth.instance.currentUser;
  //   await setUser(this._user);
  //   return this._user;
  // }

  // Future<void> setUser(User userEvent) async {}

  // //logout User from the app
  // logoutUser() async {
  //   this._user = null;
  //   try {
  //     await FirebaseAuth.instance.signOut();
  //     await GoogleSignIn().signOut();
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

}
