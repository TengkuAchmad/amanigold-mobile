// ignore_for_file: use_build_context_synchronously

// PACKAGES
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

// CONFIG
import 'package:myapp/config/url_config.dart';

// WIDGETS
import 'package:myapp/features/login/data/login_data.dart';
import 'package:myapp/features/login/data/login_validator.dart';

class LoginReq {
  Future<bool> loginRequest(BuildContext context, String email, String password) async {

    try {
      // DIO CONFIG
      Dio dio = Dio();

      // DIO INTERCEPTOR
      dio.interceptors.add(CookieManager(CookieJar()));

      // URL
      var url = UrlConfig.loginUrl;

      if (email.isEmpty || password.isEmpty){
        return false;
      }

      // REQUEST DATA
      var params = {
        "email": email,
        "password": password
      };

      // REQUEST
      var response = await dio.post(url, data: params);

      // DATA CONTROL

      // RESPONSE CHECK
      if (response.statusCode == 200){
        bool loginSuccess = await LoginData().loginPrefs(context, response.data);

        if (loginSuccess) {
          return true;
        } else {
          return false;
        }
        
      } else {
        return false;
      }
    } catch (error) {
        return false;
    }
  }
}
