import 'package:shared_preferences/shared_preferences.dart';

abstract class ISharedPreference {
  static Future<bool> setString(String key, String value) {
    return SharedPreferences.getInstance().then((prefs) => prefs.setString(key, value));
  }

  static Future<String> getString(String key, {String defaultValue = ''}) {
    return SharedPreferences.getInstance().then((prefs) => prefs.getString(key) ?? defaultValue);
  }
}
