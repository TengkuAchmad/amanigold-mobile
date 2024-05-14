// PACKAGES
import 'package:flutter/material.dart';
import 'package:myapp/features/scan/api/cardID_req.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardData {
  Future<bool> cardPrefs(BuildContext context, var responseDatas) async {
    try {
      // PREFS INITIATION
      final prefs = await SharedPreferences.getInstance();

      var ownerData = responseDatas['UUID_UA'];
      var seriData = responseDatas['Seri_CD'];
      var weightData = responseDatas['Weight_CD'];
      var formData = responseDatas['Form_CD'];
      var finenessData = responseDatas['Fineness_CD'];

      await prefs.setString('seri_kartu', seriData);
      await prefs.setString('weight_kartu', weightData.toString());
      await prefs.setString('form_kartu', formData);
      await prefs.setString('fineness_kartu', finenessData.toString());
      
      // ignore: use_build_context_synchronously
      var savedOwnerData = await CardIDReq().CardIDRequest(context, ownerData);

      if (savedOwnerData) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}