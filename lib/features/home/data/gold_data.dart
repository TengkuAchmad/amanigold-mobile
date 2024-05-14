// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:myapp/features/home/api/gold_request.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoldData {
  Future<bool> goldPrefs(BuildContext context, var responseDatas) async {
    try {
      // PREFS INITIATION
      final prefs = await SharedPreferences.getInstance();

      final List<dynamic> data = responseDatas['data'];

      for (var item in data) {
        await prefs.setInt("gold_sell", item['sell']);
        await prefs.setInt("gold_buy", item['buy']);
      }

      // UPDATE THE DATA
      await GoldReq().goldUpdateRequest(context);

      return true;
    } catch (e) {
      return false;
    }
  }

  // DATA VALIDATOR
  Future<bool> goldValidator(BuildContext context, var responses) async {
    try {
      // GET INITIAL PREFERENCES
      final prefs = await SharedPreferences.getInstance();

      final int? goldSell = prefs.getInt("gold_sell");
      final int? goldBuy = prefs.getInt("gold_buy");


      // CHECKING FOR DATA COMPARISON
      var newGoldSell = responses;

      for (var item in newGoldSell) {
        if (item['Sell_GD'] != goldSell && item['Buy_GD'] != goldBuy){
          GoldReq().goldUpdateSavedRequest(context, item['Sell_GD'], item['Buy_GD']);
        } else {
          // SAVING DATA
          await prefs.setInt("gold_sell", item['Sell_GD']);
          await prefs.setInt("gold_buy", item['Buy_GD']);
          DateTime goldDatetime = DateTime.parse(item['createdAt']);
          String formattedDate = DateFormat("yyyy-MM-dd HH:mm").format(goldDatetime);
          await prefs.setString('gold_datetime', formattedDate);
        }
      }

      return true;
      
    } catch (e) {
      return false;
    }
  }
}