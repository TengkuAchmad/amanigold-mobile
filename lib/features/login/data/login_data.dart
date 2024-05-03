// PACKAGES
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginData {
  Future<bool> loginPrefs(BuildContext context, var responseDatas) async {
    try {

      // PREFS INITIATION
      final prefs = await SharedPreferences.getInstance();

      var accessToken = responseDatas['accessToken'];

      await prefs.setString('accessToken', accessToken);

      return true;
    } catch (e) {
      return false;
    }
  }
}