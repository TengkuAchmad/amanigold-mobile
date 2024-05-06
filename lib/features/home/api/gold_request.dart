import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:myapp/config/url_config.dart';
import 'package:myapp/features/home/data/gold_data.dart';

class GoldReq {
  Future<bool> userGoldRequest(BuildContext context) async {
    // DIO CONFIG
    Dio dio =  Dio();

    // DIO INTERCEPTORS
    dio.interceptors.add(CookieManager(CookieJar()));

    var logger = Logger();

    // REQUEST
    var url = UrlConfig.getGold;

    var response = await dio.get(url);
    
    logger.i(response.data);

    // RESPOSES CHECK  
    if (response.statusCode == 200){
      // ignore: use_build_context_synchronously
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
}