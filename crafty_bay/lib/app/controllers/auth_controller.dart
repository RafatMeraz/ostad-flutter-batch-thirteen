import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/shared/data/models/user_model.dart';

class AuthController {
  static const String _accessTokenKey = 'access-token';
  static const String _userDataKey = 'user';

  static String? accessToken;
  static UserModel? userModel;

  static Future<void> saveUserData(String token, UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, token);
    await prefs.setString(_userDataKey, jsonEncode(user.toJson()));
    accessToken = token;
    userModel = user;
  }

  static Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString(_accessTokenKey);
    userModel = UserModel.fromJson(jsonDecode(prefs.getString(_userDataKey)!));
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey) != null;
  }

  static Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_userDataKey);
    accessToken = null;
    userModel = null;
  }
}
