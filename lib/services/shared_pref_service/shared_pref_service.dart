import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static const String DEFAULT_KEY = 'something';

  final SharedPreferences sharedPreferences;

  SharedPrefService(this.sharedPreferences);

  Future<void> getDefaultSomething() async {
      var a = this.sharedPreferences.getString(DEFAULT_KEY);

  }

  Future<bool> setDefaultSomething(String parameters) {
    return this
        .sharedPreferences
        .setString(DEFAULT_KEY, parameters);
  }
}
