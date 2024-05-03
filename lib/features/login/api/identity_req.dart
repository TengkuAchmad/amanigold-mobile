// ignore_for_file: use_build_context_synchronously
// PACKAGES
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';

// CONFIG
import 'package:myapp/config/url_config.dart';

// WIDGETS
import 'package:myapp/features/login/data/identity_data.dart';

class IdentityReq {
  Future<bool> identityRequest(BuildContext context) async {

      // DIO CONFIG
      Dio dio = Dio();

      // DIO INTERCEPTOR
      dio.interceptors.add(CookieManager(CookieJar()));

      // URL
      var url = UrlConfig.identityUrl;

      // PREF
      String bearerToken = await IdentityData().getIdentity();

      // REQUEST
      var response = await dio.get(
        url,
        options: Options(headers: {'Authorization' : 'Bearer $bearerToken'}), 
      );

      // RESPONSE CHECK
      if (response.statusCode == 200){
        bool userDataSaved = 
          await IdentityData().identityPrefs(context, response.data);
        if (userDataSaved){
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
  }
}

