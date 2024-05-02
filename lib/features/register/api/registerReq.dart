// ignore_for_file: use_build_context_synchronously
// PACKAGES
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:logger/logger.dart';

// CONFIG
import 'package:myapp/config/url_config.dart';

// WIDGETS
import 'package:myapp/features/register/app/responses/failureRes.dart';
import 'package:myapp/features/register/app/responses/successRes.dart';



class RegisterReg {
  void registerRequest(BuildContext context, String email, String password, String name, String phone) async {
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
        showDialog(context: context, builder: (context) {
          return const SuccessResponseWidget(successMessage: "Registrasi berhasil, coba login...");
        });
      } else {
        showDialog(context: context, builder: (context) {
          return const FailureResponsesWidget(errorMessage: "Oops, email atau password salah.");
        });
      }
    } catch (error) {
      var logger = Logger();
      logger.i(error);
      showDialog(context: context, builder: (context) {
          return const FailureResponsesWidget(errorMessage: "Request Invalid");
        });
    }
  }
}