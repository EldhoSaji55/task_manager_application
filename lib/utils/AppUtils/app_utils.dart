import 'package:shared_preferences/shared_preferences.dart';

class AppUtils {
  static Future getstoredAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedToken = prefs.getString("userId") ?? "";
    return storedToken;
  }

  static Future<void> removeuser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
