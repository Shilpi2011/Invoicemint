import 'package:shared_preferences/shared_preferences.dart';

class Storage {


  Future<void> setStringData(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }


  Future<String> getStringData(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    try {
      key = pref.getString(key)!;
    } catch (e) {
      key = "";
    }

    return key;
  }

  Future<void> setIntData(String key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future<int> getIntData(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int val = pref.getInt(key)!;
    return val;
  }

  Future<void> setBoolData(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<bool?> getBoolData(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool? val = pref.getBool(key);
    return val;
  }

  Future<void> removeData(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(key);
  }

  Future<void> clearSharedPreferences() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
