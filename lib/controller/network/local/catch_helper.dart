import 'package:shared_preferences/shared_preferences.dart';

//CacheHelper That's Connect and Talk to local database.
class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //Here The Initialize of cache .
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

// this fun to put data in local data base using key
  static Future<bool> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }

    return await sharedPreferences.setInt(key, value);
  }

// this fun to get data already saved in local data base
  static dynamic get({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }
}
