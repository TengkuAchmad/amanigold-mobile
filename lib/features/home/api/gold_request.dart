// ignore_for_file: use_build_context_synchronously

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:myapp/config/url_config.dart';
import 'package:myapp/features/home/data/gold_data.dart';
import 'package:myapp/features/login/data/identity_data.dart';

class GoldReq {
  Future<bool> goldRequest(BuildContext context) async {
    // DIO CONFIG
    Dio dio =  Dio();

    // DIO INTERCEPTORS
    dio.interceptors.add(CookieManager(CookieJar()));

    // REQUEST
    var url = UrlConfig.getGold;

    var response = await dio.get(url);

    // RESPOSES CHECK  
    if (response.statusCode == 200){
      bool goldDataSaved = await GoldData().goldPrefs(context, response.data);
      if (goldDataSaved) {
        return true;
      } else {
        return false;
      }

    } else {
      return false;
    }
  }

  Future<bool> goldUpdateRequest(BuildContext context) async {
    try {
      // DIO CONFIG
      Dio dio =  Dio();

      // DIO INTERCEPTORS
      dio.interceptors.add(CookieManager(CookieJar()));

      // REQUEST
      var url = UrlConfig.getGoldServer;

      // PREF
      String bearerToken = await IdentityData().getIdentity();

      var response = await dio.get(url,
        options:  Options(headers: {'Authorization' : 'Bearer $bearerToken'}));

      if (response.statusCode == 200) {
        var savedData = await GoldData().goldValidator(context, response.data);
        if (savedData) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> goldUpdateSavedRequest(BuildContext context, int Sell, int Buy) async {
    try {
      // DIO CONFIG
      Dio dio =  Dio();

      // DIO INTERCEPTORS
      dio.interceptors.add(CookieManager(CookieJar()));

      // REQUEST
      var url = UrlConfig.getGoldServer;

      // PREF
      String bearerToken = await IdentityData().getIdentity();

      // PARAMS
      var params = {
        'sell': Sell,
        'buy' : Buy,
        'type': 'Antam'
      };
      
      var response = await dio.post(url, data: params,
        options:  Options(headers: {'Authorization' : 'Bearer $bearerToken'}));

      if (response.statusCode == 200) {
        await goldUpdateRequest(context);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}