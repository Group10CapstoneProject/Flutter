import 'package:capstone_alterra_flutter/model/members_detail_model.dart';
import 'package:capstone_alterra_flutter/model/user_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserToken {
  static String serverEndpoint = "https://dev.rnwxyz.codes/api/v1";

  static String? accessToken;

  static const String refreshTokenKey = 'REFRESH_TOKEN_KEY';

  static Future<String?> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(refreshTokenKey);
  }

  static Future<void> setRefreshToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(refreshTokenKey, value);
  }

  static Future<bool> deleteRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(refreshTokenKey);
  }

  static UserProfileModel? userProfileModel;
  static MembersDetailModel? membersDetailModel;
}
