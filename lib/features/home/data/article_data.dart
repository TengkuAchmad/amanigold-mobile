// PACKAGES
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticleData {

  Future<bool> articlePrefs(BuildContext context, List<dynamic> responseDatas) async {
    try {
      // PREFS INITIATION
      final prefs = await SharedPreferences.getInstance();

      final jsonString = json.encode(responseDatas);

      // DATA EXTRACT
      await prefs.setString("article", jsonString);

      return true;
    } catch (e) {
      return false;
    }
  }

Future<List<Map<String, dynamic>>?> getArticlePrefs(BuildContext context) async {
  try {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString("article");

    final jsonDatas = json.decode(jsonString!);

    final List<Map<String, dynamic>>? responseData = jsonDatas != null ? List<Map<String, dynamic>>.from(jsonDatas) : null;

    return responseData;
  } catch (e) {
    return null;
  }
  }

}
