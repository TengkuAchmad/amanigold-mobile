// ignore_for_file: use_build_context_synchronously
// PACKAGES
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

// CONFIG
import 'package:myapp/config/url_config.dart';

class RegisterReg {
  Future<bool> registerRequest(BuildContext context, String email, String password, String name, String phone) async {
    try {
      // DIO CONFIG
      Dio dio = Dio();

      // DIO INTERCEPTOR
      dio.interceptors.add(CookieManager(CookieJar()));
      
      // URL
      var url = UrlConfig.registerUrl;

      // PARAMS
      var params = {
        "email": email,
        "password": password,
        "name": name,
        "phone": phone
      };

      // REQUEST
      var response = await dio.post(url, data: params);

      if (response.statusCode == 201){
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}