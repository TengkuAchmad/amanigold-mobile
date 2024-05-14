// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:myapp/features/home/data/home_validator.dart';
import 'package:myapp/features/login/data/login_validator.dart';

class DataController {
  Future<bool> dataValidator(BuildContext context) async {
    
    bool loginValid = await LoginValidator().loginValidator(context);

    bool homeValid = await HomeValidator().homeValidator(context);

    if (loginValid && homeValid) {
      return true;
    } else {
      return false;
    }
  }
}