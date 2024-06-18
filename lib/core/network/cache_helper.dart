import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static Future<bool> init() async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      return true; // Initialization succeeded
    } catch (e) {
      return false; // Initialization failed
    }
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    return await sharedPreferences!.setString(key, value);
  }

  static Future<bool>? saveDataInt({
    required String key,
    required int value,
  }) async {
    // ignore: unnecessary_type_check
    if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    } else {
      return false;
    }
  }

  static String? getData({
    required String key,
  }) {
    return sharedPreferences!.getString(key);
  }

  static int? getDataInt({
    required String key,
  }) {
    return sharedPreferences!.getInt(key);
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences!.remove(key);
  }

  static Future<bool> clear() async {
    return await sharedPreferences!.clear();
  }
}