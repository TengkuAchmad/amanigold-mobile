// ignore_for_file: use_build_context_synchronously
// PACKAGES
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

// CONFIG
import 'package:myapp/config/url_config.dart';
import 'package:myapp/features/home/view/home_screen.dart';

// WIDGETS
import 'package:myapp/features/login/app/responses/failureRes.dart';

class LoginReq {
  void loginRequest(BuildContext context, String email, String password) async {

    try {
      // DIO CONFIG
      Dio dio = Dio();

      // DIO INTERCEPTOR
      dio.interceptors.add(CookieManager(CookieJar()));

      // URL
      var url = UrlConfig.loginUrl;

      if (email.isEmpty || password.isEmpty){
        showDialog(context: context, builder: (context) {
          return const FailureResponsesWidget(errorMessage: "Oops, email atau password tidak boleh kosong.");
        });
        return;
      }

      // REQUEST DATA
      var params = {
        "email": email,
        "password": password
      };

      // REQUEST
      var response = await dio.post(url, data: params);

      // RESPONSE CHECK
      if (response.statusCode == 200){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
      } else {
        showDialog(context: context, builder: (context) {
          return const FailureResponsesWidget(errorMessage: "Oops, email atau password salah.");
        });
      }
    } catch (error) {
      showDialog(context: context, builder: (context) {
          return const FailureResponsesWidget(errorMessage: "Request Invalid");
        });
    }
  }
}
