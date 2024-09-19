import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final String accessToken = "accessToken";
  final String showOnboard = "showOnboard";

  Future<void> saveString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? value = pref.getString(key);
    return value;
  }

  Future<void> saveBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool? value = pref.getBool(key);
    return value;
  }

  Future<void> pushAccessToken(String token) async {
    saveString(accessToken, token);
  }

  Future<String?> pullAccessToken() async {
    return getString(accessToken);
  }

  Future<void> pushShowOnboard(bool show) async {
    saveBool(showOnboard, show);
  }

  Future<bool?> pullShowOnBoard() async {
    return getBool(showOnboard);
  }
}
