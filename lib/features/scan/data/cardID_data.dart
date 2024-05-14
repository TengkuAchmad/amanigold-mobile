// PACKAGES
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardIDData {
  Future<bool> cardIDDataPrefs(BuildContext context, var responseDatas) async {
    try {
      // PREFS INITIATION
      final prefs = await SharedPreferences.getInstance();

      var cardUserName = responseDatas['Name_UA'];

      await prefs.setString('owner_kartu', cardUserName);
      
      return true;
    } catch (e) {
      return false;
    }
  }
}