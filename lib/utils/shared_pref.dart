import 'package:onecart_user_app/utils/shared_pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerCache {
  final SharedPreferences sharedPreferences;

  CustomerCache({required this.sharedPreferences});

  void setIsLoggedIn(bool boolValue) async {
    await sharedPreferences.setBool(CacheKeys.isLoggedIn, boolValue);
  }

  Future<bool?> getIsLoggedIn(String key) async {
    return sharedPreferences.getBool(CacheKeys.isLoggedIn);
  }

  Future<bool> clearData(String key) async {
    sharedPreferences.get(key);
    sharedPreferences.clear();
    return true;
  }

  Future<bool> clearAll() async {
    sharedPreferences.clear();
    return true;
  }

  Future clearKeys() async {
    sharedPreferences.getKeys();
    for (String key in sharedPreferences.getKeys()) {
      if (key != "cartMap") {
        sharedPreferences.remove(key);
      }
    }
  }
}
