import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  static const String TOKEN_ID = 'tokenId';

  //* Set Token ID..
  static setTokenId({required String token}) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString(TOKEN_ID, token);
  }

  //* Get Token Id..
  static Future<String> getTokenId() async {
    var pref = await SharedPreferences.getInstance();
    var check = pref.getString(TOKEN_ID);
    return check ?? "";
  }

  static Future<bool> removeToken() async {
    var pref = await SharedPreferences.getInstance();

    var check = await pref.remove(TOKEN_ID);
    await pref.clear();
    return check;
  }
}
