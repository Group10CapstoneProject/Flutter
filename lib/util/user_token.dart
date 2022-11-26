import 'package:shared_preferences/shared_preferences.dart';

class UserToken{

  static String serverEndpoint = "http://dev.rnwxyz.codes/api/v1";

  static String? accessToken;

  static const String refreshTokenKey = 'REFRESH_TOKEN_KEY';

  static Future<String?> getRefreshKey() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(refreshTokenKey);
  }

  static Future<void> setRefreshKey(String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(refreshTokenKey, value);
  }



}