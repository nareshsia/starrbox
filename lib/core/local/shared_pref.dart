import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _sharedPrefs;

  static Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  // Setters
  static Future<bool> setBool(String key, bool value) => _sharedPrefs.setBool(key, value);
  static Future<bool> setDouble(String key, double value) => _sharedPrefs.setDouble(key, value);
  static Future<bool> setInt(String key, int value) => _sharedPrefs.setInt(key, value);
  static Future<bool> setString(String key, String value) => _sharedPrefs.setString(key, value);
  static Future<bool> setStringList(String key, List<String> value) => _sharedPrefs.setStringList(key, value);

  // Getters
  static bool getBool(String key) => _sharedPrefs.getBool(key) ?? false;
  static double getDouble(String key) => _sharedPrefs.getDouble(key) ?? 0.0;
  static int getInt(String key) => _sharedPrefs.getInt(key) ?? 0;
  static String getString(String key) => _sharedPrefs.getString(key) ?? '';
  static List<String> getStringList(String key) => _sharedPrefs.getStringList(key) ?? [];

  // Removal
  static Future<bool> remove(String key) => _sharedPrefs.remove(key);
  static Future<bool> clear() => _sharedPrefs.clear();
}
