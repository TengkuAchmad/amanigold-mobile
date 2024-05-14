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
        await prefs.setString('photo', responseDatas['Photo_UA']);

        //  if (responseDatas['Photo_UA'] != null)w  {
        //   await prefs.setString('photo', responseDatas['Photo_UA']);
        // } else {
        //   await prefs.setString('photo', 'default_photo_url');
        // }

        final userData = responseDatas['UserData'][0];
        final goldUD = userData['Gold_UD'];
        final balanceUD = userData['Balance_UD'];

        await prefs.setString('user_gold', goldUD.toString());
        await prefs.setString('user_balance', balanceUD.toString());
          
        return true;
      } catch (e) {
        return false;
      }
    }
  }

