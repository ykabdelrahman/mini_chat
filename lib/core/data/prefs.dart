import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static setString(String key, String value) {
    _instance.setString(key, value);
  }

  static getString(String key) {
    return _instance.getString(key);
  }

  static remove(String key) {
    _instance.remove(key);
  }

  static setBool(String key, bool value) {
    _instance.setBool(key, value);
  }

  static bool getBool(String key) {
    return _instance.getBool(key) ?? false;
  }
}
