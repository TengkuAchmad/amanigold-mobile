// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:myapp/features/home/api/article_request.dart';
import 'package:myapp/features/home/api/gold_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeValidator {
  Future<bool> homeValidator(BuildContext context) async {
    try {

      // PREFS INITIATION
      final prefs = await SharedPreferences.getInstance();

      // DATA CHECKING
      // 1. ARTICLE
      String? article = prefs.getString('article');
      if (article == null) {
        await ArticleReq().articleRequest(context);
      }

      // 2. GOLD RATE
      int? goldSell = prefs.getInt('gold_sell');
      int? goldBuy = prefs.getInt('gold_buy');
      String? goldDatetime = prefs.getString('gold_datetime');

      if (goldSell == null || goldBuy == null || goldDatetime == null) {
        await GoldReq().goldRequest(context);
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}