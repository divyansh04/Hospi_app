import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import '../serviceLocator.dart';


class LocalStorageService {
  static LocalStorageService _instance;
  static SharedPreferences _preferences;

  /// Contains [bool] value about onboarding screen visited
  static const String ONBOARDING_KEY = 'onboarding flag';
  /// stores version of type [string].
  static const String SOME_KEY = "some_key";


  /// gives the instance of [LocationStorageService]
  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }
    if (_preferences == null) {
      _preferences = sl.get<SharedPreferences>();
      // listVersionManager = OfflineListVersionManager(_preferences);
    }
    return _instance;
  }

  /// Sets latest airport location
  Future<bool> addData(String someValue) async {
    return _preferences.setString(SOME_KEY, someValue);
  }

  /// Returns latest emergency airport
  Future<String> getData() async {
   var value;
  //  some processing
   
   return value;
  }
  /// Sets the value of onboarding screen [visited]
  ///
  /// defaults to true
  Future<void> markOnBoardingAsVisited({bool visited = true}) async {
    assert(visited != null);
    await _preferences.setBool(ONBOARDING_KEY, visited);
  }

  /// returns true if onBoarding screen is visited
  bool checkIfOnBoardingVisited() {
    try {
      return _preferences.getBool(ONBOARDING_KEY) ?? false;
    } catch (e) {
      return false;
    }
  }
}
