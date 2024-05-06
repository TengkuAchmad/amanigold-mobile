// PACKAGES
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserGoldData {
  Future<bool> goldPrefs(BuildContext context, var responseDatas) async {
    try {
      // PREFS INITIATION
      final prefs = await SharedPreferences.getInstance();

      final jsonString = json.encode(responseDatas);

      await prefs.setString("gold", jsonString);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Map<String, dynamic>>?> getGoldPrefs(BuildContext context) async {
  try {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString('gold');

    if (jsonString != null) {
      final jsonData = json.decode(jsonString);
      final List<Map<String, dynamic>> responseData = List<Map<String, dynamic>>.from(jsonData['data']);
      
      final List<Map<String, dynamic>> modifiedData = responseData.map((item) {
      final formatter = NumberFormat('#,##0', 'id_ID');
      final String formattedSell = formatter.format(item['sell']);
      final String formattedBuy = formatter.format(item['buy']);

      return {
        'sell': formattedSell,
        'buy': formattedBuy,
        'type': item['type']
      };
      }).toList();

      return modifiedData;

    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}

}