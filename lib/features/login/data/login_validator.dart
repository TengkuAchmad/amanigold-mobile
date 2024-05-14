import 'package:flutter/material.dart';
import 'package:myapp/features/login/api/identity_req.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginValidator {
  Future<bool> loginValidator(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      bool? accessToken = prefs.containsKey('accessToken');
      if (accessToken) {
        if (!prefs.containsKey('id') ||
            !prefs.containsKey('name') ||
            !prefs.containsKey('email') ||
            !prefs.containsKey('phone') ||
            !prefs.containsKey('user_gold') ||
            !prefs.containsKey('user_balance')) {
          // ignore: use_build_context_synchronously
          bool savingUserIdentity = await IdentityReq().identityRequest(context);
          return savingUserIdentity; 
        } else {
          return true; 
        } 
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
