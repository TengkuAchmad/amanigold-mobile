import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IdentityData {
  Future<String> getIdentity() async {
    final prefs = await SharedPreferences.getInstance();

    final accessToken = prefs.getString('accessToken') ?? '';

    return accessToken;
  }

  Future<bool> identityPrefs(BuildContext context, var responseDatas) async {
    try {
      // PREFS INITIATION
      final prefs = await SharedPreferences.getInstance();

      // DATA EXTRACT
      await prefs.setString('id', responseDatas['UUID_UA']);
      await prefs.setString('name', responseDatas['Name_UA']);
      await prefs.setString('phone', responseDatas['Phone_UA']);
      await prefs.setString('email', responseDatas['Email_UA']);
      
      return true;
    } catch (e) {
      return false;
    }
  }
}

